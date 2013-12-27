<?php
class field_select extends fieldGeneral implements fieldI{
	
	public $source = false;
	public $disabled = false;
	public $mode = false;
	public function getForm(){
		$html = '';
		$html.='
	<tr>
		<td class="edit_label">'.$this->name.':</td>
		<td>';
		if($this->source == 'table'){
			$html.='<table width="100%"><tr><td>';
		}
		$html.='<select class="field select form" name="'.$this->sqlField.'" size="1" style="width:100%;margin:9px 5px 10px 0;" id = "'.$this->sqlField.'"';
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
	
	public function disable(){
		$this->disabled=true;
	}
	
    public function setMode($mode){
        $this->mode = $mode;
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
		$html='';
		foreach ($this->values as $k=>$v){
			if($aValue == $k){
				$html.= '<option value="'.$k.'" selected="selected">'.$v.'</option>';
			} else {
				$html.= '<option value="'.$k.'">'.$v.'</option>';
			}
		}
		return $html;
	}
	
	public function getAjaxContent(){
		$html.='';
		foreach ($this->values as $k=>$v){
			$html.= '<option value="'.$k.'">'.$v.'</option>';
		}
	}
	
	public function getListEdit(){
		$html = '';
		$html.='
		<select class="field select list" name="'.$this->sqlField.'" size="1">';
		$html.=$this->getOptions($this->value);
		$html.='</select>';
		return $html;
	}
	public function getList(){
		if($this->value==0) return '<i>не указано</i>';
			if(!isset($this->values[$this->value])){
				$html = '<i>не указано</i>';
			} else {
				$html = $this->values[$this->value];
			}

		return $html;
	}

    public function setValueList($l){
        $this->values = $l;
    }

    public $values = array();
    public function getValues(){
        return $this->values;
    }
	
	public function addValues(){
		$this->values = func_get_args();
	}
	
	public $table;
	
	public function setTable($tName,$tTitle){
        $this->table = new nga_table($tName,$tTitle);
        $this->path[$tName.".php"] = $tTitle;
    }
    
    public function constructFromTable($table){
    	$this->source = 'table';
	    $this->table = $table;
	    $this->table->perPage = 1000;
	    $this->complete();
    }
    
    public function complete(){
    	$d=$this->table->getData();
        if(is_array($d)){
    	foreach($d as $k=>$v){
    		if(isset($v['title']))	$this->values[$k] = $v['title'];
	   		if(isset($v['name']))	$this->values[$k] = $v['name'];
  		}
        }
    }
    
    public function getName(){
    	
//    	if($this->source == 'table'&&$this->sqlField!='parent'){
//			return '&nbsp;<a href="'.$this->table->name.'.php" target="_blank">'.$this->name.'</a>';
//		} else {
			return $this->name;
//		}
    }
}
?>