<?php

class field_editor extends fieldGeneral implements fieldI
{

    public function getForm()
    {
        $html = '
		<tr>
			<td colspan="2" style="font-weight:bold;">' . $this->name . ':</td>
		</tr>
		<tr>
			<td colspan="2">';
        $html.=$this->geteditor();
        $html.= '</td></tr>';
        return $html;
    }

    public function getListEdit()
    {
        $html = '<input type="text" class="field list string edit" name="' . $this->sqlField . '" value="' . $this->value . '"><br />' . "\n";
        return $html;
    }

    public function getList()
    {
        $html = substr($aValue, 0, $aSize);
        return $html;
    }

    public function setStyle($aForm, $aList)
    {
        $html = '
		.field .form .string{' . $aForm . '}
		.field .list .string{' . $aList . '}
		';
        return $html;
    }

    public function getView()
    {
        $html = '
	<tr>
		<td class="edit_label">' . $this->name . ':</td>
        <td>' . stripslashes($this->value) . '</td>
	</tr>
	';
        return $html;
    }

    private function geteditor()
    {
        require_once(nga_config::i()->pathServer['nga'] . '/editors/ckeditor/ckeditor.php');
        require_once(nga_config::i()->pathServer['nga'] . '/editors/ckfinder/ckfinder.php');

        $ckeditor = new CKEditor();
        $ckeditor->basePath = '/nga/editors/ckeditor/';

        $ckeditor->config['filebrowserBrowseUrl'] = '/nga/editors/ckfinder/ckfinder.html';
        $ckeditor->config['filebrowserImageBrowseUrl'] = '/nga/editors/ckfinder/ckfinder.html?type=Images';
        $ckeditor->config['filebrowserFlashBrowseUrl'] = '/nga/editors/ckfinder/ckfinder.html?type=Flash';
        $ckeditor->config['filebrowserUploadUrl'] = '/nga/editors/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
        $ckeditor->config['filebrowserImageUploadUrl'] = '/nga/editors/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
        $ckeditor->config['filebrowserFlashUploadUrl'] = '/nga/editors/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';

        $ckeditor->returnOutput = true;

        return $ckeditor->editor($this->sqlField, $this->value);
    }
    public function getValueFromArray($inputArray){
   		if(isset($inputArray[$this->sqlField])){
   			$this->value = nga_config::i()->db()->real_escape_string($inputArray[$this->sqlField]);
   		}
   	}

}
?>