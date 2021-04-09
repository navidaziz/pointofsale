<div class="row">
	<div class="col-sm-12">
		<div class="page-header" style="min-height: 10px !important;">
			<ul class="breadcrumb">
				<li>
					<i class="fa fa-home"></i>
					<a href="<?php echo site_url(ADMIN_DIR . $this->session->userdata("role_homepage_uri")); ?>"><?php echo $this->lang->line('Home'); ?></a>
				</li>

				<li>Sale Point</li>
			</ul>
		</div>
	</div>
</div>



<div class="row">
	<div class="col-md-6">
		<div class="box border blue" id="messenger">
			<div class="box-title">
				<h4><i class="fa fa-bell"></i>Sale Item List</h4>
			</div>
			<div class="box-body">
				<div class="table-responsive">
					<div class="ui-widget">
						<table class="table">
							<tr>
								<td style="width: 100px;">
									<h5>Search Item</h5>
								</td>
								<td><input id="tags" name="search_sale_item" value="" placeholder="Search Sale Item" class="form-control" /></td>
							</tr>
						</table>

						<div id="item_list">
							<?php echo $user_items_list; ?>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		var availableTags = [
			<?php foreach ($sale_items as $sale_item) {
				echo '"' . $sale_item->name . '", ';
				if ($sale_item->name != "") {
					echo '"' . $sale_item->item_code_no . '", ';
				}
			} ?>
		];
		$("#tags").autocomplete({
			source: availableTags
		});
	});

	$('#tags').on('keydown', function(e) {
		if (e.keyCode == 13) {
			var search_item = $('#tags').val();
			$('#item_list').html('<p style="text-align:center"><strong>Please Wait...... Loading</strong></p>');
			$.ajax({
				type: "POST",
				url: "<?php echo site_url(ADMIN_DIR . "selling_point/get_search_item") ?>",
				data: {
					search_item: search_item
				}
			}).done(function(data) {
				$('#item_list').html(data);
			});
		}

	});

	function update_user_item_quantity(user_item_id){
		if(event.key === 'Enter') {
		var item_quantity = $('#user_item_'+user_item_id).val();
					$('#item_list').html('<p style="text-align:center"><strong>Please Wait...... Loading</strong></p>');
					$.ajax({
						type: "POST",
						url: "<?php echo site_url(ADMIN_DIR . "selling_point/update_user_item_quantity") ?>",
						data: {
							user_item_id: user_item_id, 
							item_quantity: item_quantity.replace(/[^a-zA-Z0-9]/g, ''),
						}
					}).done(function(data) {
						$('#item_list').html(data);
					});
		}
					
	}



</script>