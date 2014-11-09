<?php 
namespace App\Model;
 

class university extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='universities';

   
    protected $has_many=array(
 
       
        'departments'=>array(
 
            
            'model'=>'department',
 
            
            'key'=>'id'
        )
    );
  
      protected $has_many=array(
     
           
            'disciplines'=>array(
     
                
                'model'=>'discipline',
     
                
                'key'=>'id'
            )
        );

      protected $has_many=array(
     
           
            'teachers'=>array(
     
                
                'model'=>'teacher',
     
                
                'key'=>'id'
            )
        );

     
 }
?>