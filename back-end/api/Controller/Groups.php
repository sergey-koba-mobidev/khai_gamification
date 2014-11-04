<?php

namespace App\Controller;
 
class Fairies extends \App\Page {
 
    public function action_get_group_info() {
 		
    	$id = $this->request->param('id');
        return $gamif->db->query('select')->table('groups')->where('id',$id)->execute();
		
    }
 
}
?>