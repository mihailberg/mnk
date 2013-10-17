<?php
/**
 * Special field type.
 * Поля такого типа не участвуют в построении запросов к базе
 */
class field_nodb extends fieldGeneral implements fieldI{
	
	public function getForm(){
		return '';
	}	

	public function getListEdit(){
		return '';
	}

    public function getValueFromArray($inputArray){

    }
}
?>