<?php

namespace App\Controller;
 
class Groups extends \App\Page {
 
    public function action_get() {
 		
    	$id = $this->request->param('id');
    	$result = $pixie->orm->get('group')->where('id',$id)->find();
    	return json_encode($result);
		die();
		
    }

     public function action_getList() {

    	$result = $pixie->orm->get('group')->find_all()->as_array(true);
    	return json_encode($result);
 		die();
    }
 
}
?>