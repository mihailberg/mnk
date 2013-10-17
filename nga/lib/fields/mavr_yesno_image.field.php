<?php
require_once('image.field.php');
class field_mavr_yesno_image extends field_image{
	
	public function getList(){
		if(!empty($this->value)){
			$html='есть';
		} else {
			$html = 'нет';
		}
		return $html;
	}
}
?>