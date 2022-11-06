<?php
require_once( APPPATH .'controllers/rest/Appinfo.php' );


/**
 * REST API for About
 */
class AdminAppinfo extends Appinfo
{
	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		// call the parent
		parent::__construct( 'Appinfo' );		
	}

	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		parent::convert_object( $obj );

		// convert customize category object
		//$this->ps_adapter->convert_appinfo( $obj );
	}

	/**
  	* Get Delete History By Date Range.
  	*/
	function get_delete_history_post()
	{
	  	

		$start = $this->post('start_date');
		$end   = $this->post('end_date');
		$user_id = $this->post('user_id');
		  
		$conds['start_date'] = $start;
		$conds['end_date']   = $end;

		$conds['order_by'] = 1;
		$conds['order_by_field'] = "type_name";
		$conds['order_by_type'] = "desc";


		//$deleted_his_ids = $this->Delete_history->get_all_history_by($conds)->result();
		$deleted_his_ids = $this->Delete_history->get_all_by($conds)->result();

		$this->custom_response_history( $deleted_his_ids, $user_id, false );

	}


	/**
	 * Custome Response return 404 if not data found
	 *
	 * @param      <type>  $data   The data
	 */
	function custom_response_history( $data, $user_id, $require_convert = true )
	{
		

		$version_object = new stdClass; 
		//version obj
		$version_object->version_no           = $this->Version->get_one("1")->version_no; 
		$version_object->version_force_update = $this->Version->get_one("1")->version_force_update;
		$version_object->version_title        = $this->Version->get_one("1")->version_title;
		$version_object->version_message      = $this->Version->get_one("1")->version_message;
		$version_object->version_need_clear_data      = $this->Version->get_one("1")->version_need_clear_data;

		//deliboy version obj
		$deliboy_version_object = new stdClass;
		$deliboy_version_object->deli_boy_version_no           = $this->Version->get_one("1")->deli_boy_version_no; 
		$deliboy_version_object->deli_boy_version_force_update = $this->Version->get_one("1")->deli_boy_version_force_update;
		$deliboy_version_object->deli_boy_version_title        = $this->Version->get_one("1")->deli_boy_version_title;
		$deliboy_version_object->deli_boy_version_message      = $this->Version->get_one("1")->deli_boy_version_message;
		$deliboy_version_object->deli_boy_version_need_clear_data      = $this->Version->get_one("1")->deli_boy_version_need_clear_data;

		$is_banned = $this->User->get_one($user_id)->is_banned;
		$user_object = new stdClass;
		$user_object->user_status = $this->User->get_one($user_id)->status;

		$user_data = $this->User->get_one($user_id);
		//($user_data->status);die;

		if ($user_id == "nologinuser") {
			$user_object->user_status = "nologinuser";
		}elseif ($user_data->is_empty_object == 1 ) {
			$user_object->user_status = "deleted";
		}elseif ($is_banned == 1 ) {
			$user_object->user_status = "banned";
		}elseif ($user_object->user_status == 1) {
			$user_object->user_status = "active";
		}elseif ($user_object->user_status == 2) {
			$user_object->user_status = "pending";
		}elseif ($user_object->user_status == 0) {
			$user_object->user_status = "unpublished";
		}

		//role id
		$role_id = $this->User->get_one($user_id)->role_id;

		// is super admin check
		$user_is_sys_admin = $this->User->get_one($user_id)->user_is_sys_admin;

		// user role access and action
		$conds_mod['user_id'] = $user_id;
		$premissions = $this->Permission->get_all_by($conds_mod)->result();
		
		if ($user_is_sys_admin == 1) {

			// for super admin
			/** inside shop modules */
			$user_object->action_discount = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_blog = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_collection = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_product = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_comment = "C=0, R=1, U=1, D=0, B=0";
			$user_object->action_favourite = "C=0, R=1, U=0, D=0, B=0";
			$user_object->action_transaction = "C=0, R=1, U=1, D=1, B=0";
			$user_object->action_popularproduct = "C=0, R=1, U=0, D=0, B=0";
			$user_object->action_purchasedproduct = "C=0, R=1, U=0, D=0, B=0";
			$user_object->action_rating = "C=0, R=1, U=0, D=1, B=0";
			$user_object->action_coupon = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_additional = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_shipping_area = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_reservation = "C=0, R=1, U=1, D=0, B=0";
			$user_object->action_restaurant_branch = "C=1, R=1, U=1, D=1, B=0";


			/** outside shop modules **/

			$user_object->action_category = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_subcategory = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_transaction_status = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_payment_status = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_notification = "C=1, R=1, U=0, D=1, B=0";
			$user_object->action_system_user = "C=1, R=1, U=1, D=1, B=0";
			$user_object->action_registered_user = "C=0, R=1, U=1, D=1, B=1";
			$user_object->action_delivery_boy = "C=1, R=1, U=1, D=1, B=1";
			$user_object->action_ban_user = "C=0, R=1, U=0, D=0, B=1";
			$user_object->action_about = "C=0, R=1, U=1, D=0, B=0";
			$user_object->action_api_key = "C=0, R=1, U=1, D=0, B=1";
			$user_object->action_paypal_config = "C=0, R=1, U=1, D=0, B=0";
			$user_object->action_privacy_policy = "C=0, R=1, U=1, D=0, B=0";
			$user_object->action_contact = "C=0, R=1, U=0, D=1, B=0";
			$user_object->action_popularcategory = "C=0, R=1, U=0, D=0, B=0";
			$user_object->action_purchasedcategory = "C=0, R=1, U=0, D=0, B=0";



		} else {
			// shop admin, manager and entry
			for ($i=0; $i <count($premissions) ; $i++) { 
				$module_id = $premissions[$i]->module_id;
				$module_name = $this->Module->get_one($module_id)->module_name;

				if ($role_id == 1) {
					//shop admin
					$user_object->action_discount = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_blog = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_collection = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_product = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_comment = "C=0, R=1, U=1, D=0, B=0";
					$user_object->action_favourite = "C=0, R=1, U=0, D=0, B=0";
					$user_object->action_transaction = "C=0, R=1, U=1, D=1, B=0";
					$user_object->action_popularproduct = "C=0, R=1, U=0, D=0, B=0";
					$user_object->action_purchasedproduct = "C=0, R=1, U=0, D=0, B=0";
					$user_object->action_rating = "C=0, R=1, U=0, D=1, B=0";
					$user_object->action_coupon = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_additional = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_shipping_area = "C=1, R=1, U=1, D=1, B=0";
					$user_object->action_reservation = "C=0, R=1, U=1, D=0, B=0";
					$user_object->action_restaurant_branch = "C=1, R=1, U=1, D=1, B=0";

				} else if ($role_id == 2) {
					// manager
					if ($module_name == "discounts") {
						$user_object->action_discount = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "blogs") {
						$user_object->action_blog = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "products") {
						$user_object->action_product = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "collections") {
						$user_object->action_collection = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "comments") {
						$user_object->action_comment = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "favourites") {
						$user_object->action_favourite = "C=0, R=1, U=0, D=0, B=0";
					} elseif ($module_name == "transactions") {
						$user_object->action_transaction = "C=0, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "popularproducts") {
						$user_object->action_popularproduct = "C=0, R=1, U=0, D=0, B=0";
					} elseif ($module_name == "purchasedproducts") {
						$user_object->action_purchasedproduct = "C=0, R=1, U=0, D=0, B=0";
					} elseif ($module_name == "ratings") {
						$user_object->action_rating = "C=0, R=1, U=0, D=1, B=0";
					}  elseif ($module_name == "coupons") {
						$user_object->action_coupon = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "additionals") {
						$user_object->action_additional = "C=1, R=1, U=1, D=1, B=0";
					} elseif ($module_name == "shipping_areas") {
						$user_object->action_shipping_area = "C=1, R=1, U=1, D=1, B=0";
					}  elseif ($module_name == "reservations") {
						$user_object->action_reservation = "C=0, R=1, U=1, D=0, B=0";
					}  elseif ($module_name == "restaurant_branches") {
						$user_object->action_restaurant_branch = "C=1, R=1, U=1, D=1, B=0";
					} 

				} else {

					// entry

					if ($module_name == "discounts") {
						$user_object->action_discount = "C=1, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "blogs") {
						$user_object->action_blog = "C=1, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "products") {
						$user_object->action_product = "C=1, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "collections") {
						$user_object->action_collection = "C=1, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "comments") {
						$user_object->action_comment = "C=0, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "favourites") {
						$user_object->action_favourite = "C=0, R=1, U=0, D=0, B=0";
					} elseif ($module_name == "transactions") {
						$user_object->action_transaction = "C=0, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "popularproducts") {
						$user_object->action_popularproduct = "C=0, R=1, U=0, D=0, B=0";
					} elseif ($module_name == "purchasedproducts") {
						$user_object->action_purchasedproduct = "C=0, R=1, U=0, D=0, B=0";
					} elseif ($module_name == "ratings") {
						$user_object->action_rating = "C=0, R=1, U=0, D=0, B=0";
					}  elseif ($module_name == "coupons") {
						$user_object->action_coupon = "C=1, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "additionals") {
						$user_object->action_additional = "C=1, R=1, U=1, D=0, B=0";
					} elseif ($module_name == "shipping_areas") {
						$user_object->action_shipping_area = "C=1, R=1, U=1, D=0, B=0";
					}  elseif ($module_name == "reservations") {
						$user_object->action_reservation = "C=0, R=1, U=1, D=0, B=0";
					}  elseif ($module_name == "restaurant_branches") {
						$user_object->action_restaurant_branch = "C=1, R=1, U=1, D=0, B=0";
					} 

				}

			}

			/** outside shop modules */

			$user_object->action_category = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_subcategory = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_transaction_status = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_payment_status = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_notification = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_system_user = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_registered_user = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_delivery_boy = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_ban_user = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_about = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_api_key = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_paypal_config = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_privacy_policy = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_contact = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_popularcategory = "C=0, R=0, U=0, D=0, B=0";
			$user_object->action_purchasedcategory = "C=0, R=0, U=0, D=0, B=0";

			
		}

		//print_r($user_object);die;

		if ($user_object->action_discount == "") {
			$user_object->action_discount = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_blog == "") {
			$user_object->action_blog = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_collection == "") {
			$user_object->action_collection = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_product == "") {
			$user_object->action_product = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_comment == "") {
			$user_object->action_comment = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_favourite == "") {
			$user_object->action_favourite = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_transaction == "") {
			$user_object->action_transaction = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_popularproduct == "") {
			$user_object->action_popularproduct = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_purchasedproduct == "") {
			$user_object->action_purchasedproduct = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_rating == "") {
			$user_object->action_rating = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_coupon == "") {
			$user_object->action_coupon = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_additional == "") {
			$user_object->action_additional = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_shipping_area == "") {
			$user_object->action_shipping_area = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_reservation == "") {
			$user_object->action_reservation = "C=0, R=0, U=0, D=0, B=0";
		}

		if ($user_object->action_restaurant_branch == "") {
			$user_object->action_restaurant_branch = "C=0, R=0, U=0, D=0, B=0";

		}

		$final_data = new stdClass;
		$final_data->version = $version_object;
		$final_data->deliboy_version = $deliboy_version_object;
		$final_data->user_info = $user_object;
		$final_data->paystack_enabled = $this->Shop->get_one($id)->paystack_enabled;
		$final_data->paystack_key = $this->Shop->get_one($id)->paystack_key;
		$final_data->delete_history = $data;
		//$final_data->enable_comment = $this->App_config->get_one("app_set1")->enable_comment;
		//$final_data->enable_review = $this->App_config->get_one("app_set1")->enable_review; 
		$final_data->contact_phone = $this->About->get_one("abt1")->about_phone;
		$final_data->contact_email = $this->About->get_one("abt1")->about_email; 
		$final_data->contact_website = $this->About->get_one("abt1")->about_website;
		
		$final_data = $this->ps_security->clean_output( $final_data );


		$this->response( $final_data );
	}
}