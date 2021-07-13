<!-- PAGE HEADER-->
<div class="row">
	<div class="col-sm-12">
		<div class="page-header">
			<!-- STYLER -->

			<!-- /STYLER -->
			<!-- BREADCRUMBS -->
			<ul class="breadcrumb">
				<li>
					<i class="fa fa-home"></i>
					<a href="<?php echo site_url(ADMIN_DIR . $this->session->userdata("role_homepage_uri")); ?>"><?php echo $this->lang->line('Home'); ?></a>
				</li>
				<li>
					<i class="fa fa-table"></i>
					<a href="<?php echo site_url(ADMIN_DIR . "suppliers/view/"); ?>"><?php echo $this->lang->line('Suppliers'); ?></a>
				</li>
				<li>
					<a href="<?php echo site_url(ADMIN_DIR . "suppliers/view_supplier/" . $suppliers[0]->supplier_id); ?>">
						<?php echo $title; ?>
					</a>
				</li>
				<li>Invoice-<?php echo $suppliers_invoices->supplier_invoice_number; ?></li>
			</ul>
			<!-- /BREADCRUMBS -->
			<div class="row">

				<div class="col-md-6">
					<div class="clearfix">
						<h3 class="content-title pull-left"><?php echo $title; ?> - Invoice No: <?php echo $suppliers_invoices->supplier_invoice_number; ?></h3>
					</div>
					<div class="description">
						Invoice-<?php echo $suppliers_invoices->supplier_invoice_number; ?> -
						Date - <?php echo $suppliers_invoices->invoice_date; ?>
					</div>
				</div>

				<div class="col-md-6">

				</div>

			</div>


		</div>
	</div>
</div>
<!-- /PAGE HEADER -->

<!-- PAGE MAIN CONTENT -->
<div class="row">
	<!-- MESSENGER -->
	<div class="col-md-12">
		<div class="box border blue" id="messenger">
			<div class="box-title">
				<h4><i class="fa fa-files-o"></i> Invoice No: <?php echo $suppliers_invoices->supplier_invoice_number; ?> Items List</h4>
			</div>
			<div class="box-body">

				<div class="table-responsive">

					<h4> Invoice No: <?php echo $suppliers_invoices->supplier_invoice_number; ?>
						- Dated: <?php echo $suppliers_invoices->invoice_date; ?> Items List</h4>
					</h4>
					<script>
						function stock_in() {
							$('#stock_in').show();
							$('#stock_return').hide();
						}

						function stock_return() {
							$('#stock_in').hide();
							$('#stock_return').show();
						}

						function get_item_prices(id) {
							alert($('#' + id + ' option:selected').val());
						}
					</script>
					<form method="post" action="<?php echo  site_url(ADMIN_DIR . "suppliers/add_item_stocks") ?>">
						Stock In: <input type="radio" value="stock_in" name="traction_type" onclick="stock_in()" checked="checked" />
						Stock Return: <input type="radio" value="stock_return" onclick="stock_return()" name="traction_type" />
						<table class="table table-bordered table2" style="line-height: 0.5px; display:no ne" id="stock_in">
							<input type="hidden" value="<?php echo  $suppliers[0]->supplier_id; ?>" name="supplier_id" />
							<input type="hidden" value="<?php echo  $suppliers_invoices->supplier_invoice_id; ?>" name="supplier_invoice_id" />

							<tr>
								<td>
									<strong>Items</strong>
									<?php
									echo form_dropdown("item_id1", $items, "", "id = \"item_id1\" class=\"form - control\" onchange=\"get_item_prices('item_id1')\" required style=\"width:150px\"");
									?>
								</td>
								<td>
									<strong>Batch Number</strong>
									<input style="width: 80px;" type="text" name="batch_number" value="" id="batch_number" class="form - control" required="required" title="Batch Number" placeholder="Batch Number">
								</td>
								<td>
									<strong>Cost Price</strong>
									<input style="width: 80px;" type="number" step="any" name="cost_price" value="" id="cost_price" class="form - control" required="required" title="Cost Price" placeholder="Cost Price">
								</td>
								<td>
									<strong>Unit Price</strong>
									<input style="width: 80px;" type="number" step="any" name="unit_price" value="" id="unit_price" class="form - control" title="Unit Price" placeholder="Unit Price">
								</td>
								<td>
									<strong>Total New Stock</strong>
									<input style="width: 80px;" type="number" name="transaction" value="" id="transaction" class="form - control" title="Unit" placeholder="Transaction">
								</td>
								<td>
									<strong>Date</strong>
									<input style="width: 130px;" type="date" name="date" value="" id="date" class="form - control" title="date" placeholder="date" />
								</td>

								<td>
									<strong>Action</strong>
									<input class="btn btn-primary btn-sm" type="submit" name="add_stock" value="Add Stock" />
								</td>
							</tr>
						</table>
					</form>
					<form method="post" action="<?php echo  site_url(ADMIN_DIR . "suppliers/return_item_stocks") ?>">
						<table class="table table-bordered table2" style="line-height: 0.5px; display:none" id="stock_return">
							<input type="hidden" value="<?php echo  $suppliers[0]->supplier_id; ?>" name="supplier_id" />
							<input type="hidden" value="<?php echo  $suppliers_invoices->supplier_invoice_id; ?>" name="supplier_invoice_id" />

							<tr>
								<td>
									<strong>Items</strong>
									<?php
									echo form_dropdown("item_id", $items, "", "class=\"form - control\" required style=\"width:150px\"");
									?>
								</td>
								<td>
									<strong>Total Stock Return</strong>
									<input type="number" name="transaction" value="" id="transaction" class="form - control" title="Unit" placeholder="Transaction">
								</td>
								<td>
									<strong>Date</strong>
									<input type="date" name="date" value="" id="date" class="form - control" title="date" placeholder="date" />
								</td>

								<td>
									<strong>Remarks</strong>
									<input type="text" name="remarks" value="" id="remarks" class="form - control" title="remarks" placeholder="remarks" />
								</td>

								<td>
									<strong>Action</strong>
									<input class="btn btn-danger btn-sm" type="submit" name="return_stock" value="Return Stock" />
								</td>
							</tr>
						</table>
					</form>


					<table class="table table-bordered table2">
						<thead>
							<th>#</th>
							<th>Item Name</th>
							<th>Batch Number</th>
							<th>Expiry Date</th>
							<th>Quantity</th>
							<th>Trade Price</th>
							<th>Net Amount</th>
							<th>Unit Price</th>
							<th>Transaction Type</th>
							<th>Remarks</th>
							<th>Created By</th>
						</thead>
						<tbody>
							<?php
							$count = 1;
							foreach ($inventories as $inventory) : ?>
								<tr>
									<td><?php echo $count++; ?></td>
									<td><?php echo $inventory->name; ?></td>
									<td><?php echo $inventory->batch_number; ?></td>
									<td><?php echo date('d M, Y', strtotime($inventory->expiry_date)); ?></td>
									<td><?php echo $inventory->inventory_transaction; ?></td>
									<td><?php echo $inventory->item_cost_price; ?></td>
									<td><?php echo $inventory->item_cost_price * $inventory->inventory_transaction; ?></td>
									<td><?php echo $inventory->item_unit_price; ?></td>
									<td><strong><?php echo $inventory->transaction_type; ?></strong></td>
									<td><?php echo $inventory->remarks; ?></td>
									<td><?php echo $inventory->user_title; ?></td>
								</tr>

							<?php endforeach; ?>
						</tbody>
					</table>




				</div>


			</div>

		</div>
	</div>
	<!-- /MESSENGER -->
</div>