<?php 
namespace App\Model;
 

class teacher extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='teachers';

   
     protected $belonges_to=array(
 
       
        'university'=>array(
 
            
            'model'=>'university',
 
            
            'key'=>'university_id'
        )
    );

     protected $has_many=array(
 
       
        'disciplines'=>array(
 
            
            'model'=>'teacher_discipline',
 
            
            'key'=>'id'
        )
    );
  
      protected $has_many=array(
     
           
            'comments'=>array(
     
                
                'model'=>'comment_teacher',
     
                
                'key'=>'id'
            )
        );

       
 }
?>