<?php 
require_once(APPPATH.'/libraries/REST_Controller.php');

class Reservations extends API_Controller
{
	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Reservation' );
	}
		
	function add_post()
	{
		$send_user = false;
		$send_shop = false;
		
		$data = $this->post();	
		if ($data == null) {
			//$this->response(array('error' => array('message' => 'invalid_json')));
			$this->response(array(
				'status'=>'error',
				'data'	=> 'Invalid JSON')
			);
			
		}
		
		if (!array_key_exists('resv_date', $data)) {
			//$this->response(array('error' => array('message' => 'require_date')));
			$this->response(array(
				'status'=>'error',
				'data'	=> 'require_date')
			);
		}
			
		if (!array_key_exists('resv_time', $data)) {
			//$this->response(array('error' => array('message' => 'require_time')));
			$this->response(array(
				'status'=>'error',
				'data'	=> 'require_time')
			);
		}
		
		if (!array_key_exists('shop_id', $data)) {
			//$this->response(array('error' => array('message' => 'require_shop_id')));
			$this->response(array(
				'status'=>'error',
				'data'	=> 'require_shop_id')
			);
		}
		//$num_padded = sprintf("%02d", $num);
		$ts = explode(":",$data['resv_time']);
		
		$min_num_padded = sprintf("%02d", $ts[1]);
		$hour_num_padded = sprintf("%02d", $ts[0]);
		
		
		$t = $hour_num_padded . ":". $min_num_padded;
		
		$reservation_data = array(
			'resv_date'      => $data['resv_date'],
			'resv_time'      => $t,
			'note'           => $data['note'],
			'shop_id'        => $data['shop_id'],
			'user_id'        => $data['user_id'],
			'user_email'     => $data['user_email'],
			'user_phone_no'  => $data['user_phone_no'],
			'user_name'      => $data['user_name'],
			'status_id'      => 1 
		);
		
		
		$this->Reservation->save($reservation_data);


		// send reservation noti to super admin
		$reservation_id = $reservation_data['id']; 
		$user_id = 'c4ca4238a0b923820dcc509a6f75849b' ;
		$super_devices = $this->Notitoken->get_all_device_in($user_id)->result();

		$super_device_ids = array();
		if ( count( $super_devices ) > 0 ) {
			foreach ( $super_devices as $super_device ) {
				$super_device_ids[] = $super_device->device_id;
			}
		}

		$platform_names = array();
		if ( count( $super_devices ) > 0 ) {
			foreach ( $super_devices as $platform ) {
				$platform_names[] = $platform->platform_name;
			}
		}

		$data['message'] = get_msg('reservation_receive');
		$data['user_id'] = $this->post('user_id');
	    $data['user_name'] = $this->post('user_name');
	    $data['reservation_id'] = $reservation_id;
		$data['flag'] = 'reservation_super';

		$status = send_android_fcm( $super_device_ids, $data, $platform_names );

		// send reservation noti to shop admin

		$conds_shop['shop_id'] = $this->post('shop_id');
		$user_shop_data = $this->User_shop->get_shop_admin($conds_shop)->result();

		foreach ( $user_shop_data as $user_shop ) {

			$shop_admin_ids .= "" .$user_shop->user_id . ",";
	
		}

		$shop_admin_ids = rtrim($shop_admin_ids,',');
		$result_shop_admin = explode(',', $shop_admin_ids);

		for ($i=0; $i <count($result_shop_admin) ; $i++) { 

			$user_id = $result_shop_admin[$i];
			
			$shop_devices = $this->Notitoken->get_all_device_in($user_id)->result();


			$shop_device_ids = array();
			if ( count( $shop_devices ) > 0 ) {
				foreach ( $shop_devices as $shop_device ) {
					$shop_device_ids[] = $shop_device->device_id;
				}
			}

			$platform_names = array();
			if ( count( $shop_devices ) > 0 ) {
				foreach ( $shop_devices as $platform ) {
					$platform_names[] = $platform->platform_name;
				}
			}

			$data['message'] = get_msg('reservation_receive');
			$data['user_id'] = $this->post('user_id');
	    	$data['user_name'] = $this->post('user_name');
	    	$data['reservation_id'] = $reservation_id;
			$data['flag'] = 'reservation_shop';

			$status = send_android_fcm( $shop_device_ids, $data, $platform_names );
		}
		
		//Temp
		// $this->response(array(
		// 	'status'=>'success',
		// 	'data'	=> "Reservation is successfully submitted. Email successfully sent to User and Shop")
		// );
		
		if(send_email_to_user($data['user_id'],$data['user_email'],$data['user_name'],$data['user_phone_no'],$data['shop_id'],$reservation_data['id'],$data['resv_date'],$data['resv_time'],$data['note']))
		{
			$send_user = true;
		}
		
		if(send_email_to_shop($data['user_id'],$data['user_email'],$data['user_name'],$data['user_phone_no'],$data['shop_id'],
		  $reservation_data['id'],$data['resv_date'],$data['resv_time'],$data['note']))
		{
			$send_shop = true;
		}
		
		if($send_user && $send_shop) {
			
			//$this->response(array('success_status'=>1,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully inserted.
			$this->response(array(
				'status'=>'success',
				'data'	=> get_msg('res_send_email_to_user_shop'))
			);
		} else if($send_user && !$send_shop){
			
			//$this->response(array('success_status'=>2,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully submitted but email cannot send to shop.
			$this->response(array(
				'status'=>'success',
				'data'	=> get_msg('res_not_send_email_to_shop'))
			);
		} else if(!$send_user && $send_shop){
			
			//$this->response(array('success_status'=>3,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully submitted but email cannot send to user.
			$this->response(array(
				'status'=>'success',
				'data'	=> get_msg('res_not_send_email_to_user'))
			);
		} else if(!$send_user && !$send_shop){
			
			//$this->response(array('success_status'=>4,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully submitted but email cannot send to both user and shop.
			$this->response(array(
				'status'=>'success',
				'data'	=> get_msg('res_not_send_email_to_user_shop'))
			);
		} else {
		
			//$this->response(array('error'=>'reservation_email_error'));
			//$this->response(array('success_status'=>1,'reserve_id'=>$reservation_data['id']));
			$this->response(array(
				'status'=>'error',
				'data'	=> get_msg('reservation_submit_error'))
			);
		}
		
		
		
		
	}
	
	
	
	
	function get_reservation_status_by_id_get() 
	{
		$resv_id = $this->get('resv_id');
		if (!$resv_id) {
			$this->response(array('error' => array('message' => 'require_resv_id')));
		}
		
		$this->response(array('reserve_status'=>$this->Reservation_status->get_info($this->Reservation->get_info($resv_id)->status_id)->title));
	}
	
	function get_all_reservation_by_user_get() 
	{
		$this->is_get = true;
		// get limit & offset
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );
		// get id
		$user_id = $this->get('user_id');
		$conds['user_id'] = $user_id;
		if (!$user_id) {
			$this->response(array('error' => array('message' => 'require_user_id')));
		}

		$data = array();
		$data = $this->Reservation->get_all_by($conds,$limit,$offset)->result();
		
		$this->custom_response( $data ,$offset);
		
	}

	function reservation_status_update_post()
	{
		//Need to save inside transaction header table 
		$reservation_id = $this->post( 'reservation_id' );
		$resv_data = array(
 			'user_id' 				=> $this->post( 'user_id' ),
 			'status_id' 			=> $this->post( 'status_id' )
 		);

 		if( !$this->Reservation->save($resv_data,$reservation_id) ) {
			// rollback the transaction
			$this->error_response( get_msg( 'err_model' ), 500);
		} 
		
		$reservation_obj = $this->Reservation->get_one($reservation_id);

		$this->convert_object($reservation_obj);

		$this->custom_response($reservation_obj);
	}

	/**
	 * Convert Object
	 */
	function convert_object( &$obj )
	{
		// call parent convert object
		parent::convert_object( $obj );

		// convert customize product object
		$this->ps_adapter->convert_reservation( $obj );
	}
	
}
?>