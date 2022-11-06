<?php
require_once( APPPATH .'controllers/rest/Commentdetails.php' );

/**
 * REST API for Commentheaders
 */
class AdminCommentdetails extends Commentdetails
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		$is_login_user_nullable = false;

		// call the parent
		parent::__construct( 'Commentdetail', $is_login_user_nullable );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "comments";


			$checking = user_access_checking( $url_login_user_id, $url_api_key, $user_key, $current_module );
		}	

		// set the validation rules for create and update
		$this->validation_rules();
	}

	function default_conds()
	{
		$conds = array();

		if ( $this->is_get ) {
		// if is get record using GET method
			$conds['order_by_field'] = "added_date";
			$conds['order_by_type'] = "desc";
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
	        	'field' => 'header_id',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'user_id',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'detail_comment_desc',
	        	'rules' => 'required'
	        )
        );

	}


	/**
	* When user press like button from app
	*/
	function press_post() 
	{

		$url_login_user_id = $this->get( 'login_user_id' );
		$url_api_key = $this->get( 'api_key' );
		$user_key = $this->post( 'user_key' );
		$current_module = "comments";
		$action = "add";

		if(user_access_checking_action( $url_login_user_id, $url_api_key, $user_key, $current_module, $action )) {
		
			// validation rules for create
			$rules = array(
				array(
		        	'field' => 'header_id',
		        	'rules' => 'required|callback_id_check[Commentheader]'
		        ),
		        array(
		        	'field' => 'user_id',
		        	'rules' => 'required|callback_id_check[User]'
		        )
	        );

			// validation
	        if ( !$this->is_valid( $rules )) exit;

			$header_id 		 		= $this->post('header_id');
			$user_id 			 	= $this->post('user_id');
			$shop_id				= $this->post('shop_id');
			$detail_comment 		= $this->post('detail_comment');

			$users = global_user_check($user_id);

			// prep data
	        $data = array( 
	        	'header_id' => $header_id, 
	        	'user_id' => $user_id, 
	        	'shop_id' => $shop_id,
	        	'detail_comment' => $detail_comment 
	        );

	        if ( !$this->Commentdetail->save( $data )) {
				$this->error_response( get_msg( 'err_model' ), 500);
			} 
			

			$conds = array(
				"order_by_field" => "added_date", 
				"order_by_type"  => "asc",
				"id" 			 => $data['id']
			);


			$comments_detail = $this->Commentdetail->get_all_by($conds)->result();

			$this->custom_response( $comments_detail );

		}	

	}


	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		
		$obj->user = $this->User->get_one_by(array("user_id" => $obj->user_id));
		
		parent::convert_object( $obj );

		
	}
}