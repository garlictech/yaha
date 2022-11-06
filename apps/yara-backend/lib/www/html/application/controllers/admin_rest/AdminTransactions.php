<?php
require_once( APPPATH .'controllers/rest/Transactionheaders.php' );


/**
 * REST API for News
 */
class AdminTransactions extends Transactionheaders
{

	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Transaction' );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "transactions";


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
			$conds['order_by_field'] = $setting->order_by_field;
			$conds['order_by_type'] = $setting->order_by_type;
		}

		if ( $this->is_search ) {

			//$setting = $this->Api->get_one_by( array( 'api_constant' => SEARCH_WALLPAPERS ));

			if($this->post('searchterm') != "") {
				$conds['searchterm']   = $this->post('searchterm');
			}

			if($this->post('shop_id') != "") {
				$conds['shop_id']   = $this->post('shop_id');
			}

			if($this->post('trans_status_id') != "") {
				$conds['trans_status_id']   = $this->post('trans_status_id');
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
		//parent::convert_object( $obj );

		//convert customize transaction header object
		$this->ps_adapter->convert_transaction_header_admin( $obj );
	}

	/**
	 * assign deli boy
	 */
    
	function assign_deliveryboy_post()
	{

		$url_login_user_id = $this->get( 'login_user_id' );
		$url_api_key = $this->get( 'api_key' );
		$user_key = $this->post( 'user_key' );
		$current_module = "transactions";
		$action = "edit";

		if(user_access_checking_action( $url_login_user_id, $url_api_key, $user_key, $current_module, $action )) {
			// validation rules for user register
			$rules = array(
				array(
		        	'field' => 'delivery_boy_id',
		        	'rules' => 'required'
		        ),
		        array(
		        	'field' => 'transactions_header_id',
		        	'rules' => 'required'
		        )
	        );


			// exit if there is an error in validation,
	        if ( !$this->is_valid( $rules )) exit;

	        $user_id = $this->post('delivery_boy_id');
	        $users = global_user_check($user_id);


	        //save transaction header
	        $id = $this->post('transactions_header_id');

	        //send noti start

	        $user_id = $this->Transactionheader->get_one($id)->user_id;

	        $delivery_boy_id = $this->post('delivery_boy_id');
	        $existing_deli_boy = $this->Transactionheader->get_one($id)->delivery_boy_id;

			if( $delivery_boy_id != '0' ) {

				if( $delivery_boy_id != "" ){
					if ($delivery_boy_id != $existing_deli_boy) {
						$devices = $this->Notitoken->get_all_device_in($delivery_boy_id)->result();

						$device_ids = array();
						if ( count( $devices ) > 0 ) {
							foreach ( $devices as $device ) {
								$device_ids[] = $device->device_id;
							}
						}

						$platform_names = array();
						if ( count( $devices ) > 0 ) {
							foreach ( $devices as $platform ) {
								$platform_names[] = $platform->platform_name;
							}
						}

						$message = get_msg('have_order_deliver');
						$data['message'] = $message;
						$data['flag'] = 'transaction';
						$data['trans_header_id'] = $id;

						$status = send_android_fcm( $device_ids, $data, $platform_names );

						if ( !$status ) $error_msg .= get_msg('fail_push_all_android') . " <br/>";

						//update deli boy save at trans header
						$trans_data['delivery_boy_id'] = $delivery_boy_id;

						$this->Transactionheader->save($trans_data,$id);
					}	
				}	
			}

			//send noti end

			// update deliboy


	        $data = array(
	        	"delivery_boy_id" => $this->post('delivery_boy_id')
	        );
	        $this->Transactionheader->save($data,$id);
			// get the post data
			$conds['delivery_boy_id'] = $data['delivery_boy_id'];
			// response the inserted object	
			$tmp_deli_com = $this->Transactionheader->get_one( $id );

			$this->custom_response( $tmp_deli_com );
		}	
	}

	 /**
	 * Update payment status
	 */
    
	function update_paymentstatus_post()
	{
		$url_login_user_id = $this->get( 'login_user_id' );
		$url_api_key = $this->get( 'api_key' );
		$user_key = $this->post( 'user_key' );
		$current_module = "transactions";
		$action = "edit";

		if(user_access_checking_action( $url_login_user_id, $url_api_key, $user_key, $current_module, $action )) {

			// validation rules for user register
			$rules = array(
				array(
		        	'field' => 'payment_status_id',
		        	'rules' => 'required'
		        ),
		        array(
		        	'field' => 'transactions_header_id',
		        	'rules' => 'required'
		        )
	        );


			// exit if there is an error in validation,
	        if ( !$this->is_valid( $rules )) exit;

	        //save transaction header
	        $id = $this->post('transactions_header_id');

	        // to send noti start

	        $user_id = $this->Transactionheader->get_one($id)->user_id;

	        $payment_status_id = $this->post('payment_status_id');
	        $existing_payment_id = $this->Transactionheader->get_one( $id )->trans_status_id;

	        if ($payment_status_id != '0') {
				if ($payment_status_id != "") {
					if ($payment_status_id != $existing_payment_id) {

					$title = $this->Paymentstatus->get_one($payment_status_id)->title;
					$message = get_msg('payment_cur_status') . " " . $title;
					
					$data['message'] = $message;
					$data['flag'] = 'transaction';
					$data['trans_header_id'] = $id;

					$devices = $this->Notitoken->get_all_device_in($user_id)->result();

					$device_ids = array();
					if ( count( $devices ) > 0 ) {
						foreach ( $devices as $device ) {
							$device_ids[] = $device->device_id;
						}
					}

					$platform_names = array();
					if ( count( $devices ) > 0 ) {
						foreach ( $devices as $platform ) {
							$platform_names[] = $platform->platform_name;
						}
					}
					
					$status = send_android_fcm( $device_ids, $data, $platform_names );

					if ( !$status ) $error_msg .= get_msg('fail_push_all_android') . " <br/>";

					//update payment status save at trans header

					$trans_data['payment_status_id'] = $payment_id;

					$this->Transactionheader->save($trans_data,$id);

					}
				}
				
			}

			// send noti end

			// update payment status

	        $data = array(
	        	"payment_status_id" => $this->post('payment_status_id')
	        );
	        $this->Transactionheader->save($data,$id);
			// response the inserted object	
			$payment_status = $this->Transactionheader->get_one( $id );

			$this->custom_response( $payment_status );
		}	
	}

	/**
	 * Update transaction status
	 */
    
	function update_trans_status_post()
	{
		$url_login_user_id = $this->get( 'login_user_id' );
		$url_api_key = $this->get( 'api_key' );
		$user_key = $this->post( 'user_key' );
		$current_module = "transactions";
		$action = "edit";

		if(user_access_checking_action( $url_login_user_id, $url_api_key, $user_key, $current_module, $action )) {

			// validation rules for user register
			$rules = array(
				array(
		        	'field' => 'trans_status_id',
		        	'rules' => 'required'
		        ),
		        array(
		        	'field' => 'transactions_header_id',
		        	'rules' => 'required'
		        )
	        );


			// exit if there is an error in validation,
	        if ( !$this->is_valid( $rules )) exit;

	        //save transaction header
	        $id = $this->post('transactions_header_id');

	        // to send noti start

	        $user_id = $this->Transactionheader->get_one($id)->user_id;

			//get existing transaction status id
			$existing_status_id = $this->Transactionheader->get_one( $id )->trans_status_id;
			$status_id = $this->post('trans_status_id');

			$delivery_boy_id = $this->Transactionheader->get_one($id)->delivery_boy_id;

			if ($status_id != "") {
				//check existing and form status
				if ($status_id != $existing_status_id) {

					$title = $this->Transactionstatus->get_one($status_id)->title;
					$message = get_msg('order_status_changed_to') . " " . $title;

					$data['message'] = $message;
					$data['flag'] = $flag;
					$data['trans_header_id'] = $id;

					$devices = $this->Notitoken->get_all_device_in($user_id)->result();

					$device_ids = array();
					if ( count( $devices ) > 0 ) {
						foreach ( $devices as $device ) {
							$device_ids[] = $device->device_id;
						}
					}
	
					$platform_names = array();
					if ( count( $devices ) > 0 ) {
						foreach ( $devices as $platform ) {
							$platform_names[] = $platform->platform_name;
						}
					}
	
					$status = send_android_fcm( $device_ids, $data, $platform_names );
					

					if ( !$status ) $error_msg .= get_msg('fail_push_noti') . "<br/>";


					if( $delivery_boy_id != '0' ) {

						if( $delivery_boy_id != "" ){
							
							$title = $this->Transactionstatus->get_one($status_id)->title;
							$message = get_msg('order_status_changed_to') . " " . $title;
							
							$data['message'] = $message;
							$data['flag'] = 'transaction';
							$data['trans_header_id'] = $id;
		
							$devices = $this->Notitoken->get_all_device_in($delivery_boy_id)->result();
		
							$device_ids = array();
							if ( count( $devices ) > 0 ) {
								foreach ( $devices as $device ) {
									$device_ids[] = $device->device_id;
								}
							}
		
							$platform_names = array();
							if ( count( $devices ) > 0 ) {
								foreach ( $devices as $platform ) {
									$platform_names[] = $platform->platform_name;
								}
							}
		
							$status = send_android_fcm( $device_ids, $data, $platform_names );

							if ( !$status ) $error_msg .= get_msg('fail_push_all_android') . " <br/>";

						}

					}
					
				}
			}
			//send noti end

			// update transaction status

	        $data = array(
	        	"trans_status_id" => $this->post('trans_status_id')
	        );
	        $this->Transactionheader->save($data,$id);
			// response the inserted object	
			$trans_status = $this->Transactionheader->get_one( $id );

			$this->custom_response( $trans_status );
		}	
	}
	
	
	/**
	** pending transaction list
	*/

	function get_pending_transactions_get()
	{
		$this->is_get = true;
		// get limit & offset

		$conds['shop_id'] = $this->get('shop_id');

		$conds_stage['start_stage'] = '1';
		$trans_data = $this->Transactionstatus->get_one_by($conds_stage);
		$conds['trans_status_id'] = $trans_data->id;


		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		$data = $this->Transactionheader->get_all_by($conds,$limit,$offset)->result();

		$this->custom_response($data);

	}

}