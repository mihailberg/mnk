<?php
class field_editor extends fieldGeneral implements fieldI{
	
	public function getForm(){
		$html= '
		
		<tr>
			<td colspan="2" style="font-weight:bold;">'.$this->name.':</td>
		</tr>
		<tr>
			<td colspan="2">';
			$html.=$this->geteditor();
		$html.= '</td></tr>';
		return $html;
	}
	
	public function getListEdit(){
		$html='<input type="text" class="field list string edit" name="'.$this->sqlField.'" value="'.$this->value.'"><br />'."\n";	
		return $html;
	}
	public function getList(){
		$html=substr($aValue,0,$aSize);
		return $html;
	}
	
	public function setStyle($aForm,$aList){
		$html='
		.field .form .string{'.$aForm.'}
		.field .list .string{'.$aList.'}
		';
		return $html;		
	}
    
    public function getView(){
		$html='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
        <td>'.stripslashes($this->value).'</td>
	</tr>
	';
		return $html;
	}

	private function geteditor(){

            require_once(nga_config::i()->pathServer['nga'].'/editors/ckeditor/ckeditor.php');

            $editor = new CKeditor();
            
            $editor->returnOutput = true;
//            /Users/NG/Sites/nga.local/htdocs/nga/editors/ckeditor/
            $editor->BasePath	= "/editors/ckeditor/";
            $editor->config['width'] = '100%';
            $editor->config['height'] = 400;
            return $editor->editor($this->sqlField, stripslashes($this->value));
	}
}
?>