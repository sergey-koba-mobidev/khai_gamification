<?php

namespace App\Controller;
 
class Fairies extends \App\Page {
 
    public function get_students() {
    	
    	$id = $this->request->param('id');
 
        return $gamif->db->query('select')->table('students')->where('group_id',$id)->execute();
		
    }
 
}
?>