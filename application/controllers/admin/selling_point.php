<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Selling_point extends Admin_Controller
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
    $this->data["view"] = ADMIN_DIR . "selling_point/home";
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

  function get_user_items_list()
  {
    $user_id = $this->session->userdata("user_id");
    $query = "SELECT `id`,
            LOWER(`all_items`.`name`) AS `name`,
            LOWER(`all_items`.`category`) AS `category`,
            `all_items`.`unit_price`,
            `all_items`.`discount`,
            `all_items`.`sale_price`,
            `sales_item_users`.`quantity`, 
            `sales_item_users`.`item_id`,
            `sales_item_users`.`user_id`,
            (`all_items`.`sale_price`*`sales_item_users`.`quantity`) as `total_price`  
          FROM
            `all_items`,
            `sales_item_users` 
          WHERE `all_items`.`item_id` = `sales_item_users`.`item_id`
          AND  `sales_item_users`.`user_id` = '" . $user_id . "'";
    $sales_items_user_lists = $this->db->query($query)->result();
    $user_item_list = '<table class="table table-bordered">';
    $user_item_list .= '<tr>
                <th>#</th>
                <th>Item Name</th>
                <th>Item Category</th>
                <th>Unit Price</th>
                <th>Discount</th>
                <th>Sale Price</th>
                <th >Quantity</th>
                <th>Total Price</th>
              </tr>';
    $count = 1;
    foreach ($sales_items_user_lists as $sales_items_user_list) {
      $user_item_list .= '<tr>
                    <td>' . $count++ . '</td>
                    <td>' . ucwords($sales_items_user_list->name) . '</td>
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
        
        <table class="table">
        <tr>
        <td style="margin:0px !important; padding:1px !important"><div class="well">
        <h5>Items Total: Rs ' . $sales_items_summary->items_total . '</h5>
        <h5 >Items Discount: Rs ' . $sales_items_summary->total_discount . '</h5>
           <h4 >Total Price: Rs ' . $sales_items_summary->total_price . '</h4>
           </div>
           </td>
        <td style="width:60%; margin:0px !important; padding:1px !important">
        <div class="font-400 font-14">
        <div style="border:1px dashed gray; padding:5px; border-radius:5px;"> 
        ';

    $query = "SELECT * FROM `taxes` WHERE `status`=1";
    $taxes = $this->db->query($query)->result();
    foreach ($taxes as $taxe) {
      $sale_summary .= '<h5 >' . $taxe->name . ' - ' . $taxe->tax_percentage . '%</h5>';
    }

    $sale_summary .= '<h4 >Tax: Rs ' . $sales_items_summary->total_tax_pay_able . '</h4>
        <style>
        .amount {
            margin-right: 30px;
            color: #d9534f;
            font-weight: 600;
            line-height: 0.6;
        }
        </style>
        
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

    echo '
    <div id="receipt_header">
      <h5>AL KHIDMAT DIAGNOSTIC CENTER</h5>
    </div>
    <div id="receipt_general_info">
          <div id="sale_id">Sale ID: Rec No 9</div>
      <div id="employee">Employee: John Doe</div>
    </div>
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
  
    <table class="table table1 table-bordered">
    <tbody>
    
    <tr>
    
    <th style="width:200px" >Item</th>
    <th >Price</th>
    <th >Qty.</th>
    <th >Dis</th>
    <th >Total</th>
    </tr>
        <tr>
     
      <td >itemName</td>
      <td>150</td>
      <td>1</td>
      <td>0</td>
      <td>150</td>
      </tr>
  
      <td >itemName</td>
      <td>150</td>
      <td>1</td>
      <td>0</td>
      <td>150</td>
      </tr>
      <td >itemName</td>
      <td>150</td>
      <td>1</td>
      <td>0</td>
      <td>150</td>
      </tr>
       
      <tr>
    <td colspan="5"  align="right">
    <span style="font-size:15px">
    Total: Rs 2600.00<br />
    Discount: Rs 0.00<br />
    Payable: Rs 2600.00<br />
    </span>
    </td>
    </tr>
  
    </tbody></table>
  
    <div id="sale_return_policy">Return Policy	</div>
    ';
  }
}
