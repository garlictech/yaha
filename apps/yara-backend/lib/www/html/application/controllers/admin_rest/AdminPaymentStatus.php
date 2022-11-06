<?php
require_once( APPPATH .'controllers/rest/Payment_status.php' );


/**
 * REST API for News
 */
class AdminPaymentStatus extends Payment_status
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Paymentstatus' );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "payment_status";


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


}