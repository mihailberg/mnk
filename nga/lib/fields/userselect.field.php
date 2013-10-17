<?php
require_once 'select.field.php';
class field_userselect extends field_select implements fieldI{

	public function getForm(){
        $this->value = User::i()->getID();
		if(!User::i()->isAdmin()){
            $this->disable();
        }
        $html = '';
		$html.='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
		<td>';
		if($this->source == 'table'){
			$html.='<table width="100%"><tr><td>';
		}
		$html.='<select class="field select form';
        if($this->disabled){
			$html.=' disabled';
		}
		
        $html.='" name="'.$this->sqlField.'" size="1" style="width:100%;margin:9px 5px 10px 0;" id = "'.$this->sqlField.'"';
        
		if($this->disabled){
			$html.=' disabled="disabled"';
		}
		$html.='>';
		$html.=$this->getOptions($this->value);
		$html.='</select>';
		if($this->source == 'table'){
            
                $html.='</td><td width="20"></td></tr></table>';
            
       		//	$html.='</td><td width="20"><a href="'.$this->table->name.'.php" target="_blank"><img src="'.nga_config::i()->pathClient['img'].'/elements.gif" alt="'.$this->table->title.'"></a></td></tr></table>';
            

		}
		$html.='</td></tr>';
		return $html;
	}
}
?>