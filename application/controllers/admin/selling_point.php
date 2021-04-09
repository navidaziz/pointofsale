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
        $query = "SELECT 
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
                    <td><input type="number" name="quantity" value="' . $sales_items_user_list->quantity . '" style="width:50px" /></td>
                    <td>' . $sales_items_user_list->total_price . '</td>

                  </tr>';
        }
        return $user_item_list .= '</table>';
    }
}
