<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Model class for category table
 */
class Specification extends PS_Model {

	/**
	 * Constructs the required data
	 */
	function __construct() 
	{
		parent::__construct( 'rt_products_spec', 'id', 'prd_spe' );
	}

	/**
	 * Implement the where clause
	 *
	 * @param      array  $conds  The conds
	 */
	function custom_conds( $conds = array())
	{
		
		// id 
		if ( isset( $conds['id'] )) {
			$this->db->where( 'id', $conds['id'] );
		}

		// product 
		if ( isset( $conds['product_id'] )) {
			$this->db->where( 'product_id', $conds['product_id'] );
		}

		// name 
		if ( isset( $conds['name'] )) {
			$this->db->where( 'name', $conds['name'] );
		}

		// description 
		if ( isset( $conds['desc'] )) {
			$this->db->where( 'description', $conds['desc'] );
		}

		// order_by
		if ( isset( $conds['order_by'] )) {

			$order_by_field = $conds['order_by_field'];
			$order_by_type = $conds['order_by_type'];

			$this->db->order_by( 'rt_products_spec.'.$order_by_field, $order_by_type );
		} else {
			$this->db->order_by( 'added_date', 'asc' );
		}

		
	}
}