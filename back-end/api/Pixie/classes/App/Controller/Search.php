<?php

namespace App\Controller;
 
class Search extends \App\Page {
 
    public function action_findbyname() {
    	if($this->request->param('id'))
    	{
            $name = $this->request->param('id');
    		$result1 = $pixie->orm->get('student')->where('name',$name)->find_all()->as_array(true);
            $result2 = $pixie->orm->get('university')->where('full_name',$name)->find_all()->as_array(true);
            $result3 = $pixie->orm->get('group')->where('name',$name)->find_all()->as_array(true);
            $result = array($result1, $result2, $result3);
            return json_encode($result);

    	}
    	    	
 		die();
    }
 
}
?>