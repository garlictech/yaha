<?php
require_once( APPPATH .'controllers/rest/Products.php' );


/**
 * REST API for News
 */
class AdminPopularfoods extends Products
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Popularproduct' );
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
		// $conds['order_by'] = 1;
		// $conds['order_by_field'] = $setting->order_by_field;
		// $conds['order_by_type'] = $setting->order_by_type;	
		}

		if ( $this->is_search ) {

			//$setting = $this->Api->get_one_by( array( 'api_constant' => SEARCH_WALLPAPERS ));

			if($this->post('searchterm') != "") {
				$conds['search_term']   = $this->post('searchterm');
			}

			if($this->post('cat_id') != "") {
				$conds['cat_id']   = $this->post('cat_id');
			}

			if($this->post('sub_cat_id') != "") {
				$conds['sub_cat_id']   = $this->post('sub_cat_id');
			}
			
			if($this->post('shop_id') != "") {
				$conds['shop_id']   = $this->post('shop_id');
			}

			$conds['order_by'] = 1;
			$conds['order_by_field']    = $this->post('order_by');
			$conds['order_by_type']     = $this->post('order_type');
				
		}

		$conds['no_publish_filter'] = 1;

		return $conds;
	}

	// Popular foods list

	function get_popular_foods_get()
	{
		// add flag for default query
		$this->is_get = true;

		// get id
		$id = $this->get( 'id' );
		$shop_id = $this->get( 'shop_id' );
		
		if ( $id ) {
			// if 'id' is existed, get one record only
			$data = $this->Popularproduct->get_one( $id, $shop_id );

			if ( isset( $data->is_empty_object )) {
			// if the id is not existed in the return object, the object is empty
				
				$data = array();
			}

			$this->custom_response( $data );
		}

		// get limit & offset
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		// get search criteria
		$default_conds = $this->default_conds();
		$user_conds = $this->get();
		$conds = array_merge( $default_conds, $user_conds );
		
		if ( $limit ) {
			unset( $conds['limit']);
		}

		if ( $offset ) {
			unset( $conds['offset']);
		}


		if ( !empty( $limit ) && !empty( $offset )) {
		// if limit & offset is not empty

			$data = $this->Popularproduct->get_product_by( $conds, $limit, $offset )->result();
		} else if ( !empty( $limit )) {
		// if limit is not empty

			$data = $this->Popularproduct->get_product_by( $conds, $limit )->result();
		} else {
		// if both are empty

			$data = $this->Popularproduct->get_product_by( $conds )->result();
		}

		$this->custom_response( $data , $offset);
	}
	
	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		parent::convert_object( $obj );

		// convert customize feed object
		$this->ps_adapter->convert_product( $obj );

	}

}