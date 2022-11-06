<?php
require_once( APPPATH .'controllers/rest/Categories.php' );


/**
 * REST API for News
 */
class AdminPopularcategories extends Categories
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Popularcategory' );
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
			$setting = $this->Api->get_one_by( array( 'api_constant' => "GET_ALL_CATEGORIES" ));

			$conds['order_by'] = 1;
			$conds['order_by_field'] = $setting->order_by_field;
			$conds['order_by_type'] = $setting->order_by_type;
		}

		if ( $this->is_search ) {

			//$setting = $this->Api->get_one_by( array( 'api_constant' => SEARCH_WALLPAPERS ));

			if($this->post('search_term') != "") {
				$conds['search_term']   = $this->post('search_term');
			}

			if($this->post('date') != "") {
				$conds['date']   = $this->post('date');
			}


			$conds['order_by'] = 1;
			$conds['order_by_field']    = $this->post('order_by');
			$conds['order_by_type']     = $this->post('order_type');
				
		}

		$conds['no_publish_filter'] = 1;

        // print_r($conds);die;
		return $conds;
	}

	// get popular categories list

	function get_popular_categories_get()
	{
		// add flag for default query
		$this->is_get = true;

		// get id
		$id = $this->get( 'id' );
		
		if ( $id ) {
			// if 'id' is existed, get one record only
			$data = $this->Popularcategory->get_one( $id );

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

			$data = $this->Popularcategory->get_category_by( $conds, $limit, $offset )->result();
		} else if ( !empty( $limit )) {
		// if limit is not empty

			$data = $this->Popularcategory->get_category_by( $conds, $limit )->result();
		} else {
		// if both are empty

			$data = $this->Popularcategory->get_category_by( $conds )->result();
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

		// convert customize category object
		$this->ps_adapter->convert_category( $obj );
	}

}