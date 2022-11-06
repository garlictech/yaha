<?php
require_once( APPPATH .'controllers/rest/Users.php' );


/**
 * REST API for News
 */
class AdminRegisteredUsers extends Users
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'User' );
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
			$conds['order_by'] = 1;
			$conds['order_by_field'] = "added_date";
			$conds['order_by_type'] = "desc";
		}

		if ( $this->is_search ) {

			//$setting = $this->Api->get_one_by( array( 'api_constant' => SEARCH_WALLPAPERS ));

			if($this->post('searchterm') != "") {
				$conds['searchterm']   = $this->post('searchterm');
			}

			$conds['order_by'] = 1;
			$conds['order_by_field']    = $this->post('order_by');
			$conds['order_by_type']     = $this->post('order_type');
				
		}

		$conds['no_publish_filter'] = 1;

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
		$this->ps_adapter->convert_user( $obj );
	}
	
	/**
	* Delivery boy list
	*/

	function get_all_deliboy_get()
	{
		// add flag for default query
		$this->is_get = true;

		// get limit & offset
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		$conds['status'] = 1;
		$conds['role_id'] = 5;
		$conds['is_banned'] = 0;

		if ( !empty( $limit ) && !empty( $offset )) {
			// if limit & offset is not empty

			$data = $this->User->get_all_by( $conds, $limit, $offset )->result();
			} else if ( !empty( $limit )) {
			// if limit is not empty

				$data = $this->User->get_all_by( $conds, $limit )->result();
			} else {
			// if both are empty

				$data = $this->User->get_all_by( $conds )->result();
			}

			$this->custom_response( $data );
	}


}