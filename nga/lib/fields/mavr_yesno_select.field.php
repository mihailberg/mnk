<?php
require_once('select.field.php');
class field_mavr_yesno_select extends field_select{

	public function getList(){
		if($this->value==0) return 'не указано';
		elseif($this->values[$this->value]=='нет') return 'нет';
		else  return 'Есть';
	}
}
?>