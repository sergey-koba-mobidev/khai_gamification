<?php

namespace App\Controller;
 
class Students extends \App\Page {
 
    public function action_get() {

    	$id = $this->request->param('id');
 		$result = $pixie->orm->get('student')->where('id',$id)->find();
 		return json_encode($result);
 		die();
    }

    public function action_getList() {
    	if($this->request->param('id'))
    	{
            $id = $this->request->param('id');
    		$result = $pixie->orm->get('student')->where('group_id',$id)->find_all()->as_array(true);
    	}
    	else
    	{
    		$result = $pixie->orm->get('student')->find_all()->as_array(true);
    	}
    	return json_encode($result);
 		die();
    }
 
}
?>