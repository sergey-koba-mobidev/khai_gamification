<?php 
namespace App\Model;
 

class badge extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='badges';

   
     protected $has_many=array(
 
       
        'student_badges'=>array(
 
            
            'model'=>'student_badge',
 
            
            'key'=>'id'
        )
    );

    
     protected $belonges_to=array(
 
       
        'discipline'=>array(
 
            
            'model'=>'discipline',
 
            
            'key'=>'discipline_id'
        )
    );

      protected $belonges_to=array(
 
       
        'category'=>array(
 
            
            'model'=>'category',
 
            
            'key'=>'category_id'
        )
    );

 }
?>