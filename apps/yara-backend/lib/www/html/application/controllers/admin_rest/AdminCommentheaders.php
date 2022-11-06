<?php
require_once( APPPATH .'controllers/rest/Commentheaders.php' );

/**
 * REST API for Commentheaders
 */
class AdminCommentheaders extends Commentheaders
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		$is_login_user_nullable = false;

		// call the parent
		parent::__construct( 'Commentheader', $is_login_user_nullable );

		// set the validation rules for create and update
		$this->validation_rules();
	}

	function default_conds()
	{
		$conds = array();

		if ( $this->is_get ) {
		// if is get record using GET method
			//$conds['order_by_field'] = "added_date";
			//$conds['order_by_type'] = "desc";
		}

		if ( $this->is_search ) {

			//$setting = $this->Api->get_one_by( array( 'api_constant' => SEARCH_WALLPAPERS ));

			if($this->post('searchterm') != "") {
				$conds['searchterm']   = $this->post('searchterm');
			}

			if($this->post('shop_id') != "") {
				$conds['shop_id']   = $this->post('shop_id');
			}

			if($this->post('date') != "") {
				$conds['date']   = $this->post('date');
			}

			$conds['order_by'] = 1;
			$conds['order_by_field']    = $this->post('order_by');
			$conds['order_by_type']     = $this->post('order_type');
				
		}

		$conds['no_publish_filter'] = 1;

		return $conds;
	}

	/**
	 * Determines if valid input.
	 */
	function validation_rules()
	{
		// validation rules for create
		$this->create_validation_rules = array(
			array(
	        	'field' => 'product_id',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'user_id',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'header_comment',
	        	'rules' => 'required'
	        )
        );

	}


	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		$obj->comment_reply_count =  $this->Commentdetail->count_all_by(array("header_id" => $obj->id));

		$obj->user = $this->User->get_one_by(array("user_id" => $obj->user_id));

		parent::convert_object( $obj );

	}
}