<?php 
namespace App\Model;
 

class discipline extends \PHPixie\ORM\Model {

	
    public $id_field='id';
 
    
    public $table='disciplines';

   
    protected $belonges_to=array(
 
       
        'university'=>array(
 
            
            'model'=>'university',
 
            
            'key'=>'university_id'
        )
    );
 }
?>