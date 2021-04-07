<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
        
class Suppliers extends Admin_Controller{
    
    /**
     * constructor method
     */
    public function __construct(){
        
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
    public function index(){
        $main_page=base_url().ADMIN_DIR.$this->router->fetch_class()."/view";
  		redirect($main_page); 
    }
    //---------------------------------------------------------------


	
    /**
     * get a list of all items that are not trashed
     */
    public function view(){
		
        $where = "`suppliers`.`status` IN (0, 1) ";
		$data = $this->supplier_model->get_supplier_list($where);
		 $this->data["suppliers"] = $data->suppliers;
		 $this->data["pagination"] = $data->pagination;
		 $this->data["title"] = $this->lang->line('Suppliers');
		$this->data["view"] = ADMIN_DIR."suppliers/suppliers";
		$this->load->view(ADMIN_DIR."layout", $this->data);
    }
    //-----------------------------------------------------
    
    /**
     * get single record by id
     */
    public function view_supplier($supplier_id){
        
        $supplier_id = (int) $supplier_id;
        
        $this->data["suppliers"] = $this->supplier_model->get_supplier($supplier_id);
        $this->data["title"] = $this->lang->line('Supplier Details');
		$this->data["view"] = ADMIN_DIR."suppliers/view_supplier";
        $this->load->view(ADMIN_DIR."layout", $this->data);
    }
    //-----------------------------------------------------
    
    /**
     * get a list of all trashed items
     */
    public function trashed(){
	
        $where = "`suppliers`.`status` IN (2) ";
		$data = $this->supplier_model->get_supplier_list($where);
		 $this->data["suppliers"] = $data->suppliers;
		 $this->data["pagination"] = $data->pagination;
		 $this->data["title"] = $this->lang->line('Trashed Suppliers');
		$this->data["view"] = ADMIN_DIR."suppliers/trashed_suppliers";
        $this->load->view(ADMIN_DIR."layout", $this->data);
    }
    //-----------------------------------------------------
    
    /**
     * function to send a user to trash
     */
    public function trash($supplier_id, $page_id = NULL){
        
        $supplier_id = (int) $supplier_id;
        
        
        $this->supplier_model->changeStatus($supplier_id, "2");
        $this->session->set_flashdata("msg_success", $this->lang->line("trash_msg_success"));
        redirect(ADMIN_DIR."suppliers/view/".$page_id);
    }
    
    /**
      * function to restor supplier from trash
      * @param $supplier_id integer
      */
     public function restore($supplier_id, $page_id = NULL){
        
        $supplier_id = (int) $supplier_id;
        
        
        $this->supplier_model->changeStatus($supplier_id, "1");
        $this->session->set_flashdata("msg_success", $this->lang->line("restore_msg_success"));
        redirect(ADMIN_DIR."suppliers/trashed/".$page_id);
     }
     //---------------------------------------------------------------------------
    
    /**
      * function to draft supplier from trash
      * @param $supplier_id integer
      */
     public function draft($supplier_id, $page_id = NULL){
        
        $supplier_id = (int) $supplier_id;
        
        
        $this->supplier_model->changeStatus($supplier_id, "0");
        $this->session->set_flashdata("msg_success", $this->lang->line("draft_msg_success"));
        redirect(ADMIN_DIR."suppliers/view/".$page_id);
     }
     //---------------------------------------------------------------------------
    
    /**
      * function to publish supplier from trash
      * @param $supplier_id integer
      */
     public function publish($supplier_id, $page_id = NULL){
        
        $supplier_id = (int) $supplier_id;
        
        
        $this->supplier_model->changeStatus($supplier_id, "1");
        $this->session->set_flashdata("msg_success", $this->lang->line("publish_msg_success"));
        redirect(ADMIN_DIR."suppliers/view/".$page_id);
     }
     //---------------------------------------------------------------------------
    
    /**
      * function to permanently delete a Supplier
      * @param $supplier_id integer
      */
     public function delete($supplier_id, $page_id = NULL){
        
        $supplier_id = (int) $supplier_id;
        //$this->supplier_model->changeStatus($supplier_id, "3");
        
		$this->supplier_model->delete(array( 'supplier_id' => $supplier_id));
        $this->session->set_flashdata("msg_success", $this->lang->line("delete_msg_success"));
        redirect(ADMIN_DIR."suppliers/trashed/".$page_id);
     }
     //----------------------------------------------------
    
	 
	 
     /**
      * function to add new Supplier
      */
     public function add(){
		
        $this->data["title"] = $this->lang->line('Add New Supplier');$this->data["view"] = ADMIN_DIR."suppliers/add_supplier";
        $this->load->view(ADMIN_DIR."layout", $this->data);
     }
     //--------------------------------------------------------------------
     public function save_data(){
	  if($this->supplier_model->validate_form_data() === TRUE){
		  
		  $supplier_id = $this->supplier_model->save_data();
          if($supplier_id){
				$this->session->set_flashdata("msg_success", $this->lang->line("add_msg_success"));
                redirect(ADMIN_DIR."suppliers/edit/$supplier_id");
            }else{
                
                $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                redirect(ADMIN_DIR."suppliers/add");
            }
        }else{
			$this->add();
			}
	 }


     /**
      * function to edit a Supplier
      */
     public function edit($supplier_id){
		 $supplier_id = (int) $supplier_id;
        $this->data["supplier"] = $this->supplier_model->get($supplier_id);
		  
        $this->data["title"] = $this->lang->line('Edit Supplier');$this->data["view"] = ADMIN_DIR."suppliers/edit_supplier";
        $this->load->view(ADMIN_DIR."layout", $this->data);
     }
     //--------------------------------------------------------------------
	 
	 public function update_data($supplier_id){
		 
		 $supplier_id = (int) $supplier_id;
       
	   if($this->supplier_model->validate_form_data() === TRUE){
		  
		  $supplier_id = $this->supplier_model->update_data($supplier_id);
          if($supplier_id){
                
                $this->session->set_flashdata("msg_success", $this->lang->line("update_msg_success"));
                redirect(ADMIN_DIR."suppliers/edit/$supplier_id");
            }else{
                
                $this->session->set_flashdata("msg_error", $this->lang->line("msg_error"));
                redirect(ADMIN_DIR."suppliers/edit/$supplier_id");
            }
        }else{
			$this->edit($supplier_id);
			}
		 
		 }
	 
     
    /**
     * get data as a json array 
     */
    public function get_json(){
				$where = array("status" =>1);
				$where[$this->uri->segment(3)]= $this->uri->segment(4);
				$data["suppliers"] = $this->supplier_model->getBy($where, false, "supplier_id" );
				$j_array[]=array("id" => "", "value" => "supplier");
				foreach($data["suppliers"] as $supplier ){
					$j_array[]=array("id" => $supplier->supplier_id, "value" => "");
					}
					echo json_encode($j_array);
			
       
    }
    //-----------------------------------------------------
    
}        
