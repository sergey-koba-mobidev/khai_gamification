<?php 
namespace App\Model;
 

class practice extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='practices';

   
     protected $has_many=array(
 
       
        'student_practices'=>array(
 
            
            'model'=>'student_practice',
 
            
            'key'=>'id'
        )
    );

    protected $belonges_to=array(
 
       
        'discipline'=>array(
 
            
            'model'=>'discipline',
 
            
            'key'=>'discipline_id'
        )
    );
 }
?>