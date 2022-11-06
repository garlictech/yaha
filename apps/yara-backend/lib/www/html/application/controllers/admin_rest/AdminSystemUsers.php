<?php
require_once( APPPATH .'controllers/rest/Users.php' );


/**
 * REST API for News
 */
class AdminSystemUsers extends Users
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
	 * Users Login
	 */
	function login_post()
	{
		// validation rules for user register
		$rules = array(
			
	        array(
	        	'field' => 'user_email',
	        	'rules' => 'required|valid_email'
	        ),
	        array(
	        	'field' => 'user_password',
	        	'rules' => 'required'
	        )
        );

		// exit if there is an error in validation,
        if ( !$this->is_valid( $rules )) exit;

        if ( !$this->User->exists( array( 'user_email' => $this->post( 'user_email' ), 'user_password' => $this->post( 'user_password' )))) {
            $this->error_response( get_msg( 'err_user_not_exist' ), 404);
        }
        	$email = $this->post( 'user_email' );
	        $conds['user_email'] = $email;
	        $is_banned = $this->User->get_one_by($conds)->is_banned;
	        $code = $this->User->get_one_by($conds)->code;
	        $status = $this->User->get_one_by($conds)->status;
	        $role_id = $this->User->get_one_by($conds)->role_id;

	        if($role_id == 4 || $role_id == 5) {
	        	$this->error_response( get_msg( 'not_login_access' ), 403);
	        } else if ( $status == '0') {
	        	$this->error_response( get_msg( 'not_yet_activate' ), 503);
	        }else {

	        	$user_info = $this->User->get_one_by( array( "user_email" => $this->post( 'user_email' )));
		        $user_id = $user_info->user_id;
		        $data = array(
					
					'device_token' => $this->post('device_token')
				);
				$this->User->save($data,$user_id);

				$noti_token = array(
					"device_id" => $this->post( 'device_token' )
				);

				//print_r($noti_token);die;

        		if ( $this->Notitoken->exists( $noti_token )) {
        			$noti_id = $this->Notitoken->get_one_by($noti_token);
        			$push_noti_token_id = $noti_id->id;
        			$noti_data = array(

						"user_id" => $user_id
						
					);
		        	$this->Notitoken->save( $noti_data, $push_noti_token_id );
		        } else {
		            $noti_data = array(

						"user_id" => $user_id,
						"device_id" => $this->post( 'device_token' )
						
					);
					
		        	$this->Notitoken->save( $noti_data );
		        }

		        $this->custom_response($this->User->get_one_by(array("user_email" => $this->post('user_email'))));

	        }

	        
        
	}

	/**
	 * Users Logout
	 */
	function logout_post()
	{
		// validation rules for user register
		$rules = array(
			
	        array(
	        	'field' => 'user_id',
	        	'rules' => 'required|callback_id_check[User]'
	        )
        );

		// exit if there is an error in validation,
        if ( !$this->is_valid( $rules )) exit;
       
       $conds['user_id'] = $this->post('user_id');
       $this->Notitoken->delete_by($conds);

       $this->success_response( get_msg( 'success_logout' ), 200);

	}

	/**
	* User Profile Update
	*/

	function profile_update_post()
	{

		// validation rules for user register
		$rules = array(
			array(
	        	'field' => 'user_id',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'user_name',
	        	'rules' => 'required'
	        ),
	        array(
	        	'field' => 'user_email',
	        	'rules' => 'required|valid_email'
	        )
        );

		// exit if there is an error in validation,
        if ( !$this->is_valid( $rules )) exit;
        $user_id = $this->post('user_id');
        // user email checking
        $user_email = $this->User->get_one($user_id)->user_email;
        if ($user_email == $this->post('user_email')) {
        	$email = $this->post('user_email');
        } else {
        	$conds['user_email'] = $this->post('user_email');
        	$conds['status'] = 1;
       		$user_infos = $this->User->get_one_user_email($conds)->result();
        	if (empty($user_infos)) {
        		$email = $this->post( 'user_email' );
        	} else {
        		
		    	$this->error_response( get_msg( 'err_user_email_exist' ), 409);
		    }
		 
        }

        // user phone checking
        $user_phone = $this->User->get_one($user_id)->user_phone;
        if ($user_phone == $this->post('user_phone')) {
        	$phone = $this->post('user_phone');
        } else {
        	$conds['user_phone'] = $this->post('user_phone');
        	$conds['status'] = 1;
       		$user_infos = $this->User->get_one_user_phone($conds)->result();
        	if (empty($user_infos)) {
        		$phone = $this->post( 'user_phone' );
        	} else {
        		
		    	$this->error_response( get_msg( 'err_user_phone_exist' ), 409);
		    }
		 
        }


        $user_lat = $this->post('user_lat');
        $user_lng = $this->post('user_lng');
        $user_area_id = $this->post('user_area_id');

        if ($user_lat != "" || $user_lng != "") {
        	//lat and lng not blank
        	if ($user_area_id != "") {
        		//user_area_id is not blank
        		$conds['id'] = $user_area_id;
        		$id = $this->Shipping_area->exists($conds);
        		if (!$id) {
        			//invalid
        			$this->error_response( get_msg( 'area_invlaid' ), 400);
        		} else{
        			//valid
        			$user_data = array(
		        	"user_name"     		=> $this->post('user_name'), 
		        	"user_email"    		=> $email, 
		        	"user_phone"    		=> $phone,
		        	"user_about_me" 		=> $this->post('user_about_me'),
		        	"user_address" 		   	=> $this->post('user_address'),
		        	"user_area_id" 		    => $user_area_id,
		        	"user_lat" 		    	=> $user_lat,
		        	"user_lng" 		    	=> $user_lng,
		        	"added_date" 			=>  date("Y-m-d H:i:s")

		            );
		        }
        	} else {
        		//user_area_id is blank
	    		$user_data = array(
	        	"user_name"     		=> $this->post('user_name'), 
	        	"user_email"    		=> $email, 
	        	"user_phone"    		=> $this->post('user_phone'),
	        	"user_about_me" 		=> $this->post('user_about_me'),
	        	"user_address" 		   	=> $this->post('user_address'),
	        	"user_lat" 		    	=> $user_lat,
	        	"user_lng" 		    	=> $user_lng,
	        	"user_area_id" 		    => $user_area_id,
	        	"added_date" 			=>  date("Y-m-d H:i:s")

	            );
	        }    
        } else {
        	//lat and lng not blank
        	if ($user_area_id != "") {
        		//user_area_id is not blank
        		$conds['id'] = $user_area_id;
        		$id = $this->Shipping_area->exists($conds);
        		if (!$id) {
        			//invalid
        			$this->error_response( get_msg( 'area_invlaid' ), 400);
        		} else{
        			//valid
        			$user_data = array(
		        	"user_name"     		=> $this->post('user_name'), 
		        	"user_email"    		=> $email, 
		        	"user_phone"    		=> $this->post('user_phone'),
		        	"user_about_me" 		=> $this->post('user_about_me'),
		        	"user_address" 		   	=> $this->post('user_address'),
		        	"user_area_id" 		    => $user_area_id,
		        	"added_date" 			=>  date("Y-m-d H:i:s")

		            );
		        }
        	} else {
        		$user_data = array(
		        	"user_name"     		=> $this->post('user_name'), 
		        	"user_email"    		=> $email, 
		        	"user_phone"    		=> $this->post('user_phone'),
		        	"user_about_me" 		=> $this->post('user_about_me'),
		        	"user_address" 		   	=> $this->post('user_address'),
		        	"added_date" 			=>  date("Y-m-d H:i:s")

		        );
        	}
        }
        if ( !$this->User->save($user_data, $this->post('user_id'))) {

        	$this->error_response( get_msg( 'err_user_update' ), 500);
        }

    	$this->custom_response($this->User->get_one($user_id));

	    // $this->success_response( get_msg( 'success_profile_update' ));

	}
	

}