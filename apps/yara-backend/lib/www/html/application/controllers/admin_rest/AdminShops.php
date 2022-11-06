<?php
require_once( APPPATH .'controllers/rest/Shops.php' );


/**
 * REST API for News
 */
class AdminShops extends Shops
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Shop' );
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

			// get default setting for GET_ALL_CATEGORIES
			// $setting = $this->Api->get_one_by( array( 'api_constant' => GET_ALL_CATEGORIES ));

			$conds['order_by'] = 1;
			$conds['order_by_field'] = $setting->order_by_field;
			$conds['order_by_type'] = $setting->order_by_type;
		}

		if ( $this->is_search ) {
			
			
			if($this->post('is_featured') != "") {
				$conds['is_featured']   = $this->post('is_featured');
			}


			if($this->post('lat') != "") {
				$conds['lat']   = $this->post('lat');
			}

			if($this->post('lng') != "") {
				$conds['lng']   = $this->post('lng');
			}

			if($this->post('miles') != "") {
				$conds['miles']   = $this->post('miles');
			}

			$conds['order_by'] = 1;
			$conds['order_by_field']       = $this->post('order_by');
			$conds['order_by_type']       = $this->post('order_type');

		}

		$conds['no_publish_filter'] = 1;

		// print_r($conds); die;
		return $conds;
	}

	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		parent::convert_object( $obj );

		// convert customize category object
		$this->ps_adapter->convert_shop( $obj );
	}

	
	/**
	* search shop with user access
	*/

	function search_shop_post()
	{
		$this->is_search = true;

		$user_id = $this->get('login_user_id');

		$user_is_sys_admin = $this->User->get_one($user_id)->user_is_sys_admin;

		// add default conds
		$default_conds = $this->default_conds();
		$user_conds = $this->get();
		$conds = array_merge( $default_conds, $user_conds );

		// check empty condition
		$final_conds = array();
		foreach( $conds as $key => $value ) {
			if ( !empty( $value )) {
				$final_conds[$key] = $value;
			}
		}
		$conds = $final_conds;
		

		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		if ($user_is_sys_admin == '1') {
			if ( !empty( $limit ) && !empty( $offset )) {
			// if limit & offset is not empty

				$data = $this->Shop->get_all_by( $conds, $limit, $offset )->result();
			} else if ( !empty( $limit )) {
			// if limit is not empty
				$data = $this->Shop->get_all_by( $conds, $limit )->result();
			} else {
			// if both are empty

				$data = $this->Shop->get_all_by( $conds )->result();
			}
		} else {
			$conds_usr['user_id'] = $user_id;

			$user_shop = $this->User_shop->get_all_by( $conds_usr )->result();
		 
			$user_shops_ids = array();
			 for($i=0; $i<count($user_shop); $i++) {
			 	$user_shops_ids[]= $user_shop[$i]->shop_id;
			}

			$conds['id'] = $user_shops_ids;

			if ( !empty( $limit ) && !empty( $offset )) {
			// if limit & offset is not empty

				$data = $this->Shop->get_shop_by_id( $conds, $limit, $offset )->result();
			} else if ( !empty( $limit )) {
			// if limit is not empty
				$data = $this->Shop->get_shop_by_id( $conds, $limit )->result();
			} else {
			// if both are empty

				$data = $this->Shop->get_shop_by_id( $conds )->result();
			}

			
		}

		$this->custom_response( $data );
		

	}

}