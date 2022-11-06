<?php
require_once( APPPATH .'libraries/REST_Controller.php' );

/**
 * REST API for Transaction Details
 */
class Attributedetails extends API_Controller
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Attributedetail' );
	}

	/**
	 * Default Query for API
	 * @return [type] [description]
	 */
	function default_conds()
	{
		$conds = array();

		if ( $this->is_get ) {

			$conds['order_by'] = 1;
			$conds['order_by_field'] = "added_date";
			$conds['order_by_type'] = "desc";
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
		$this->ps_adapter->convert_customer_detail( $obj );
	}

}