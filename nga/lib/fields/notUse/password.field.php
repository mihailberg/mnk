<?php

class field_password extends field_string implements fieldI{
	
	public function getForm($aLabel,$aName,$aValue,$aActionType){
		$html='
	<tr>
		<td colspan="2" style="font-weight:bold;">'.$aLabel.':</td>
	</tr>
	<tr>
		<td colspan="2">';
		if($aActionType != 1){ // Not Add
			$html.= '<input type="checkbox" name="'.$aName.'_replace_" value="1">&nbsp;Заменить пароль<br /><br />'."\n";
		}
		
		$html.='
	<input type="text" class="field form password" name="'.$aName.'" size="100" value="'.$aValue.'" maxlength="255" /></td>
	</tr>	
	';
		return $html;
		
	}
	
	public function getListEdit($aName,$aValue,$aSize){
		$html='<input type="text" class="field list password edit" name="'.$aName.'" size="'.$aSize.'" value="'.$aValue.'"><br />'."\n";	
		return $html;
	}
	
	
	public function getList($aValue,$aSize){
		$html=substr($aValue,0,$aSize);
		return $html;
	}
	
	public function setStyle($aForm,$aList){
		$html='
		 .password{'.$aForm.'}
		';
		return $html;
	}
}
?>