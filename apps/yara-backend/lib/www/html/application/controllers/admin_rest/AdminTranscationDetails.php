<?php
require_once( APPPATH .'controllers/rest/Transactiondetails.php' );

/**
 * REST API for News
 */
class AdminTranscationDetails extends Transactiondetails
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Transactiondetail' );
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

		return $conds;
	}



	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		//parent::convert_object( $obj );

		// convert customize category object
		$this->ps_adapter->convert_transaction_detail_admin( $obj );

	}
	

}