<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
        
class Items extends Admin_Controller_Mobile{
    
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
    


	
    /**
     * get a list of all items that are not trashed
     */
    public function view(){
		
        $where = "`items`.`status` IN (0, 1) ";
		$data = $this->item_model->get_item_list($where, false);
		 echo json_encode($data);
    }
    //-----------------------------------------------------
    
    /**
     * get single record by id
     */
    public function view_item($item_id){
        
        $item_id = (int) $item_id;
		$data = $this->item_model->get_item($item_id);
        echo json_encode($data);
    }
    //-----------------------------------------------------
    
    /**
     * get a list of all trashed items
     */
    public function trashed(){
	
        $where = "`items`.`status` IN (2) ";
		$data = $this->item_model->get_item_list($where, true);
		 echo json_encode($data);
    }
    //-----------------------------------------------------
    
    /**
     * function to send a user to trash
     */
    public function trash($item_id){
        
        $item_id = (int) $item_id;
		$this->item_model->changeStatus($item_id, "2");
        $data["msg_success"] = $this->lang->line("trash_msg_success");
        echo json_encode($data);
    }
    
    /**
      * function to restor item from trash
      * @param $item_id integer
      */
     public function restore($item_id){
        
        $item_id = (int) $item_id;
		$this->item_model->changeStatus($item_id, "1");
		$data["msg_success"] = $this->lang->line("restore_msg_success");
        echo json_encode($data);
        
     }
     //---------------------------------------------------------------------------
    
    /**
      * function to draft item from trash
      * @param $item_id integer
      */
     public function draft($item_id){
        
        $item_id = (int) $item_id;
		$this->item_model->changeStatus($item_id, "0");
		$data["msg_success"] = $this->lang->line("draft_msg_success");
        echo json_encode($data);
       
     }
     //---------------------------------------------------------------------------
    
    /**
      * function to publish item from trash
      * @param $item_id integer
      */
     public function publish($item_id){
        
        $item_id = (int) $item_id;
		$this->item_model->changeStatus($item_id, "1");
		$data["msg_success"] = $this->lang->line("publish_msg_success");
        echo json_encode($data);
        
     }
     //---------------------------------------------------------------------------
    
    /**
      * function to permanently delete a Item
      * @param $item_id integer
      */
     public function delete($item_id, $page_id = NULL){
        
        $item_id = (int) $item_id;
        //$this->item_model->changeStatus($item_id, "3");
        $this->item_model->delete(array( 'item_id' => $item_id));
		$data["msg_success"] = $this->lang->line("delete_msg_success");
        echo json_encode($data);
     }
     //----------------------------------------------------
    public function save_data(){
	
	$item_id = $this->item_model->save_data();
	$data["msg_success"] = $this->lang->line("add_msg_success");
    echo json_encode($data);
	
	 }


    
	 public function update_data($item_id){
		$item_id = $this->item_model->update_data($item_id);
		$data["msg_success"] = $this->lang->line("update_msg_success");
    	echo json_encode($data);
		
		 
		 }
	 
     
}        
