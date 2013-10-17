<?php

class field_checkbox extends fieldGeneral implements fieldI{
	
    public $searchType = 'checkbox';
	public function getForm(){
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
	
	public function getListEdit(){

	}
    
    public function getList(){
        return ($this->value==1)?'да':'нет';
    }
	
	public function getView(){
		if($this->value==1){
			$aValue = 'да';
		} else {
			$aValue = 'нет';
		}
		$html='
		<tr>
			<td class="edit_label">'.$this->name.':</td>
	        <td>'.$aValue.'</td>
		</tr>
		';
		return $html;
	}
    
    public function getSearch(){
        if(isset($_GET[$this->sqlField])){
            $value = $_GET[$this->sqlField];
        } else {
            $value = 2;
        }
        
        
		$html = '	<tr><td class="edit_label">'.$this->name.':</td><td>	';

        $html .= '<label class="radio"><input type="radio" name="'.$this->sqlField.'" value="2" '.(($value==2)?'checked="checked"':'') .'> Не учитывать</label>';
        $html .= '<label class="radio"><input type="radio" name="'.$this->sqlField.'" value="1" '.(($value==1)?'checked="checked"':'') .'> Да</label>';
        $html .= '<label class="radio"><input type="radio" name="'.$this->sqlField.'" value="3" '.(($value==3)?'checked="checked"':'') .'> Нет</label>';
        
        

		$html.='</td>
	</tr>';
        return $html;
    }
}
/*

	/*
		$html='';
		$columnCount=3;
		$list=array();
		$res=main::db()->query($sql);
		while ($row=$res->fetch_row()) {
			$html.='<input type="checkbox">';
		}
		




<script type="text/javascript">
  $(document).ready(function(){
    $('.noneed').hide();
	$(":checkbox").change(function(){
		$(this).parent('form').ajaxSubmit();
	});
  });
</script>


				<form method="post" action="">
					<input type="hidden" name="data[operation]" value="<?php echo $right_v['right_id']; ?>"/>
					<input type="hidden" name="data[role]" value="<?php echo $rl_v['rl_id']; ?>"/>
					<input type="hidden" name="data[resource]" value="<?php echo $res_v['res_id']; ?>"/>
					<input id="allow<?php echo $f; ?>" type="checkbox" name="data[allow]"<?php if($this->acl->isAllowed($rl_v['rl_id'],$res_v['res_id'],$right_v['right_id'])) echo 'checked="checked"'; ?>>
					<br /><input class="noneed" type="submit" value="ok" />
				</form>
*/
?>