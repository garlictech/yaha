<?php
require_once( APPPATH .'controllers/rest/Contacts.php' );


/**
 * REST API for News
 */
class AdminContacts extends Contacts
{

	/**
		 * Constructs Parent Constructor
		 */
		function __construct()
		{
			// call the parent
			parent::__construct( 'Contact' );
			$this->load->library( 'PS_Adapter' );

			if ($_SERVER['REQUEST_METHOD'] === 'POST') {
				$url_login_user_id = $this->get( 'login_user_id' );
				$url_api_key = $this->get( 'api_key' );
				$user_key = $this->post( 'user_key' );
				$current_module = "contacts";


				$checking = user_access_checking( $url_login_user_id, $url_api_key, $user_key, $current_module );
			   
			}

			// set the validation rules for create and update
			$this->validation_rules();
		}

	/**
	 * Determines if valid input.
	 */
	function validation_rules()
	{
		// validation rules for create
		$this->create_validation_rules = array(
			array(
	        	'field' => 'name',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'email',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'phone',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'message',
	        	'rules' => 'required'
	        )
        );
	}

	/**
	 * Get all or Get One
	 */
	function get_contacts_get()
	{
		// add flag for default query
		$this->is_get = true;

		// get id
		$id = $this->get( 'id' );
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );
		
		if ( $limit ) {
			unset( $conds['limit']);
		}

		if ( $offset ) {
			unset( $conds['offset']);
		}

		if ( !empty( $limit ) && !empty( $offset )) {
		// if limit & offset is not empty

			$data = $this->model->get_all_by( $conds, $limit, $offset )->result();
		} else if ( !empty( $limit )) {
		// if limit is not empty

			$data = $this->model->get_all_by( $conds, $limit )->result();
		} else {
		// if both are empty

			$data = $this->model->get_all_by( $conds )->result();
		}

		$this->custom_response( $data );
	}

	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		//print_r($obj);die;
		if ( $this->is_add ) {
			$contact_id = $obj->id;
			$subject = get_msg('contact_receive_message');
			send_contact_us_emails( $contact_id, $subject );
			$this->success_response( get_msg( 'success_contact'), 200);
		} else if ($this->is_get) {
			$this->ps_adapter->convert_contact_list($obj);
		} else {

			$this->error_response( get_msg( 'err_contact' ), 500);

		}
	}	

	/**
	* Trigger to delete contact
	*/

	function contact_delete_post( ) {

		$url_login_user_id = $this->get( 'login_user_id' );
		$url_api_key = $this->get( 'api_key' );
		$user_key = $this->post( 'user_key' );
		$current_module = "contacts";
		$action = "delete";

		if(user_access_checking_action( $url_login_user_id, $url_api_key, $user_key, $current_module, $action )) {

			// validation rules for item register
			$rules = array(
				array(
		        	'field' => 'contact_id',
		        	'rules' => 'required'
		        )
		    );   
		    
		    // exit if there is an error in validation,
	        if ( !$this->is_valid( $rules )) exit;

	        $id = $this->post('contact_id');

	        $conds['id'] = $id;

	        // check user id

	        $contact_data = $this->Contact->get_one_by($conds);

	        //print_r($contact_data);die;


	        if ( $contact_data->id == "" ) {

	        	$this->error_response( get_msg( 'invalid_item_id' ), 400);

	        } else {

	        	// delete Contact

	        	$conds_id['id'] = $id;
	         	$conds_cat['contact_id'] = $id;

				// delete Contact
				if ( !$this->Contact->delete_by( $conds_id )) {

					return false;
				}

				
				$this->success_response( get_msg( 'success_contact_delete' ), 200);

	        }
	    }    


	}

}