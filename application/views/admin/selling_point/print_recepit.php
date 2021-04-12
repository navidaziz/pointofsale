<style>
    .table1>thead>tr>th,
    .table1>tbody>tr>th,
    .table1>tfoot>tr>th,
    .table1>thead>tr>td,
    .table1>tbody>tr>td,
    .table1>tfoot>tr>td {
        padding: 3px;
        vertical-align: top;
        border-top: 1px solid #ddd;
        font-size: 12px !important;
        font-family: Calibri, sans-serif !important;
    }
</style>

<div id="receipt_header">

</div>
<div id="receipt_general_info">

</div>
<table class="table table1 table-bordered">
    <tr>
        <th colspan="2" style="font-size: 17px !important; text-align:center"> AL KHIDMAT DIAGNOSTIC CENTER Chitral
        </th>
    </tr>
    <tr>
        <td>
            <div id="sale_id">Sale ID: Rec No 9</div>
            <div id="employee">Employee: John Doe</div>
        </td>
        <td>
            <div id="sale_id">Sale ID: Rec No 9</div>
            <div id="employee">Employee: John Doe</div>
        </td>
    </tr>
</table>
<table class="table table1 table-bordered">
    <thead>
        <tr>
            <th style="width:200px">Item</th>
            <th>Price</th>
            <th>Dis</th>
            <th>Qty.</th>
            <th>Total</th>
        </tr>
    </thead>
    <tbody>

        <?php foreach ($sale_items as $item) { ?>
            <tr>
                <td><?php echo $item->item_name;  ?></td>
                <td><?php echo $item->unit_price;  ?></td>
                <td><?php echo $item->item_discount;  ?></td>
                <td><?php echo $item->quantity;  ?></td>
                <td><?php echo $item->total_price;  ?></td>
            </tr>
        <?php } ?>


        <tr>
            <td colspan="5" align="right">
                <span style="font-size:15px">
                    Total: Rs 2600.00<br />
                    Discount: Rs 0.00<br />
                    Payable: Rs 2600.00<br />
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <p style="font-size: 9px !important;">Return Policy </p>
            </td>
        </tr>

    </tbody>
</table>