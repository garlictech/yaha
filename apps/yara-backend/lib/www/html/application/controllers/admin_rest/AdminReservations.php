<?php
require_once( APPPATH .'controllers/rest/Reservations.php' );

class AdminReservations extends Reservations
{
	/**
	 * Constructs Parent Constructor
	 */
	function __construct()
	{
		parent::__construct( 'Reservation' );

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$url_login_user_id = $this->get( 'login_user_id' );
			$url_api_key = $this->get( 'api_key' );
			$user_key = $this->post( 'user_key' );
			$current_module = "reservations";


			$checking = user_access_checking( $url_login_user_id, $url_api_key, $user_key, $current_module );
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

		$url_login_user_id = $this->get( 'login_user_id' );
		$url_api_key = $this->get( 'api_key' );
		$user_key = $this->post( 'user_key' );
		$current_module = "reservations";
		$action = "edit";

		//print_r($url_login_user_id);die;

		if(user_access_checking_action( $url_login_user_id, $url_api_key, $user_key, $current_module, $action )) {

			//Need to save inside transaction header table 
			$reservation_id = $this->post( 'reservation_id' );
			$resv_data = array(
	 			'user_id' 				=> $this->post('res_user_id'),
	 			'status_id' 			=> $this->post('status_id')
	 		);


	 		//send noti start
	 		$user_id = $this->post( 'res_user_id' );

			$status_id = $this->post( 'status_id' );
			$title = $this->Reservation_status->get_one($status_id)->title;
			$message = get_msg('reservation_status_change') . " " . $title;

			$data['flag'] = 'reservation';
			$data['message'] = $message;
			$data['reservation_id'] = $reservation_id;

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

	 		if( !$this->Reservation->save($resv_data,$reservation_id) ) {
				// rollback the transaction
				$this->error_response( get_msg( 'err_model' ), 500);
			} 
			
			$reservation_obj = $this->Reservation->get_one($reservation_id);

			$this->convert_object($reservation_obj);

			$this->custom_response($reservation_obj);
		}	
	}

	/**
	* Reservation Status List api
	*/

	function get_all_reservation_status_get(){

		$this->is_get = true;
		// get limit & offset
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		$data = $this->Reservation_status->get_all_by($conds,$limit,$offset)->result();

		$this->custom_response($data);
	}

	/**
	* Reservation Status List api
	*/

	function get_pending_reservation_get(){

		$this->is_get = true;
		// get limit & offset
		$conds['shop_id'] = $this->get('shop_id');
		$conds['status_id'] = "1";
		$limit = $this->get( 'limit' );
		$offset = $this->get( 'offset' );

		$data = $this->Reservation->get_all_by($conds,$limit,$offset)->result();

		$this->custom_response($data);
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