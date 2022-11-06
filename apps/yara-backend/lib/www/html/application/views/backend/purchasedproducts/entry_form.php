
<?php
	$attributes = array( 'id' => 'purchasedproduct-form', 'enctype' => 'multipart/form-data');
	echo form_open( '', $attributes);
?>

<section class="content animated fadeInRight">
			
	<div class="card card-info">
      	<div class="card-header">
        	<h3 class="card-title"><?php echo get_msg('prd_info')?></h3>
      	</div>

    <form role="form">
        <div class="card-body">
        	<div class="row">
        		<div class="col-md-6">
	        		<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('product_name')?>
						</label>

						<?php echo form_input( array(
							'name' => 'name',
							'value' => set_value( 'name', show_data( @$purchasedproduct->name), false ),
							'class' => 'form-control form-control-sm',
							'placeholder' => get_msg('pls_prd_name'),
							'id' => 'name',
							'readonly' => 'true'
						)); ?>

					</div>

					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('Prd_search_cat')?>
						</label>

						<?php
							$options=array();
							$conds['shop_id'] = $selected_shop_id;
							$options[0]=get_msg('Prd_search_cat');
							$categories = $this->Category->get_all_by($conds);
							foreach($categories->result() as $cat) {
									$options[$cat->id]=$cat->name;
							}

							echo form_dropdown(
								'cat_id',
								$options,
								set_value( 'cat_id', show_data( @$purchasedproduct->cat_id), false ),
								'class="form-control form-control-sm mr-3" disabled="disabled" id="cat_id"'
							);
						?>
					</div>

					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('Prd_search_subcat')?>
						</label>

						<?php
							if(isset($purchasedproduct)) {
								$options=array();
								$options[0]=get_msg('Prd_search_subcat');
								$conds['cat_id'] = $purchasedproduct->cat_id;
								$sub_cat = $this->Subcategory->get_all_by($conds);
								foreach($sub_cat->result() as $subcat) {
									$options[$subcat->id]=$subcat->name;
								}
								echo form_dropdown(
									'sub_cat_id',
									$options,
									set_value( 'sub_cat_id', show_data( @$purchasedproduct->sub_cat_id), false ),
									'class="form-control form-control-sm mr-3" disabled="disabled" id="sub_cat_id"'
								);

							} else {
								$conds['cat_id'] = $selected_cat_id;
								$options=array();
								$options[0]=get_msg('Prd_search_subcat');

								echo form_dropdown(
									'sub_cat_id',
									$options,
									set_value( 'sub_cat_id', show_data( @$purchasedproduct->sub_cat_id), false ),
									'class="form-control form-control-sm mr-3" disabled="disabled" id="sub_cat_id"'
								);
							}
							
						?>

					</div>

					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('prd_high_info')?>
						</label>

						<?php echo form_textarea( array(
							'name' => 'highlight_information',
							'value' => set_value( 'info', show_data( @$purchasedproduct->highlight_information), false ),
							'class' => 'form-control form-control-sm',
							'placeholder' => get_msg('pls_highlight_info'),
							'id' => 'info',
							'rows' => "3",
							'readonly' => 'true'
						)); ?>

					</div>


					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('prd_code')?>
						</label>

						<?php echo form_input( array(
							'name' => 'code',
							'value' => set_value( 'code', show_data( @$purchasedproduct->code), false ),
							'class' => 'form-control form-control-sm',
							'placeholder' => get_msg('pls_code'),
							'id' => 'code',
							'readonly' => 'true'
						)); ?>

					</div>

					<div class="form-group" id="color-picker-group">
	                    <label><?php echo get_msg('color_code')?>
							<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo get_msg('color_code')?>">
								<span class='glyphicon glyphicon-info-sign menu-icon'>
							</a>
						</label>
						<!-- purchasedproduct color for edit -->
						<?php if ( isset( $purchasedproduct )) { ?>

							<?php 

								$colors = $this->Color->get_all_by( array( 'product_id' => @$purchasedproduct->id ))->result(); 
								$color_count = count($colors);
							?>

								

							<?php if ( !empty( $colors )){ ?>

								<?php 
									$i = 0;
									foreach( $colors as $color ): 
									$i++;
								?>
								<div id="<?php echo 'colorvalue' . $i ?>" class="input-group my-colorpicker2">
									<?php echo form_input(array(
										'name' => 'colorvalue' . $i,
										'value' => $color->color_value,
										'class' => 'form-control form-control-sm mt-1',
										'placeholder' => "",
										'id' => 'colorvalue' .$i,
										'readonly' => 'true'
									)); ?>
									<div class="input-group-addon mt-1"><i></i></div>
								</div>
									<?php endforeach; ?>

							<?php }else{ ?>
								<div id="colorvalue1" class="input-group my-colorpicker2">
									<?php echo form_input(array(
										'name' => 'colorvalue1',
										'value' => set_value( 'colorvalue1', show_data( @$purchasedproduct->colorvalue1), false ),
										'class' => 'form-control form-control-sm mt-1',
										'placeholder' => "",
										'id' => 'colorvalue1',
										'readonly' => 'true'
									)); ?>
								<div class="input-group-addon mt-1"><i></i></div>
							</div>
							<?php } ?>
						<!-- purchasedproduct color for save -->
						<?php } else { ?>
							<div id="colorvalue1" class="input-group my-colorpicker2">
								<?php echo form_input(array(
									'name' => 'colorvalue1',
									'value' => set_value( 'colorvalue1', show_data( @$purchasedproduct->colorvalue1), false ),
									'class' => 'form-control form-control-sm mt-1',
									'placeholder' => "",
									'id' => 'colorvalue1',
									'readonly' => 'true'
								)); ?>
								<div class="input-group-addon mt-1"><i></i></div>
							</div>
						<?php } ?>
              		</div>
		           
            	</div>

            	<div class="col-md-6">
					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('unit_price')?>
						</label>

						<?php echo form_input( array(
							'name' => 'unit_price',
							'value' => set_value( 'unit_price', show_data( @$purchasedproduct->unit_price), false ),
							'class' => 'form-control form-control-sm',
							'placeholder' => get_msg('pls_unit_price'),
							'id' => 'unit_price',
							'readonly' => 'true'
						)); ?>

					</div>

					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('search_tag')?>
						</label>

						<?php echo form_input( array(
							'name' => 'search_tag',
							'value' => set_value( 'search_tag', show_data( @$purchasedproduct->search_tag), false ),
							'class' => 'form-control form-control-sm',
							'placeholder' => get_msg('pls_search_tag'),
							'id' => 'search_tag',
							'readonly' => 'true'
						)); ?>

					</div>

					<div class="form-group">
						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('prd_desc')?>
						</label>

						<?php echo form_textarea( array(
							'name' => 'description',
							'value' => set_value( 'desc', show_data( @$purchasedproduct->description), false ),
							'class' => 'form-control form-control-sm',
							'placeholder' => get_msg('pls_prd_desc'),
							'id' => 'desc',
							'rows' => "5",
							'readonly' => 'true'
						)); ?>

					</div>

					<div class="form-group">
						<div class="form-check">
							<label>
							
							<?php echo form_checkbox( array(
								'name' => 'is_featured',
								'id' => 'is_featured',
								'value' => 'accept',
								'checked' => set_checkbox('is_featured', 1, ( @$purchasedproduct->is_featured == 1 )? true: false ),
								'class' => 'form-check-input',
								'onclick' => 'return false'
							));	?>

							<?php echo get_msg( 'is_featured' ); ?>

							</label>
						</div>
					</div>

					<div class="form-group">
						<div class="form-check">
							<label>
							
							<?php echo form_checkbox( array(
								'name' => 'is_available',
								'id' => 'is_available',
								'value' => 'accept',
								'checked' => set_checkbox('is_available', 1, ( @$purchasedproduct->is_available == 1 )? true: false ),
								'class' => 'form-check-input',
								'onclick' => 'return false'
							));	?>

							<?php echo get_msg( 'is_available' ); ?>

							</label>
						</div>
					</div>

					<div class="form-group">
						<div class="form-check">

							<label>
							
								<?php echo form_checkbox( array(
									'name' => 'status',
									'id' => 'status',
									'value' => 'accept',
									'checked' => set_checkbox('status', 1, ( @$purchasedproduct->status == 1 )? true: false ),
									'class' => 'form-check-input',
									'onclick' => 'return false'
								));	?>

								<?php echo get_msg( 'status' ); ?>
							</label>
						</div>
					</div>


				</div>
    		</div>
    		
    		<label><?php echo get_msg('prd_specification')?></label>
    		<!-- purchasedproduct specification for edit -->
			<?php if ( isset( $purchasedproduct )){ ?>

				<?php 

					$spec_data = $this->Specification->get_all_by( array( 'product_id' => @$purchasedproduct->id ))->result(); 
					$specs_count = count($spec_data);

					//counter need to plus one for edit default 
					$spec_data_count = $specs_count + 1;
				?>

					

				<?php if ( !empty( $spec_data )): ?>

					<?php 
						$i = 0;
						foreach( $spec_data as $spec ): 
						$i++;
					?>

					<div id="spec_data">
		    			<div class="col-md-6">
		    				<div class="form-group">
								<label>
									<?php echo get_msg('product_title') . " : " . $i?>
								</label>
								
								<?php echo form_input( array(
									'name' => 'prd_spec_title' . $i,
									'value' => $spec->name,
									'class' => 'form-control form-control-sm',
									'id' => 'prd_spec_title' . $i,
									'readonly' => 'true'
								)); ?>
							
							</div>

							<div class="form-group">
								<label>
									<?php echo get_msg('product_desc') . " : "  .$i?>
								</label>
								
								<?php echo form_input( array(
									'name' => 'prd_spec_desc' . $i,
									'value' => $spec->description,
									'class' => 'form-control form-control-sm',
									'id' => 'prd_spec_desc' . $i,
									'readonly' => 'true'
								)); ?>
								
							</div>
						</div>		
		    		</div>
		    		<?php endforeach; ?>

				<?php endif; ?>
				<!-- Edit Default save -->
				<div id="spec_data">
					<div class="col-md-6">
    					<div class="form-group">
							<label>
								<?php echo get_msg('product_title') . " : " . $spec_data_count ?>
							</label>
						
							<?php echo form_input( array(
								'name' => 'prd_spec_title'.$spec_data_count,
								'value' => set_value( 'prd_spec_title1', show_data( @$purchasedproduct->prd_spec_title1), false ),
								'class' => 'form-control form-control-sm',
								'id' => 'prd_spec_title'.$spec_data_count,
								'readonly' => 'true'
							)); ?>
						
						</div>

						<div class="form-group">
							<label>
								<?php echo get_msg('product_desc') . " : " . $spec_data_count ?>
							</label>
							
							<?php echo form_input( array(
								'name' => 'prd_spec_desc'.$spec_data_count,
								'value' => set_value( 'prd_spec_desc1', show_data( @$purchasedproduct->prd_spec_desc1), false ),
								'class' => 'form-control form-control-sm',
								'id' => 'prd_spec_desc'.$spec_data_count,
								'readonly' => 'true'
							)); ?>
							
						</div>
    				</div>
    			</div>

			<!-- purchasedproduct specification for save -->
			<?php } else { ?>
	    		<div id="spec_data">
	    			<div class="col-md-6">
						<div class="form-group">
							<label>
								<?php echo get_msg('product_title') . " : 1"?>
							</label>
							
							<?php echo form_input( array(
								'name' => 'prd_spec_title1',
								'value' => set_value( 'prd_spec_title1', show_data( @$purchasedproduct->prd_spec_title1), false ),
								'class' => 'form-control form-control-sm',
								'id' => 'prd_spec_title1',
								'readonly' => 'true'
							)); ?>
							
						</div>

						<div class="form-group">
							<label>
								<?php echo get_msg('product_desc') . " : 1"?>
							</label>

							<div class="form-group">
								<?php echo form_input( array(
									'name' => 'prd_spec_desc1',
									'value' => set_value( 'prd_spec_desc1', show_data( @$purchasedproduct->prd_spec_desc1), false ),
									'class' => 'form-control form-control-sm',
									'id' => 'prd_spec_desc1',
									'readonly' => 'true'
								)); ?>
							</div>
						</div>
					</div>
	    		</div>
	    	<?php } ?>
					
			</div>

		<?php 
			if (isset($color_count)) {
				$color_count = $color_count;
			} else {
				$color_count = 0;
			} 
		?>
		<input type="hidden" id="color_total_existing" name="color_total_existing" value="<?php echo $color_count; ?>">

		<?php 
			if (isset($spec_data)) {
				$specs_count = $specs_count;
			} else {
				$specs_count = 0;
			} 
		?>
		<input type="hidden" id="spec_total_existing" name="spec_total_existing" value="<?php echo $specs_count; ?>">

		<?php 
			if ( isset( $purchasedproduct )) { 
		?>
			<input type="hidden" id="edit_purchasedproduct" name="edit_purchasedproduct" value="1">
		<?php		
			} else {
		?>
			<input type="hidden" id="edit_purchasedproduct" name="edit_purchasedproduct" value="0">
		<?php } ?> 

		<input type="hidden" id="is_featured_stage" name="is_featured_stage" value="<?php echo @$purchasedproduct->is_featured; ?>">

	</div>
</section>
<?php echo form_close(); ?>
