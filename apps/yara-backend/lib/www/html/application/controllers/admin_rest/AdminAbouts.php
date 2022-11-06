<?php
require_once( APPPATH .'controllers/rest/Abouts.php' );


/**
 * REST API for News
 */
class AdminAbouts extends Abouts
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'About' );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "abouts";


			$checking = user_access_checking( $url_login_user_id, $url_api_key, $user_key, $current_module );
		}	
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
		$this->ps_adapter->convert_about( $obj );
	}

}