<?php

class field_checkboxlist implements field{
	
	public function getForm($aLabel,$aName,$aValue,$aActionType){
		$html='';
		$columnCount=3;
		$list=array();
		$res=main::db()->query($sql);
		while ($row=$res->fetch_row()) {
			$html.='<input type="checkbox">'
		}
		
		
		
		$html='<input type="text" class="field form num" name="'.$aName.'" size="16" value="'.$aValue.'" style="margin: 10px 10px 20px 10px;"><br />'."\n";	
		return $html;
	}
	
	public function getListEdit($aName,$aValue,$aSize){
		$html='<input type="text" class="field list num edit" name="'.$aName.'" size="'.$aSize.'" value="'.$aValue.'"><br />'."\n";	
		return $html;
	}
	public function getList($aValue,$aSize){
		$html=substr($aValue,0,$aSize);
		return $html;
	}	
}
/*
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