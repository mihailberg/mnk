<?php
require_once 'select.field.php';
class field_search_multi_select extends field_select implements fieldI
{
    public $searchType = 'multiselect';
    public function getSearch()
    {
        $values = (isset($_GET[$this->sqlField])) ? array_flip($_GET[$this->sqlField]) : array();
        $html = '';
        $html.='
	<tr>
		<td class="edit_label">' . $this->name . ':</td>
		<td>';
        if ($this->source == 'table') {
            $html.='<table width="100%"><tr><td>';
        }
        $html.='<select multiple="multiple" class="field select form" name="' . $this->sqlField . '[]" size="8" style="width:100%;margin:9px 5px 10px 0;" id = "' . $this->sqlField . '"';
        $html.='>';
		foreach ($this->values as $k=>$v){
			if(isset($values[$k])){
				$html.= '<option value="'.$k.'" selected="selected">'.$v.'</option>';
			} else {
				$html.= '<option value="'.$k.'">'.$v.'</option>';
			}
		}        
        
        $html.='</select>';
        if ($this->source == 'table') {

            $html.='</td><td width="20"></td></tr></table>';

            //	$html.='</td><td width="20"><a href="'.$this->table->name.'.php" target="_blank"><img src="'.nga_config::i()->pathClient['img'].'/elements.gif" alt="'.$this->table->title.'"></a></td></tr></table>';
        }
        $html.='</td></tr>';
        return $html;
    }
    

}

?>