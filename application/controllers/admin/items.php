<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Items extends Admin_Controller
{

    /**
     * constructor method
     */
    public function __construct()
    {

        parent::__construct();
        $this->load->model("admin/item_model");
        $this->lang->load("items", 'english');
        $this->lang->load("system", 'english');
        //$this->output->enable_profiler(TRUE);
    }
    //---------------------------------------------------------------


    /**
     * Default action to be called
     */
    public function index()
    {
        $main_page = base_url() . ADMIN_DIR . $this->router->fetch_class() . "/view";
        redirect($main_page);
    }
    //---------------------------------------------------------------



    /**
     * get a list of all items that are not trashed
     */
    public function view()
    {

        $where = "`items`.`status` IN (0, 1) ";
        $data = $this->item_model->get_item_list($where);
        $this->data["items"] = $data->items;
        $this->data["pagination"] = $data->pagination;
        $this->data["title"] = $this->lang->line('Items');
        $this->data["view"] = ADMIN_DIR . "items/items";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //-----------------------------------------------------

    /**
     * get single record by id
     */
    public function view_item($item_id)
    {

        $item_id = (int) $item_id;

        $this->data["items"] = $this->item_model->get_item($item_id);
        $this->data["title"] = $this->lang->line('Item Details');
        $this->data["view"] = ADMIN_DIR . "items/view_item";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //-----------------------------------------------------

    /**
     * get a list of all trashed items
     */
    public function trashed()
    {

        $where = "`items`.`status` IN (2) ";
        $data = $this->item_model->get_item_list($where);
        $this->data["items"] = $data->items;
        $this->data["pagination"] = $data->pagination;
        $this->data["title"] = $this->lang->line('Trashed Items');
        $this->data["view"] = ADMIN_DIR . "items/trashed_items";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //-----------------------------------------------------

    /**
     * function to send a user to trash
     */
    public function trash($item_id, $page_id = NULL)
    {

        $item_id = (int) $item_id;


        $this->item_model->changeStatus($item_id, "2");
        $this->session->set_flashdata("msg_success", $this->lang->line("trash_msg_success"));
        redirect(ADMIN_DIR . "items/view/" . $page_id);
    }

    /**
     * function to restor item from trash
     * @param $item_id integer
     */
    public function restore($item_id, $page_id = NULL)
    {

        $item_id = (int) $item_id;


        $this->item_model->changeStatus($item_id, "1");
        $this->session->set_flashdata("msg_success", $this->lang->line("restore_msg_success"));
        redirect(ADMIN_DIR . "items/trashed/" . $page_id);
    }
    //---------------------------------------------------------------------------

    /**
     * function to draft item from trash
     * @param $item_id integer
     */
    public function draft($item_id, $page_id = NULL)
    {

        $item_id = (int) $item_id;


        $this->item_model->changeStatus($item_id, "0");
        $this->session->set_flashdata("msg_success", $this->lang->line("draft_msg_success"));
        redirect(ADMIN_DIR . "items/view/" . $page_id);
    }
    //---------------------------------------------------------------------------

    /**
     * function to publish item from trash
     * @param $item_id integer
     */
    public function publish($item_id, $page_id = NULL)
    {

        $item_id = (int) $item_id;


        $this->item_model->changeStatus($item_id, "1");
        $this->session->set_flashdata("msg_success", $this->lang->line("publish_msg_success"));
        redirect(ADMIN_DIR . "items/view/" . $page_id);
    }
    //---------------------------------------------------------------------------

    /**
     * function to permanently delete a Item
     * @param $item_id integer
     */
    public function delete($item_id, $page_id = NULL)
    {

        $item_id = (int) $item_id;
        //$this->item_model->changeStatus($item_id, "3");

        $this->item_model->delete(array('item_id' => $item_id));
        $this->session->set_flashdata("msg_success", $this->lang->line("delete_msg_success"));
        redirect(ADMIN_DIR . "items/trashed/" . $page_id);
    }
    //----------------------------------------------------



    /**
     * function to add new Item
     */
    public function add()
    {

        $this->data["suppliers"] = $this->item_model->getList("suppliers", "supplier_id", "supplier_name", $where = "`suppliers`.`status` IN (1) ");

        $this->data["title"] = $this->lang->line('Add New Item');
        $this->data["view"] = ADMIN_DIR . "items/add_item";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //--------------------------------------------------------------------
    public function save_data()
    {
        if ($this->item_model->validate_form_data(true) === TRUE) {



            $item_id = $this->item_model->save_data();
            if ($item_id) {
                $cost_price = $this->input->post("cost_price");
                $quantity = $this->input->post("quantity");
                $created_by = $this->session->userdata("user_id");

                //update item enventory after first time add 
                $query = "INSERT INTO `inventory`(`item_id`, `item_cost_price`,  `transaction_type`, `inventory_transaction`,`created_by`) 
                            VALUES ('" . $item_id . "','" . $cost_price . "', 'First Time Item Add','" . $quantity . "','" . $created_by . "')";
                $this->db->query($query);
                $this->session->set_flashdata("msg_success", $this->lang->line("add_msg_success"));
                redirect(ADMIN_DIR . "items/edit/$item_id");
            } else {

                $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                redirect(ADMIN_DIR . "items/add");
            }
        } else {
            $this->add();
        }
    }


    /**
     * function to edit a Item
     */
    public function edit($item_id)
    {
        $item_id = (int) $item_id;
        $this->data["item"] = $this->item_model->get($item_id);

        $this->data["suppliers"] = $this->item_model->getList("suppliers", "supplier_id", "supplier_name", $where = "`suppliers`.`status` IN (1) ");

        $this->data["title"] = $this->lang->line('Edit Item');
        $this->data["view"] = ADMIN_DIR . "items/edit_item";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //--------------------------------------------------------------------

    public function update_data($item_id)
    {

        $item_id = (int) $item_id;

        if ($this->item_model->validate_form_data(false) === TRUE) {

            $item_id = $this->item_model->update_data($item_id);
            if ($item_id) {

                $this->session->set_flashdata("msg_success", $this->lang->line("update_msg_success"));
                redirect(ADMIN_DIR . "items/edit/$item_id");
            } else {

                $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                redirect(ADMIN_DIR . "items/edit/$item_id");
            }
        } else {
            $this->edit($item_id);
        }
    }


    /**
     * get data as a json array 
     */
    public function get_json()
    {
        $where = array("status" => 1);
        $where[$this->uri->segment(3)] = $this->uri->segment(4);
        $data["items"] = $this->item_model->getBy($where, false, "item_id");
        $j_array[] = array("id" => "", "value" => "item");
        foreach ($data["items"] as $item) {
            $j_array[] = array("id" => $item->item_id, "value" => "");
        }
        echo json_encode($j_array);
    }
    //-----------------------------------------------------

}
