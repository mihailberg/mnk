<?php
require_once('select.field.php');
class field_ajax_select extends field_select{
	
	private $ajax_subfield;
	
	public function setAjaxField($field){
		$this->ajax_subfield = $field;
	}
	
	public function getForm(){
		$html = '';
		$html.='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
		<td>';
		if($this->source == 'table'){
			$html.='<table width="100%"><tr><td>';
		}
		
		$html.='<select class="field select form" name="'.$this->sqlField.'" size="1" onChange = "loadAjaxContent(\''.nga_config::i()->pathClient['nga'].'/ajax.php?table='.$this->ajax_subfield->table->name.'&field['.$this->table->id.']=\' + this.value,\''.$this->ajax_subfield->sqlField.'\')">';
			foreach ($this->values as $k=>$v){
				if($this->value == $k){
					$html.= '<option value="'.$k.'" selected="selected">'.$v.'</option>';
				} else {
					$html.= '<option value="'.$k.'">'.$v.'</option>';
				}
			}
		$html.='</select>';
		if($this->source == 'table'){
			$html.='</td><td width="10"><a href="'.$this->table->name.'.php" target="_blank"><img src="'.nga_config::i()->pathClient['img'].'/elements.gif" alt="'.$this->table->title.'"></a></td></tr></table>';
		}
		$html.='</td></tr>';
		return $html;
	}
	
}
?>