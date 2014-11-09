<?php 
namespace App\Model;
 

class achievment extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='achievments';

   
     protected $has_many=array(
 
       
        'student_achievments'=>array(
 
            
            'model'=>'student_achievment',
 
            
            'key'=>'id'
        )
    );

  
 }
?>