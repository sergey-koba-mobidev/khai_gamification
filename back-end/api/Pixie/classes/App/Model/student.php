<?php 
namespace App\Model;
 

class student extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='students';

     protected $belongs_to=array(
 
        
        'group'=>array(
 
           
            'model'=>'group',
 
            
            'key'=>'group_id'
        )
    );

     protected $has_many=array(
 
        
        'practices'=>array(
 
           
            'model'=>'student_practice',
 
            
            'key'=>'id'
        )
    );
      protected $has_many=array(
 
        
        'badges'=>array(
 
           
            'model'=>'student_badge',
 
            
            'key'=>'id'
        )
    );
       protected $has_many=array(
 
        
        'achievments'=>array(
 
           
            'model'=>'student_achievment',
 
            
            'key'=>'id'
        )
    );
        protected $has_many=array(
 
        
        'disciplines'=>array(
 
           
            'model'=>'student_discipline',
 
            
            'key'=>'id'
        )
    );
         protected $has_many=array(
 
        
        'comments'=>array(
 
           
            'model'=>'student_comment',
 
            
            'key'=>'id'
        )
    );
 }
?>