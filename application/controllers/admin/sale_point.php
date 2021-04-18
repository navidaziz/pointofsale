<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Sale_point extends Admin_Controller
{

  /**
   * constructor method
   */
  public function __construct()
  {

    parent::__construct();
    $this->load->model("admin/supplier_model");
    $this->lang->load("suppliers", 'english');
    $this->lang->load("system", 'english');
    //$this->output->enable_profiler(TRUE);
  }
  //---------------------------------------------------------------


  /**
   * Default action to be called
   */
  public function index()
  {
    $query = "SELECT `name`, `item_code_no` FROM all_items WHERE `status` IN (1)";
    $this->data['sale_items'] = $this->db->query($query)->result();
    //var_dump($this->data['sale_items']);
    $this->data["view"] = ADMIN_DIR . "sale_point/home";
    $this->data["user_items_list"] = $this->get_user_items_list();
    $this->data["items_sale_summary"] = $this->items_sale_summary();

    $this->load->view(ADMIN_DIR . "layout", $this->data);
  }

  public function get_search_item()
  {
    $search_item = $this->db->escape($this->input->post("search_item"));
    $query = "SELECT `item_id` FROM all_items 
                  WHERE (`name` = " . $search_item . " OR `item_code_no` = " . $search_item . ")";

    if ($this->db->query($query)->result()) {
      $item_id = $this->db->query($query)->result()[0]->item_id;
      $user_id = $this->session->userdata("user_id");
      $query = "SELECT SUM(`quantity`) as total FROM `sales_item_users` 
                      WHERE `item_id`='" . $item_id . "'
                      AND `user_id` = '" . $user_id . "'";
      $item_count =  $this->db->query($query)->result()[0]->total;
      if ($item_count == 0) {
        $query = "INSERT INTO `sales_item_users`(`item_id`, `quantity`, `user_id`) 
                          VALUES ('" . $item_id . "','1','" . $user_id . "')";
        $this->db->query($query);
      } else {
        $item_count++;
        $query = "UPDATE `sales_item_users` 
                          SET `quantity`='" . $item_count . "' 
                          WHERE `item_id`='" . $item_id . "'
                          AND `user_id` = '" . $user_id . "'";
        $this->db->query($query);
      }
    } else {
    }

    echo $this->get_user_items_list();
  }

  function get_user_items()
  {
    $user_id = $this->session->userdata("user_id");
    $query = "SELECT `id`,
            LOWER(`all_items`.`name`) AS `name`,
            LOWER(`all_items`.`category`) AS `category`,
            `all_items`.`unit_price`,
            `all_items`.`cost_price`,
            `all_items`.`discount`,
            `all_items`.`sale_price`,
            `all_items`.`total_quantity`,
            `sales_item_users`.`quantity`, 
            `sales_item_users`.`item_id`,
            `sales_item_users`.`user_id`,
            (`all_items`.`sale_price`*`sales_item_users`.`quantity`) as `total_price`  
          FROM
            `all_items`,
            `sales_item_users` 
          WHERE `all_items`.`item_id` = `sales_item_users`.`item_id`
          AND  `sales_item_users`.`user_id` = '" . $user_id . "'";
    return $this->db->query($query)->result();
  }
  function get_user_items_list()
  {
    $sales_items_user_lists = $this->get_user_items();
    $user_item_list = '<table class="table table2 table-bordered">';
    $user_item_list .= '<tr>
                <th>#</th>
                <th>in Stock</th>
                <th>Name</th>
                <th>Category</th>
                <th>Unit Price</th>
                <th>Discount</th>
                <th>Sale Price</th>
                <th >Quantity</th>
                <th>Total Price</th>
              </tr>';
    $count = 1;
    foreach ($sales_items_user_lists as $sales_items_user_list) {
      $user_item_list .= '<tr><td>' . $count++ . '</td>';
      if ($sales_items_user_list->total_quantity >= 0) {
        $user_item_list .= '<td>' . $sales_items_user_list->total_quantity . '</td>';
      } else {
        $user_item_list .= '<td style="color:red">' . $sales_items_user_list->total_quantity . ' Out of Stock</td>';
      }

      $user_item_list .= '<td>' . ucwords($sales_items_user_list->name) . '</td>
                    <td>' . ucwords($sales_items_user_list->category) . '</td>
                    <td>' . $sales_items_user_list->unit_price . '</td>
                    <td>' . $sales_items_user_list->discount . '</td>
                    <td>' . $sales_items_user_list->sale_price . '</td>
                    <td><input id="user_item_' . $sales_items_user_list->id . '" onkeydown="update_user_item_quantity(\'' . $sales_items_user_list->id . '\')" type="number" name="quantity" value="' . $sales_items_user_list->quantity . '" style="width:50px" /></td>
                    <td>' . $sales_items_user_list->total_price . '</td>

                  </tr>';
    }
    return $user_item_list .= '</table>';
  }

  public function items_sale_summary()
  {
    $user_id = $this->session->userdata("user_id");
    $query = "SELECT * FROM `user_sale_summary`
                  WHERE `user_sale_summary`.`user_id` = '" . $user_id . "'";

    if ($this->db->query($query)->result()) {
      $sales_items_summary = $this->db->query($query)->result()[0];
    } else {
      $sales_items_summary = (object) array();
      $sales_items_summary->items_total = "0.00";
      $sales_items_summary->total_discount = "0.00";
      $sales_items_summary->total_price = "0.00";
      $sales_items_summary->total_tax_pay_able = "0.00";
      $sales_items_summary->pay_able = "0.00";
    }
    $sale_summary = "";

    $sale_summary .= '
        
        <table class="ta ble" width="100%" style="margin:2px; margin-bottom:10px;">
        <tr>
        <td style="margin:0px !important; padding:1px !important">
        <div style="margin-top:5px">
        <!--<h5>Items Total: Rs ' . $sales_items_summary->items_total . '</h5>
        <h5 >Items Discount: Rs ' . $sales_items_summary->total_discount . '</h5>-->
           <h4 >Total : Rs ' . $sales_items_summary->total_price . '</h4>
           
           
         
        ';

    $query = "SELECT * FROM `taxes` WHERE `status`=1";
    $taxes = $this->db->query($query)->result();
    $tax_ids = '';
    foreach ($taxes as $tax) {
      $sale_summary .= '<small>' . $tax->name . ' - ' . $tax->tax_percentage . '%</small><br />';
      $tax_ids .= $tax->tax_id . ',';
    }

    $sale_summary .= '<h4 >Tax: Rs ' . $sales_items_summary->total_tax_pay_able . '</h4>
    <input type="hidden" value="' . $tax_ids . '" name="tax_ids" id="tax_ids" />
        <style>
        .amount {
            margin-right: 30px;
            color: #d9534f;
            font-weight: 600;
            line-height: 0.6;
        }
        </style>
        </td>
        <td style="wid th:60%; margin:5px !important; padding:1px !important">
        <div class="font-400 font-14">
        <div style="border:1px dashed gray; padding:5px; border-radius:5px;">
            <h3 class="amount" style="color:green" >Total: Rs <span id="pay_able">' . $sales_items_summary->pay_able . '</span></h3>
            <h3 class="amount" style="color:#70AFC4">Discount: Rs <span id="payment_discount"> 0.00</span></h3>
            <h3 class="amount">Payable: Rs <span id="pay_able_total">' . $sales_items_summary->pay_able . '</span></h3>
        </div>    
            </div>
        </td>
        </tr>
        </table>';

    return $sale_summary;
  }

  function user_items_sale_summary()
  {
    echo $this->items_sale_summary();
  }

  public function update_user_item_quantity()
  {
    $id = (int) $this->input->post("user_item_id");
    $quantity = $this->input->post("item_quantity");
    if ($quantity == 0) {
      $query = "DELETE FROM `sales_item_users` 
            WHERE id='" . $id . "'";
      $this->db->query($query);
    } else {
      $query = "UPDATE `sales_item_users` SET `quantity`='" . $quantity . "'
            WHERE id='" . $id . "' ";
      $this->db->query($query);
    }

    echo $this->get_user_items_list();
  }

  public function add_sale_data()
  {





    $payment_type = $this->input->post('payment_type');
    $remarks = $this->input->post('remarks');
    $discount = $this->input->post('discount');
    $cash_amount = $this->input->post('cash_amount');
    $customer_name = $this->input->post('customer_name');
    $customer_mobile_no = $this->input->post('customer_mobile_no');
    $pay_able_total = $this->input->post('pay_able_total');
    $cash_back = $this->input->post('cash_back');
    $tax_ids = $this->input->post('tax_ids');

    $user_id = $this->session->userdata("user_id");
    $query = "SELECT * FROM `user_sale_summary` as `uss`
                  WHERE `uss`.`user_id` = '" . $user_id . "'";

    if ($this->db->query($query)->result()) {
      $sales_items_summary = $this->db->query($query)->result()[0];
      $query = "INSERT INTO `sales`(`customer_mobile_no`, 
                                      `customer_name`, 
                                      `items_price`, 
                                      `items_discounts`, 
                                      `items_total_price`, 
                                      `total_tax_pay_able`, 
                                      `items_total_price_including_tax`, 
                                      `discount`, 
                                      `total_payable`, 
                                      `cash_amount`,
                                      `cash_back`,
                                      `payment_type`, 
                                      `remarks`,
                                      `created_by`) 
                             VALUES ('" . $customer_mobile_no . "',
                                     '" . $customer_name . "',
                                     '" . $sales_items_summary->items_total . "',
                                     '" . $sales_items_summary->total_discount . "',
                                     '" . $sales_items_summary->total_price . "',
                                     '" . $sales_items_summary->tax_total_percentage . "',
                                     '" . $sales_items_summary->pay_able . "',
                                     '" . $discount . "',
                                     '" . $pay_able_total . "',
                                     '" . $cash_amount . "',
                                     '" . $cash_back . "',
                                     '" . $payment_type . "',
                                     '" . $remarks . "',
                                     '" . $user_id . "'
                                            )";
      $this->db->query($query);
      $sale_id = $this->db->insert_id();
      if ($sale_id) {
        $sales_items_user_lists = $this->get_user_items();
        foreach ($sales_items_user_lists as $sales_items_user_list) {
          $query = "INSERT INTO `sales_items`(`sale_id`, 
                                              `item_id`, 
                                              `item_name`, 
                                              `cost_price`, 
                                              `unit_price`, 
                                              `item_discount`, 
                                              `quantity`, 
                                              `sale_price`, 
                                              `total_price`, 
                                              `created_by`
                                              ) 
                                     VALUES ('" . $sale_id . "',
                                             '" . $sales_items_user_list->item_id . "',
                                             '" . $sales_items_user_list->name . "',
                                             '" . $sales_items_user_list->cost_price . "',
                                             '" . $sales_items_user_list->unit_price . "',
                                             '" . $sales_items_user_list->discount . "',
                                             '" . $sales_items_user_list->quantity . "',
                                             '" . $sales_items_user_list->sale_price . "',
                                             '" . $sales_items_user_list->total_price . "',
                                             '" . $user_id . "' 
                                              )";
          $this->db->query($query);
        }

        if ($tax_ids) {
          $query = "SELECT * FROM taxes WHERE `status`=1 AND tax_id IN(" . trim($tax_ids, ',') . ")";
          $taxes = $this->db->query($query)->result();
          foreach ($taxes as $tax) {
            $query = "INSERT INTO `sale_taxes` (`sale_id`, `tax_id`, `tax_name`, `tax_percentage`)
                              VALUES ('" . $sale_id . "', 
                                      '" . $tax->tax_id . "',
                                      '" . $tax->name . "',
                                      '" . $tax->tax_percentage . "' )";
            $this->db->query($query);
          }
        }
      }
    }
    $query = "DELETE FROM `sales_item_users` WHERE `user_id` = '" . $user_id . "'";
    $this->db->query($query);
    $this->print_receipt($sale_id);
  }

  function print_receipt($sale_id)
  {

    $sale_id = (int) $sale_id;

    $query = "SELECT `sales`.*, `users`.`user_title` FROM `sales`,`users`  
              WHERE `sales`.`created_by` = `users`.`user_id`
              AND `sale_id` = '" . $sale_id . "'";
    $this->data['sale'] = $this->db->query($query)->result();
    if (!$this->data['sale']) {
      echo "Receipt ID Not Found.";
      exit();
    } else {
      $this->data['sale'] = $this->db->query($query)->result()[0];
    }
    $query = "SELECT * FROM `sales_items` 
              WHERE `sale_id` = '" . $sale_id . "'";
    $this->data['sale_items'] = $this->db->query($query)->result();
    $query = "SELECT * FROM `sale_taxes` 
              WHERE `sale_id` = '" . $sale_id . "'";
    $this->data['sale_taxes'] = $this->db->query($query)->result();
    $this->load->view(ADMIN_DIR . "sale_point/print_recepit", $this->data);
  }

  public function get_return_item_page()
  {
    $this->data['tital'] = 'Return Item Form';
    $this->load->view(ADMIN_DIR . "sale_point/return_item_form", $this->data);
  }

  public function search_by_receiot_no()
  {
    $receipt_no = (int) $this->input->post('receipt_no');
    $this->print_receipt($receipt_no);
  }
}
