<?php
require_once( APPPATH .'libraries/REST_Controller.php' );

/**
 * REST API for News
 */
class Discounts extends API_Controller
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Discount' );
		$this->load->library( 'PS_Delete' );
	}

	/**
	 * Default Query for API
	 * @return [type] [description]
	 */
	function default_conds()
	{
		$conds = array();

		if ( $this->is_get ) {
		// if is get record using GET method

			// get default setting for GET_ALL_Discounts
			// $setting = $this->Api->get_one_by( array( 'api_constant' => "GET_ALL_Discounts" ));

			$conds['order_by'] = 1;
			$conds['order_by_field'] = $setting->order_by_field;
			$conds['order_by_type'] = $setting->order_by_type;
		}

		if ( $this->is_search ) {
			
			$conds['order_by']       = $this->post('order_by');
			
			if($conds['order_by'] == "added_date") {

				$conds['order_by_field'] = "added_date";
				$conds['order_by_type'] = "desc";

			} else if($conds['order_by'] == "touch_count") {

				$conds['order_by_field'] = "touch_count";
				$conds['order_by_type'] = "desc";
			}

		}
        // print_r($conds);die;
		return $conds;
	}

	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		parent::convert_object( $obj );

		// convert customize Discount object
		$this->ps_adapter->convert_discount( $obj );
	}

	/**
	* Add/Edit Discount
	*/

	function add_discount_post() {

		// validation rules for user register
		$rules = array(
			array(
	        	'field' => 'name',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'percent',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'shop_id',
	        	'rules' => 'required'
	        )

        );

        // exit if there is an error in validation,
        if ( !$this->is_valid( $rules )) exit;
        
	  	$discount_data = array(

        	"name" => $this->post('name'),
        	"percent" => $this->post('percent')/100,
        	"shop_id" => $this->post('shop_id'), 
        	"status" => 1,
        	"id" => $this->post('id'),
        	"added_user_id" => $this->get_login_user_id()
        	
        );

        $id = $discount_data['id'];

        if ($id == "") {
			$this->Discount->save($discount_data);
			$id = $discount_data['id'];

        	
        }else{
        	$status = $this->Discount->get_one($id)->status;
        	$added_user_id = $this->Discount->get_one($id)->added_user_id;
        	$discount_data = array(
        		"name" => $this->post('name'),
        		"percent" => $this->post('percent')/100,
        		"shop_id" => $this->post('shop_id'), 
	        	"status" => $status,
	        	"added_user_id" => $added_user_id
	        );

        	$this->Discount->save($discount_data,$id);
        }

        // for discount foods

        $discount_data = $this->post( 'foods' );

        $conds['discount_id'] = $id;
        $prd_dis = $this->ProductDiscount->get_all_by($conds)->result();

        //update product before product discount save
        for($i=0; $i<count($prd_dis);$i++) {
          $before_dis_product['id'] = $prd_dis[$i]->product_id;
          $before_dis_product['is_discount'] = 0;
          $before_dis_product['unit_price'] = $this->Product->get_one($prd_dis[$i]->product_id)->original_price;
          $this->Product->save($before_dis_product, $prd_dis[$i]->product_id);
        }

        $this->ps_delete->delete_prd_discount( $id );
        $added_user_id = $this->Discount->get_one($id)->added_user_id;
	 
    	for($i=0; $i<count($discount_data);$i++) {
        
           $discounts['discount_id'] = $id;
           $discounts['product_id'] = $discount_data[$i]['product_id'];
           $discounts['added_user_id'] = $added_user_id;

          
           $this->ProductDiscount->save($discounts);

           $discount_product['id'] = $discount_data[$i]['product_id'];
           $discount_product['is_discount'] = 1;

           $percent = $this->post('percent');

           if($percent != 0 || $percent != "" ) {

             $product_original_price = $this->Product->get_one($discount_data[$i]['product_id'])->original_price;
             //$discount_price = $product_original_price - intval($product_original_price * ($discount_percent/100));
             $discount_price = $product_original_price - round($product_original_price * ($percent/100), 2);
             
             $discount_product['unit_price'] = round($discount_price, 2);
             
           }

           $this->Product->save($discount_product, $discount_data[$i]['product_id']);
          

         }
		 
		$obj = $this->Discount->get_one( $id );
		
		$this->ps_adapter->convert_discount( $obj );
		$this->custom_response( $obj );

	}

	/**
	* Trigger to delete Discount related data when Discount is deleted
	* delete Discount related data
	*/

	function discount_delete_post( ) {

		// validation rules for item register
		$rules = array(
			array(
	        	'field' => 'discount_id',
	        	'rules' => 'required'
	        )
	    );   
	    
	    // exit if there is an error in validation,
        if ( !$this->is_valid( $rules )) exit;

        $id = $this->post('discount_id');

        $conds['id'] = $id;

        // check user id

        $discount_data = $this->Discount->get_one_by($conds);


        if ( $discount_data->id == "" ) {

        	$this->error_response( get_msg( 'invalid_item_id' ), 400);

        } else {

        	// update the discount product
        	$conds_prd['discount_id'] = $this->post('discount_id');
	        $prd_discount = $this->ProductDiscount->get_all_by($conds_prd)->result();
	        for ($i=0; $i < count( $prd_discount); $i++) { 
	            $prd_org_price = $this->Product->get_one($prd_discount[$i]->product_id)->original_price;
	            $prd_discount_update['is_discount'] = 0;
	            $prd_discount_update['unit_price'] = $prd_org_price;
	            $this->Product->save(  $prd_discount_update , $prd_discount[$i]->product_id );
	        }

        	// delete Discount

        	$conds_id['id'] = $id;
         	$conds_dis['discount_id'] = $id;
        	$conds_img['img_parent_id'] = $id;

			// delete Discount
			if ( !$this->Discount->delete_by( $conds_id )) {

				return false;
			}

			
			// delete Product Discount
			if ( !$this->ProductDiscount->delete_by( $conds_dis )) {

				return false;
			}

			// delete images
			if ( !$this->Image->delete_by( $conds_img )) {

				return false;
			}

			
			$this->success_response( get_msg( 'success_dis_delete' ), 200);

        }


	}

}