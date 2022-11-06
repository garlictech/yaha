<?php
require_once( APPPATH .'controllers/rest/Rates.php' );


/**
 * REST API for News
 */
class AdminRatefoods extends Rates
{
    /**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Rate' );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "ratings";


			$checking = user_access_checking( $url_login_user_id, $url_api_key, $user_key, $current_module );
		}

		// set the validation rules for create and update
		$this->validation_rules();
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

		$this->ps_adapter->convert_rating( $obj );

	}
 
}