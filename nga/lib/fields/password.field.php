<?php
class field_password extends field_string implements fieldI{
	
	public function getForm(){
		$html='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
                <td><input type="text" class="field form string" style="width:100%" name="'.$this->sqlField.'" value="'.$this->value.'" maxlength="255" /></td>
	</tr>
	';
		return $html;
	}	
	
	public function getListEdit(){
		$html='<input type="text" class="field list string edit" name="'.$this->sqlField.'" style="width:100%;margin:5px 5px 6px 0;" value="'.$this->value.'">'."\n";	
		return $html;
	}
    
    public function save($action){
        if($action == 'insert'){
            $this->value = User::createPassword($this->value);
        }
    }
	
}
?>