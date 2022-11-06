<script>
			
	$(document).ready(function(){
		$('#reserve-form').validate({
			rules:{
				resv_date:{
					required: true
				}
			},
			messages:{
				resv_date:{
					required: "<?php echo get_msg('err_reservation_date'); ?>"
				}
			}
		});
		
	});
	
</script>