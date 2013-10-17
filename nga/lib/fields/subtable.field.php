<?php
/**
 * Special field type.
 * Поля такого типа не участвуют в построении запросов к базе
 */
require_once 'nodb.field.php';
class field_subtable extends field_nodb implements fieldI{


    public $table;
    public $fk_field;
    public $fk_value;



	public function getForm(){
        $this->fk_value = ((int) $_GET['id']);
        return '<iframe class="subiframe" style="border:0px; width:100%;" src="/admin/'.$this->table.'.php?gid='.$this->fk_value.'"></iframe>';
	}

	public function getListEdit(){
		return '';
	}

    public function getValueFromArray($inputArray){

    }

    public function getView(){
        $this->fk_value = ((int) $_GET['id']);
                return '<iframe class="subiframe" style="border:0px; width:100%;" src="/admin/'.$this->table.'.php?gid='.$this->fk_value.'"></iframe>';
    }
}
?>