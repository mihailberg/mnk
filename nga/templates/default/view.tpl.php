<?php 
$ListData = $Data->table->getData();
$id=(int)$_GET['id'];
$editUrl = '?page=1&action=edit&id='.$id.$safeGetUrl;
?>
<div style="clear:both">
    <a class="btn btn-primary" href="<?php echo $editUrl;?>"><i class="icon-edit icon-white"></i> Редактировать</a>
    &nbsp;&nbsp;<input type="button" onclick="javascript:history.back();return false;" alt="Cancel" class="btn" value="Назад" /><br /><br />
</div>
<?php
foreach ($Data->table->blocks as $block) {
?>


<fieldset>
	<?php if(!empty($block->name)){ echo '<legend>'.$block->name.'</legend>';}?>
    <table class="table">
        <tbody>
        <?php
        foreach ($block as $field) {
			if($field->FormShow){
                if(!($field instanceof field_nodb)){
	                $field->value = $ListData[$id][$field->sqlField];
                }
				echo $field->getView();
			}
        }
		?>	
        </tbody>
    </table>
</fieldset>
<?php
}
?>
<div style="clear:both">    	           </div>
</form>
