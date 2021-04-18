Search By Receipt No: <input type="text" name="search_receipt_no" id="search_receipt_no" />
<script>
    $('#search_receipt_no').on('keydown', function(e) {
        if (e.keyCode == 13) {
            var receipt_no = $('#search_receipt_no').val();
            // $('#item_list').html('<p style="text-align:center"><strong>Please Wait...... Loading</strong></p>');
            $.ajax({
                type: "POST",
                url: "<?php echo site_url(ADMIN_DIR . "sale_point/search_by_receiot_no") ?>",
                data: {
                    receipt_no: receipt_no
                }
            }).done(function(data) {
                $('#customer_recipt').html(data);
            });
        }

    });
</script>

<div class="row">
    <div class="col-sm-6">
        <div id="customer_recipt"></div>
        Print Receipt
    </div>

    <div class="col-sm-6">
        Return Items
    </div>
</div>