<?php
	'group_info' => array('/groups/info/(/<id>))', 
		array(
                'controller' => 'groups',
                'action' => 'get_group_info'
            ), 'GET' 
        ),
	'students_info' => array('/groups/<id>/students', array(
                'controller' => 'students',
                'action' => 'get_students'
            ), 'GET' 
        ),
);
?>