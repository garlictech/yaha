<?php
require_once( APPPATH .'controllers/rest/Products.php' );
/**
 * REST API for News
 */
class AdminProducts extends Products
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Product' );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "products";


			$checking = user_access_checking( $url_login_user_id, $url_api_key, $user_key, $current_module );
		}

		$this->load->library( 'PS_Delete' );
		$this->load->library( 'PS_Image' );
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

			// get default setting for GET_ALL_PRODUCTS
			$setting = $this->Api->get_one_by( array( 'api_constant' => "GET_ALL_PRODUCTS" ));

		}

		if ( $this->is_search ) {

			//$setting = $this->Api->get_one_by( array( 'api_constant' => SEARCH_WALLPAPERS ));

			if($this->post('searchterm') != "") {
				$conds['searchterm']   = $this->post('searchterm');
			}

			if($this->post('cat_id') != "") {
				$conds['cat_id']   = $this->post('cat_id');
			}

			if($this->post('sub_cat_id') != "") {
				$conds['sub_cat_id']   = $this->post('sub_cat_id');
			}

			if($this->post('is_featured') != "") {
				$conds['is_featured']   = $this->post('is_featured');
			}

			if($this->post('is_discount') != "") {
				$conds['is_discount']   = $this->post('is_discount');
			}

			if($this->post('is_available') != "") {
				$conds['is_available']   = $this->post('is_available');
			}			

			if($this->post('min_price') != "") {
				$conds['min_price']   = $this->post('min_price');
			}

			if($this->post('max_price') != "") {
				$conds['max_price']   = $this->post('max_price');
			}


			if($this->post('rating_value') != "") {
				$conds['rating_value']   = $this->post('rating_value');
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

	// Get Favourite Foods

		/**
	 * Get all or Get One
	 */
	function get_favourite_prd_get()
	{
		// add flag for default query
		$this->is_get = true;

		// get limit & offset
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		// get search criteria
		$default_conds = $this->default_conds();
		$user_conds = $this->get();
		$conds = array_merge( $default_conds, $user_conds );
		$conds['user_id'] = $this->get_login_user_id();
		if ( $limit ) {
			unset( $conds['limit']);
		}

		if ( $offset ) {
			unset( $conds['offset']);
		}

		if ( !empty( $limit ) && !empty( $offset )) {
		// if limit & offset is not empty

			$data = $this->Product->get_product_favourite( $conds, $limit, $offset )->result();
		} else if ( !empty( $limit )) {
		// if limit is not empty

			$data = $this->Product->get_product_favourite( $conds, $limit )->result();
		} else {
		// if both are empty
			$data = $this->Product->get_product_favourite( $conds )->result();
		}

		$this->custom_response( $data ,$offset);
	}

	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		parent::convert_object( $obj );

		// convert customize product object
		$this->ps_adapter->convert_product( $obj );
	}


}