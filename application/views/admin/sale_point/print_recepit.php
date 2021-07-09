<!doctype html>
<html>

<head>
    <title>Receipt</title>
    <link rel="stylesheet" type="text/css" href="<?php echo site_url("assets/" . ADMIN_DIR); ?>/css/cloud-admin.css" media="screen,print" />
    <link rel="stylesheet" type="text/css" href="<?php echo site_url("assets/" . ADMIN_DIR); ?>/css/themes/default.css" media="screen,print" id="skin-switcher" />

    <link rel="stylesheet" type="text/css" href="<?php echo site_url("assets/" . ADMIN_DIR); ?>/css/custom.css" media="screen,print" />


    <style>
        body {
            background: rgb(204, 204, 204);
        }

        page {
            background: white;
            display: block;
            margin: 0 auto;
            margin-bottom: 0.5cm;
            box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
        }

        page[size="A4"] {
            width: 8cm;
            height: auto;
            font-weight: bold !important;
            font-family: "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
            font-size: 12px !important;
        }


        @media print {

            body,
            page {
                margin: 0 auto;
                box-shadow: 0;
                color: black;
            }

            .table-bordered {
                border: 1px solid black !important;
            }

            .table>thead>tr>th,
            .table>tbody>tr>th,
            .table>tfoot>tr>th,
            .table>thead>tr>td,
            .table>tbody>tr>td,
            .table>tfoot>tr>td {
                padding: 3px;
                line-height: 1.628571;
                vertical-align: top;
                border-top: 1px solid #ddd;
                color: black !important;
                border: 1px solid black;
            }

        }


        .table>thead>tr>th,
        .table>tbody>tr>th,
        .table>tfoot>tr>th,
        .table>thead>tr>td,
        .table>tbody>tr>td,
        .table>tfoot>tr>td {
            padding: 3px;
            line-height: 1.628571;
            vertical-align: top;
            border-top: 1px solid #ddd;
            color: black !important;
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <page size='A4' style="padding: 5px !important;">




        <table class="table table-bordered" style="width: 100% !important;">
            <thead>
                <tr>
                    <th colspan="5">
                        <h4 style="text-align: center;">Al-Khidmat Diagnostic Center</h4>
                        <h6 style="text-align: center; font-size: 11px;">Chinar Inn Market Shahi Bazar Near Ataliq Bridge, Chitral
                            <br /> PHONE 0943-412814
                        </h6>
                        <div id="sale_id">Receipt No: <strong><?php echo $sale->sale_id; ?></strong></div>
                        <div id="employee">Customer: <?php echo $sale->customer_name; ?> <?php echo "- " . $sale->customer_mobile_no; ?></strong> </div>


                    </th>
                </tr>
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
                            <?php if ($sale_taxes) { ?>
                                Total: Rs <?php echo $sale->items_total_price; ?><br />
                                <?php foreach ($sale_taxes as  $sale_taxe) {
                                    echo $sale_taxe->tax_name . " - " . $sale_taxe->tax_percentage . " % <br />";
                                } ?>

                                Taxes <?php echo $sale->items_total_price_including_tax - $sale->items_total_price; ?> %<br />
                            <?php } ?>
                            Total <?php echo $sale->items_total_price_including_tax; ?><br />
                            Discount: Rs <?php echo $sale->discount; ?><br />
                            Paid: Rs <?php echo $sale->total_payable; ?><br />
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="center">
                        <p style="font-size: 9px !important;">Return Policy </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <small>
                            <p style="text-align: center;"> Date: <?php echo date('d M, y - h:i A', strtotime($sale->created_date)); ?> -----
                                Employee: <?php echo $sale->user_title; ?>
                            </p>
                        </small>
                    </td>
                </tr>

            </tbody>
        </table>


    </page>
</body>



</html>