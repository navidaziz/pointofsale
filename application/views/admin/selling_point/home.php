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
	<div class="col-md-7">
		<div class="box border blue" id="messenger">
			<div class="box-title">
				<h4><i class="fa fa-bell"></i>Sale Item List</h4>
			</div>
			<div class="box-body">
				<div class="table-responsive">
					<div class="ui-widget" style="height: 450px;">
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
	<div class="col-md-5">
		<div class="box border blue" id="messenger">
			<div class="box-title">
				<h4><i class="fa fa-bell"></i>Sale Summary</h4>
			</div>
			<div class="box-body">
				<div class="table-responsive">
					<div class="ui-widget">

						<div id="item_sale_summary">
							<?php echo $items_sale_summary; ?>
						</div>


						<table class="table table-bordered">
							<tr>
								<th>Payment Type</th>
								<td> Cash <input onclick="$('#remarks_tr').hide()" checked type="radio" name="payment_type" value="cash" /></td>
								<td> Check <input onclick="$('#remarks_tr').show()" type="radio" name="payment_type" value="check" /></td>
								<td> Debit Card <input onclick="$('#remarks_tr').show()" type="radio" name="payment_type" value="debit_card" /></td>
								<td> Credit Card <input onclick="$('#remarks_tr').show()" type="radio" name="payment_type" value="credit_card" /></td>

							</tr>
							<tr style="display: none;" id="remarks_tr">
								<td>Remarks</td>
								<td colspan="4"><input type="text" name="remarks" id="remarks" value="" class="form-control" /></td>
							</tr>
						</table>
						<table class="table table-bordered">
							<tr>
								<th>Discount <input required="required" onkeyup="add_discount()" type="number" class="form-control" name="discount" id="discount" value="0" /></th>
								<th>Cash Amount <input required="required" onkeyup="cash_calulator()" type="number" class="form-control" name="cash_amount" id="cash_amount" value="0" /></th>
								<th style="width: 120px;">Cash Back <h4>Rs: <span id="cash_back">0.00<span></h4>
								</th>

							</tr>

							<tr>
								<th>Customer Mobile No <input type="text" class="form-control" name="customer_mobile_no" id="customer_mobile_no" /></th>
								<th>Customer Name <input type="text" class="form-control" name="customer_name" id="customer_name" /></th>
								<th><button onclick="save_data()" class="btn btn-success" style="margin-top: 10px; width:100%">Complete <br /> Sale</button>
								</th>

							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script>
	function save_data() {

		var payment_type = $("input[name='payment_type']:checked").val();
		remarks = $('#remarks').val();
		discount = parseFloat($('#discount').val());
		if (!$('#discount').val()) {
			//alert('Discount Field is empty');
			$('#discount').val(0);
			return;
		}
		cash_amount = parseFloat($('#cash_amount').val());
		customer_name = $('#customer_name').val();
		customer_mobile_no = $('#customer_mobile_no').val();
		pay_able_total = parseFloat($('#pay_able_total').html());
		cash_back = parseFloat($('#cash_back').html());
		if (cash_amount == 0) {
			alert("Cash Amout is Zero");
			return false;
		}
		if (cash_amount < pay_able_total) {
			alert("Cash Amout is less the Payable total amount");
			return false;
		}

		$.ajax({
			type: "POST",
			url: "<?php echo site_url(ADMIN_DIR . "selling_point/add_sale_data") ?>",
			data: {
				payment_type: payment_type,
				remarks: remarks,
				discount: discount,
				cash_amount: cash_amount,
				customer_name: customer_name,
				customer_mobile_no: customer_mobile_no,
				pay_able_total: pay_able_total,
				cash_back: cash_back,
			}
		}).done(function(data) {
			printWindow = window.open('');
			printWindow.document.write(data);
			printWindow.print();

		});



	}

	function add_discount() {
		discount = parseFloat($('#discount').val());
		pay_able = parseFloat($('#pay_able').html());
		$('#payment_discount').html(discount);
		$('#pay_able_total').html(pay_able - discount);
		cash_calulator();

	}

	function cash_calulator() {
		cash_amount = parseFloat($('#cash_amount').val());
		pay_able_total = parseFloat($('#pay_able_total').html());
		$('#cash_back').html(cash_amount - pay_able_total);
	}

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
				get_user_sale_summary();
			});
		}

	});

	function update_user_item_quantity(user_item_id) {
		if (event.key === 'Enter') {
			var item_quantity = $('#user_item_' + user_item_id).val();
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
				get_user_sale_summary();

			});
		}

	}

	function get_user_sale_summary() {

		//$('#item_sale_summary').html('<p style="text-align:center"><strong>Please Wait...... Loading</strong></p>');
		$.ajax({
			type: "POST",
			url: "<?php echo site_url(ADMIN_DIR . "selling_point/user_items_sale_summary") ?>",
			data: {}
		}).done(function(data) {
			$('#item_sale_summary').html(data);
		});


	}
</script>