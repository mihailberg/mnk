<?php
class field_mavr_checkbox_string extends field_string implements fieldI{
	
	public function __construct(){
		$this->searchType = 'checkbox';
	}
	
	public function getSearch(){
		$html = '
			<tr>
		<td class="edit_label">'.$this->name.':</td><td>
		<input type="hidden" class="field form num" name="'.$this->sqlField.'" value="0">
		';

			$html.='<input type="checkbox" class="field form num" name="'.$this->sqlField.'" value="1"';
		if($this->value==1){
			$html.=' checked="checked"';
		}
		$html.=' /><br />'."\n";	
		$html.='</td>
	</tr>';
		
		return $html;
	}
	
	
}
?>