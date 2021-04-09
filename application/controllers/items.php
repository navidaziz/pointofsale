<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
        
class Items extends Public_Controller{
    
    /**
     * constructor method
     */
    public function __construct(){
        
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
    public function index(){
        $this->view();
    }
    //---------------------------------------------------------------


	
    /**
     * get a list of all items that are not trashed
     */
    public function view(){
		
        $where = "`status` IN (1) ";
		$data = $this->item_model->get_item_list($where,TRUE, TRUE);
		 $this->data["items"] = $data->items;
		 $this->data["pagination"] = $data->pagination;
		 $this->data["title"] = "Items";
         $this->data["view"] = PUBLIC_DIR."items/items";
        $this->load->view(PUBLIC_DIR."layout", $this->data);
    }
    //-----------------------------------------------------
    
    /**
     * get single record by id
     */
    public function view_item($item_id){
        
        $item_id = (int) $item_id;
        
        $this->data["items"] = $this->item_model->get_item($item_id);
        $this->data["title"] = "Items Details";
        $this->data["view"] = PUBLIC_DIR."items/view_item";
        $this->load->view(PUBLIC_DIR."layout", $this->data);
    }
    //-----------------------------------------------------
    
}        
