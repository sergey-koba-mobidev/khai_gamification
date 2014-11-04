<?php

namespace App\Controller;
 
class Fairies extends \App\Page {
 
    public function get_group_info($id) {
 
        return $gamif->db->query('select')->table('groups')->where('id',$id)->execute();
		
    }
 
}
?>