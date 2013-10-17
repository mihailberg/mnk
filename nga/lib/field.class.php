<?php
require_once("field.interface.php");

class field{
	private function __construct() {}
 	private function __clone() {}

 	static $classes=array();
 	
	public static function get($class_name){
		$class="field_".$class_name;
		if(!isset(self::$classes[$class_name])){
			require_once("fields/".$class_name.".field.php");
			self::$classes[$class_name]=true;
		}		
		return new $class();
	}
}

class fieldGeneral{

	public $ListShow = false;
	public $FormShow = true;
	public $name;
	public $sqlField;
	
	public $value;
	
	public $search = false;
    public $pdfShow = false;
	
	public $searchType = 'where';

    public $multifield = false;
    public $multifieldData = array();

	public function listShow(){
		$this->ListShow = !$this->ListShow;
	}
	
	public function getValueFromArray($inputArray){
		if(isset($inputArray[$this->sqlField])){
			$this->value = stripslashes(nga_config::i()->db()->real_escape_string($inputArray[$this->sqlField]));
		}
	}
	
	public function getName(){
		return $this->name;
	}
	
	public function getList(){
		return $this->value;
	}
	
	public function getSearch(){
        if(isset($_GET[$this->sqlField]))$this->value = nga_config::db()->real_escape_string($_GET[$this->sqlField]);
		return $this->getForm();
	}
	
	public function getView(){
		$html='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
        <td>'.$this->value.'</td>
	</tr>
	';
		return $html;
	}
    
    public function getPdf(){
        return $this->getView();
    }
	
	public function setValue($value){
		$this->value = $value;
	}
	
	public function getValue(){
		return $this->value;
	}
	public function Save($type){}
	
	public function Delete(){}

    protected $options;
    public function setOptions($options){
        $this->options = $options;
    }
}
?>