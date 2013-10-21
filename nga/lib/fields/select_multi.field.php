<?php
require_once 'select.field.php';
class field_select_multi extends field_select implements fieldI{


	public function getForm(){
		$html = '';
		$html.='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
		<td>';
		if($this->source == 'table'){
			$html.='<table width="100%"><tr><td>';
		}
		$html.='<select multiple="multiple" class="field select form" name="'.$this->sqlField.'[]" size="1" style="width:100%;margin:9px 5px 10px 0;" id = "'.$this->sqlField.'"';
		if($this->disabled){
			$html.=' disabled="disabled"';
		}
		$html.='>';
		$html.=$this->getOptions(array_flip($this->value2Array($this->value)));
		$html.='</select>';
		if($this->source == 'table'){
                $html.='</td><td width="20"></td></tr></table>';
       		//	$html.='</td><td width="20"><a href="'.$this->table->name.'.php" target="_blank"><img src="'.nga_config::i()->pathClient['img'].'/elements.gif" alt="'.$this->table->title.'"></a></td></tr></table>';
		}
		$html.='</td></tr>';
		return $html;
	}

    
	public function getView(){
		if($this->value==0){
			$aValue = '<i>не указано</i>';
		} else {
			if(!isset($this->values[$this->value])){
				$aValue = '<i>не указано</i>';
			} else {
				$aValue = $this->values[$this->value];
			}
		}
		$html='
		<tr>
			<td class="edit_label">'.$this->name.':</td>
	        <td>'.$aValue.'</td>
		</tr>
		';
		return $html;
	}
	
	public function getOptions($aValue=0){
        if(!is_array($aValue)){
            $selected = $aValue;
        }

		$html='';
		foreach ($this->values as $k=>$v){
            if(is_array($aValue)){
                $selected = false;
                if(array_key_exists($k, $aValue)){
                    $selected = $k;
                }
            }
			if($selected === $k){
				$html.= '<option value="'.$k.'" selected="selected">'.$v.'</option>';
			} else {
				$html.= '<option value="'.$k.'">'.$v.'</option>';
			}
		}
		return $html;
	}
	
	public function getAjaxContent(){
		$html='';
		foreach ($this->values as $k=>$v){
			$html.= '<option value="'.$k.'">'.$v.'</option>';
		}
	}
	
	public function getListEdit(){
		$html = '';
		$html.='
		<select multiple="multiple" class="field select list" name="'.$this->sqlField.'" size="1">';
		$html.=$this->getOptions(array_flip($this->value2Array($this->value)));
		$html.='</select>';
		return $html;
	}

	public function getList(){
        $html = '';
        if(!is_array($this->value)){
            $this->value = $this->value2Array($this->value);
            $newval = array();
            foreach($this->value as $v){
                if(isset($this->values[$v])) $newval[] = $this->values[$v];
            }

            $html = implode(', ',$newval);
        }
		return $html;
	}

    public function Save($type){
        $this->value = $this->array2Value($this->value);
    }

    /**
     * @param $str
     * @return array
     */
    protected function value2Array($str){
        $r = explode('_',$str);
        if(count($r)>1){
            array_pop($r);
            array_shift($r);
        }
        return $r;
    }

    protected function array2Value($value){
        return '_'.implode("_",$value).'_';
    }
}
?>