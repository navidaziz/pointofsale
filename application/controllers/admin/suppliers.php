<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Suppliers extends Admin_Controller
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
        $main_page = base_url() . ADMIN_DIR . $this->router->fetch_class() . "/view";
        redirect($main_page);
    }
    //---------------------------------------------------------------



    function add_item_stocks()
    {
        $item_id = (int) $this->input->post("item_id");

        $supplier_invoice_id = $this->input->post("supplier_invoice_id");
        $batch_number = $this->input->post("batch_number");
        $cost_price = $this->input->post("cost_price");
        $unit_price = $this->input->post("unit_price");
        $supplier_id = $this->input->post("supplier_id");
        $transaction = $this->input->post("transaction");
        $date = $this->input->post("date");
        $created_by = $this->session->userdata("user_id");

        //update item enventory after first time add 
        $query = "INSERT INTO `inventory`(`item_id`, 
                                          `supplier_id`,
                                          `supplier_invoice_id`, 
                                          `batch_number`, 
                                          `item_cost_price`, 
                                          `item_unit_price`, 
                                          `transaction_type`, 
                                          `inventory_transaction`,
                                          `expiry_date`,`created_by`) 
                            VALUES ('" . $item_id . "', 
                                    '" . $supplier_id . "', 
                                    '" . $supplier_invoice_id . "', 
                                    '" . $batch_number . "', 
                                    '" . $cost_price . "', 
                                    '" . $unit_price . "', 
                                    'Stock In',
                                    '" . $transaction . "',
                                    '" . $date . "',
                                    '" . $created_by . "')";
        $this->db->query($query);
        $this->session->set_flashdata("msg_success", $this->lang->line("add_msg_success"));
        redirect(ADMIN_DIR . "suppliers/supplier_invoice_view/" . $supplier_id . "/" . $supplier_invoice_id);
    }

    function return_item_stocks()
    {

        $item_id = (int) $this->input->post("item_id");

        $supplier_invoice_id = $this->input->post("supplier_invoice_id");
        $batch_number = $this->input->post("batch_number");
        $cost_price = $this->input->post("cost_price");
        $unit_price = $this->input->post("unit_price");
        $supplier_id = $this->input->post("supplier_id");
        $transaction = $this->input->post("transaction");
        $date = $this->input->post("date");
        $created_by = $this->session->userdata("user_id");
        $remarks = $this->input->post("remarks");

        //update item enventory after first time add 
        $query = "INSERT INTO `inventory`(`item_id`, 
                                          `supplier_id`,
                                          `supplier_invoice_id`, 
                                          `batch_number`, 
                                          `item_cost_price`, 
                                          `item_unit_price`, 
                                          `transaction_type`, 
                                          `inventory_transaction`,
                                          `return_date`,`created_by`) 
                            VALUES ('" . $item_id . "', 
                                    '" . $supplier_id . "', 
                                    '" . $supplier_invoice_id . "', 
                                    '" . $batch_number . "', 
                                    '" . $cost_price . "', 
                                    '" . $unit_price . "', 
                                    'Stock Return',
                                    '-" . $transaction . "',
                                    '" . $date . "',
                                    '" . $created_by . "')";
        $this->db->query($query);
        $this->session->set_flashdata("msg_success", $this->lang->line("add_msg_success"));
        redirect(ADMIN_DIR . "suppliers/supplier_invoice_view/" . $supplier_id . "/" . $supplier_invoice_id);
    }


    public function supplier_invoice_view($supplier_id, $supplier_invoice_id)
    {
        $supplier_id = (int) $supplier_id;
        $supplier_invoice_id = (int) $supplier_invoice_id;
        $query = "SELECT * FROM `suppliers_invoices` 
                  WHERE `supplier_invoice_id` = '" . $supplier_invoice_id . "'";
        $this->data["suppliers_invoices"] = $this->db->query($query)->result()[0];

        $this->data["items"] = $this->supplier_model->getList("items", "item_id", "name", "`items`.`status` IN (1)");

        $this->data["suppliers"] = $this->supplier_model->get_supplier($supplier_id);
        $this->data["title"] = $this->data["suppliers"][0]->supplier_name;
        $this->data["detail"] = "Mobile No: " . $this->data["suppliers"][0]->supplier_contact_no . " - Account No:" . $this->data["suppliers"][0]->account_number;
        $query = "SELECT inventory.*, items.name, users.user_title FROM inventory, items, users 
                  WHERE inventory.item_id = items.item_id
                  AND inventory.created_by = users.user_id
                  AND `supplier_invoice_id` = '" . $supplier_invoice_id . "'";
        $this->data['inventories'] = $this->db->query($query)->result();
        $this->data["view"] = ADMIN_DIR . "suppliers/supplier_invoice_view";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }



    public function add_supplier_invoce()
    {
        $validation_config = array(

            array(
                "field"  =>  "supplier_invoice_number",
                "label"  =>  "Supplier Invoice Number",
                "rules"  =>  "required"
            ),
            array(
                "field"  =>  "invoice_date",
                "label"  =>  "Invoice Date",
                "rules"  =>  "required"
            ),
            array(
                "field"  =>  "supplier_id",
                "label"  =>  "Supplier Id",
                "rules"  =>  "required"
            ),


        );
        //set and run the validation
        $this->form_validation->set_rules($validation_config);
        if ($this->form_validation->run() === TRUE) {

            $supplier_invoice_number = $this->db->escape($this->input->post("supplier_invoice_number"));
            $supplier_id = (int) $this->input->post("supplier_id");
            $invoice_date = $this->db->escape($this->input->post("invoice_date"));
            $user_id = $this->session->userdata("user_id");

            $query = "SELECT COUNT(*) as total FROM
                    `suppliers_invoices` 
                    WHERE `supplier_invoice_number` = " . $supplier_invoice_number . "
                    AND `supplier_id` = '" . $supplier_id . "'";

            $supplier_invoice_number_count = $this->db->query($query)->result()[0]->total;
            if ($supplier_invoice_number_count == 0) {
                $query = "INSERT INTO `suppliers_invoices` 
            (`supplier_invoice_number`, `supplier_id`, `invoice_date`, `created_by`) 
            VALUES (" . $supplier_invoice_number . ", '" . $supplier_id . "', 
                    " . $invoice_date . ", '" . $user_id . "')";
                if ($this->db->query($query)) {
                    $this->session->set_flashdata("msg_success", "Supplier Invoice Add Successfully");
                    redirect(ADMIN_DIR . "suppliers/view_supplier/" . $supplier_id);
                } else {

                    $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                    redirect(ADMIN_DIR . "suppliers/view_supplier/" . $supplier_id);
                }
            } else {
                $this->session->set_flashdata("msg_error", "Record Not Added Due to Duplicate Supplier ID Number.");
                redirect(ADMIN_DIR . "suppliers/view_supplier/" . $supplier_id);
            }
        } else {

            $this->view_supplier($this->input->post("supplier_id"));
        }
    }

    /**
     * get a list of all items that are not trashed
     */
    public function view()
    {

        $where = "`suppliers`.`status` IN (0, 1) ";
        $data = $this->supplier_model->get_supplier_list($where);
        $this->data["suppliers"] = $data->suppliers;
        $this->data["pagination"] = $data->pagination;
        $this->data["title"] = $this->lang->line('Suppliers');
        $this->data["view"] = ADMIN_DIR . "suppliers/suppliers";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //-----------------------------------------------------

    /**
     * get single record by id
     */
    public function view_supplier($supplier_id)
    {

        $supplier_id = (int) $supplier_id;
        $query = "SELECT * FROM `suppliers_invoices` WHERE `supplier_id` = '" . $supplier_id . "' ORDER BY supplier_invoice_id DESC";

        $this->data["suppliers_invoices"] = $this->db->query($query)->result();
        $this->data["suppliers"] = $this->supplier_model->get_supplier($supplier_id);
        $this->data["title"] = $this->data["suppliers"][0]->supplier_name;
        $this->data["detail"] = "Mobile No: " . $this->data["suppliers"][0]->supplier_contact_no . " - Account No:" . $this->data["suppliers"][0]->account_number;
        $this->data["view"] = ADMIN_DIR . "suppliers/view_supplier";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //-----------------------------------------------------

    /**
     * get a list of all trashed items
     */
    public function trashed()
    {

        $where = "`suppliers`.`status` IN (2) ";
        $data = $this->supplier_model->get_supplier_list($where);
        $this->data["suppliers"] = $data->suppliers;
        $this->data["pagination"] = $data->pagination;
        $this->data["title"] = $this->lang->line('Trashed Suppliers');
        $this->data["view"] = ADMIN_DIR . "suppliers/trashed_suppliers";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //-----------------------------------------------------

    /**
     * function to send a user to trash
     */
    public function trash($supplier_id, $page_id = NULL)
    {

        $supplier_id = (int) $supplier_id;


        $this->supplier_model->changeStatus($supplier_id, "2");
        $this->session->set_flashdata("msg_success", $this->lang->line("trash_msg_success"));
        redirect(ADMIN_DIR . "suppliers/view/" . $page_id);
    }

    /**
     * function to restor supplier from trash
     * @param $supplier_id integer
     */
    public function restore($supplier_id, $page_id = NULL)
    {

        $supplier_id = (int) $supplier_id;


        $this->supplier_model->changeStatus($supplier_id, "1");
        $this->session->set_flashdata("msg_success", $this->lang->line("restore_msg_success"));
        redirect(ADMIN_DIR . "suppliers/trashed/" . $page_id);
    }
    //---------------------------------------------------------------------------

    /**
     * function to draft supplier from trash
     * @param $supplier_id integer
     */
    public function draft($supplier_id, $page_id = NULL)
    {

        $supplier_id = (int) $supplier_id;


        $this->supplier_model->changeStatus($supplier_id, "0");
        $this->session->set_flashdata("msg_success", $this->lang->line("draft_msg_success"));
        redirect(ADMIN_DIR . "suppliers/view/" . $page_id);
    }
    //---------------------------------------------------------------------------

    /**
     * function to publish supplier from trash
     * @param $supplier_id integer
     */
    public function publish($supplier_id, $page_id = NULL)
    {

        $supplier_id = (int) $supplier_id;


        $this->supplier_model->changeStatus($supplier_id, "1");
        $this->session->set_flashdata("msg_success", $this->lang->line("publish_msg_success"));
        redirect(ADMIN_DIR . "suppliers/view/" . $page_id);
    }
    //---------------------------------------------------------------------------

    /**
     * function to permanently delete a Supplier
     * @param $supplier_id integer
     */
    public function delete($supplier_id, $page_id = NULL)
    {

        $supplier_id = (int) $supplier_id;
        //$this->supplier_model->changeStatus($supplier_id, "3");

        $this->supplier_model->delete(array('supplier_id' => $supplier_id));
        $this->session->set_flashdata("msg_success", $this->lang->line("delete_msg_success"));
        redirect(ADMIN_DIR . "suppliers/trashed/" . $page_id);
    }
    //----------------------------------------------------



    /**
     * function to add new Supplier
     */
    public function add()
    {

        $this->data["title"] = $this->lang->line('Add New Supplier');
        $this->data["view"] = ADMIN_DIR . "suppliers/add_supplier";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //--------------------------------------------------------------------
    public function save_data()
    {
        if ($this->supplier_model->validate_form_data() === TRUE) {

            $supplier_id = $this->supplier_model->save_data();
            if ($supplier_id) {
                $this->session->set_flashdata("msg_success", $this->lang->line("add_msg_success"));
                redirect(ADMIN_DIR . "suppliers/edit/$supplier_id");
            } else {

                $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                redirect(ADMIN_DIR . "suppliers/add");
            }
        } else {
            $this->add();
        }
    }


    /**
     * function to edit a Supplier
     */
    public function edit($supplier_id)
    {
        $supplier_id = (int) $supplier_id;
        $this->data["supplier"] = $this->supplier_model->get($supplier_id);

        $this->data["title"] = $this->lang->line('Edit Supplier');
        $this->data["view"] = ADMIN_DIR . "suppliers/edit_supplier";
        $this->load->view(ADMIN_DIR . "layout", $this->data);
    }
    //--------------------------------------------------------------------

    public function update_data($supplier_id)
    {

        $supplier_id = (int) $supplier_id;

        if ($this->supplier_model->validate_form_data() === TRUE) {

            $supplier_id = $this->supplier_model->update_data($supplier_id);
            if ($supplier_id) {

                $this->session->set_flashdata("msg_success", $this->lang->line("update_msg_success"));
                redirect(ADMIN_DIR . "suppliers/edit/$supplier_id");
            } else {

                $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                redirect(ADMIN_DIR . "suppliers/edit/$supplier_id");
            }
        } else {
            $this->edit($supplier_id);
        }
    }


    /**
     * get data as a json array 
     */
    public function get_json()
    {
        $where = array("status" => 1);
        $where[$this->uri->segment(3)] = $this->uri->segment(4);
        $data["suppliers"] = $this->supplier_model->getBy($where, false, "supplier_id");
        $j_array[] = array("id" => "", "value" => "supplier");
        foreach ($data["suppliers"] as $supplier) {
            $j_array[] = array("id" => $supplier->supplier_id, "value" => "");
        }
        echo json_encode($j_array);
    }
    //-----------------------------------------------------

}
