<?php 
namespace App\Model;
 

class group extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='groups';

   
     protected $has_many=array(
 
       
        'students'=>array(
 
            
            'model'=>'student',
 
            
            'key'=>'id'
        )
    );

     protected $has_many=array(
 
       
        'disciplines'=>array(
 
            
            'model'=>'group_discipline',
 
            
            'key'=>'id'
        )
    );

     protected $belonges_to=array(
 
       
        'department'=>array(
 
            
            'model'=>'department',
 
            
            'key'=>'department_id'
        )
    );
 }
?>