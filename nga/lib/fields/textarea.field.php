<?php

class field_textarea extends fieldGeneral implements fieldI{

/*    public function getValueFromArray($inputArray){
   		if(isset($inputArray[$this->sqlField])){
   			$this->value = strtr(nga_config::i()->db()->real_escape_string($inputArray[$this->sqlField]),array("\'"=>"'",'\"'=>'"'));
   		}
   	}
*/
	public function getForm(){
		$html='
	<tr><td colspan="2">'.$this->name.':</td></tr>
	<tr><td colspan="2"><textarea class="field textarea form" style="width:100%;height:200px;"  name="'.$this->sqlField.'">'.$this->value.'</textarea><br>'."\n".'</tr>';
		return $html;
	}
	
	public function getListEdit(){
		$html='<input type="text" class="field list string edit" name="'.$this->sqlField.'" style="width:100%;" value="'.$this->value.'"><br />'."\n";	
		return $html;
	}
    public function getView(){
		$html='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
        <td>'.nl2br($this->value).'</td>
	</tr>
	';
		return $html;
	}
    public function getValueFromArray($inputArray){
   		if(isset($inputArray[$this->sqlField])){
   			$this->value = nga_config::i()->db()->real_escape_string($inputArray[$this->sqlField]);
   		}
   	}
/*
    public function Save(){
        $this->value = stripslashes(nga_config::i()->db()->real_escape_string($this->value));
    }*/
}
?>