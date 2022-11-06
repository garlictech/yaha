<?php
	$attributes = array( 'id' => 'collection-form', 'enctype' => 'multipart/form-data');
	echo form_open( '', $attributes);
?>
	<div class="content animated fadeInRight">
		<div class="card card-info" style="padding: 10px 30px 10px 30px;">
		    <div class="card-header">
		        <h3 class="card-title"><?php echo get_msg('best_choice_info')?></h3>
		    </div>
	        <!-- /.card-header -->
	        <div class="card-body">
	            <div class="row">
	             	<div class="col-md-6">
						<div class="form-group">
	                   		<label> <span style="font-size: 17px; color: red;">*</span>
								<?php echo get_msg('best_choice_name')?>
								<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo get_msg('name_tooltips')?>">
									<span class='glyphicon glyphicon-info-sign menu-icon'>
								</a>
							</label>

							<?php echo form_input( array(
								'name' => 'name',
								'value' => set_value( 'name', show_data( @$collection->name), false ),
								'class' => 'form-control form-control-sm',
								'placeholder' => get_msg('pls_collect_name'),
								'id' => 'name'
							)); ?>

						</div>

						<div class="form-group">
							<div class="form-check">

								<label class="form-check-label">
								
									<?php echo form_checkbox( array(
										'name' => 'status',
										'id' => 'status',
										'value' => 'accept',
										'checked' => set_checkbox('status', 1, ( @$collection->status == 1 )? true: false ),
										'class' => 'form-check-input'
									));	?>

								<?php echo get_msg( 'status' ); ?>

								</label>
							</div>
						</div>
					</div>
					

					<div class="col-md-6">
						<?php if ( !isset( $collection )): ?>

							<div class="form-group">
								
								<label> <span style="font-size: 17px; color: red;">*</span>
									<?php echo get_msg('best_choice_photo')?>
								</label>

								<br/>

								<input class="btn btn-sm" type="file" name="image" id="image">
							</div>

						<?php else: ?>

						<label> <span style="font-size: 17px; color: red;">*</span>
							<?php echo get_msg('best_choice_photo')?>
						</label> 
						
							<div class="btn btn-sm btn-primary btn-upload pull-right" data-toggle="modal" data-target="#uploadImage">
								<?php echo get_msg('btn_replace_photo')?>
							</div>
						
						<hr/>
						
						<?php
							$conds = array( 'img_type' => 'collection', 'img_parent_id' => $collection->id );
							$images = $this->Image->get_all_by( $conds )->result();
						?>
							
						<?php if ( count($images) > 0 ): ?>
							
							<div class="row">

							<?php $i = 0; foreach ( $images as $img ) :?>

								<?php if ($i>0 && $i%3==0): ?>
										
								</div><div class='row'>
								
								<?php endif; ?>
									
								<div class="col-md-4" style="height:100">

									<div class="thumbnail">

										<img src="<?php echo $this->ps_image->upload_thumbnail_url . $img->img_path; ?>">

										<br/>
										
										<p class="text-center">
											
											<a data-toggle="modal" data-target="#deletePhoto" class="delete-img" id="<?php echo $img->img_id; ?>"   
												image="<?php echo $img->img_path; ?>">
												<?php echo get_msg('remove_label'); ?>
											</a>
										</p>

									</div>

								</div>

							<?php $i++; endforeach; ?>

							</div>
						
						<?php endif; ?>

						<?php endif; ?>	

						
					</div>
				</div>	
				<hr/>

				<div class="table-responsive" style="padding: 10px 20px 5px 10px;">
				    <div class="col-md-12">
						  <table id="product-table" class="table table-bordered table-striped table-hover">
						     
						     <thead>
							      <tr>
							      	<th><input name="select_all" value="1" type="checkbox"></th>
							     	<th><?php echo get_msg('prd_name'); ?></th>
							     	<th><?php echo get_msg('prd_code'); ?></th>
					         	    <th><?php echo get_msg('product_price') . '(' . $this->Shop->get_one('1')->currency_symbol . ')' ; ?></th>
							      </tr>
							   </thead>
						     <tbody>
						     </tbody>
					   	  </table>

			   	 	</div>
	    		</div>
	   		</div>

	   		<div class="card-footer">
	   			<button type="submit" class="btn btn-sm btn-primary">
					<?php echo get_msg('btn_save')?>
				</button>

				<a href="<?php echo $module_site_url; ?>" class="btn btn-sm btn-primary">
					<?php echo get_msg('btn_cancel')?>
				</a>

				<div id="divCheckbox" style="display: none;"> 
					<p><b>Selected rows data:</b></p>
					<pre id="example-console-rows"></pre>

					<p><b>Form data as submitted to the server:</b></p>
					<pre id="example-console-form"></pre>


					<input type="text" name="newchkval" id="newchkval" size="300">


				</div> 
	   		</div>
		</div>
	</div>

<?php echo form_close(); ?>
