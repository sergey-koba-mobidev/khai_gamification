<?php 
namespace App\Model;
 

class department extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='departments';

   
     protected $has_many=array(
 
       
        'groups'=>array(
 
            
            'model'=>'group',
 
            
            'key'=>'id'
        )
    );

  
     protected $belonges_to=array(
 
       
        'university'=>array(
 
            
            'model'=>'university',
 
            
            'key'=>'university_id'
        )
    );
 }
?>