<?
$ListData = $Data->table->getData();
//print_r($ListData);
if ($_GET['action'] == 'add') {
    $actionType = 1;
} else {
    $actionType = 2;
    $id = $_GET['id'];
}

?>
<script>
    $(document).ready(function(){
        $('#edit-form-admin').submit(function(){
            var $r = $('#edit-form-admin .required');

            for(var rI = 0;rI<$r.length;rI++){
                if($($r[rI]).val() == ''){
                    $($r[rI]).attr('style','border-color:red;');
                    $($r[rI]).attr('placeholder','поле необходимо заполнить');
                    $($r[rI]).focus();
                    return false;
                };
            }
        });
    });
</script>
<div>
    <?php
    if ($actionType == 2) {
        echo '<form name="REPLIER" method="POST" enctype="multipart/form-data" action="?action=update' . $safeGetUrl . '" id="edit-form-admin">
	            <input type="hidden" name="ID" value="' . $id . '" />';
    } else {
        echo '<form name="REPLIER" method="POST" enctype="multipart/form-data" action="?action=insert' . $safeGetUrl . '" id="edit-form-admin">';
    }
    ?>
    <div style="clear:both">
        <input type="submit" alt="Сохранить" class="btn btn-primary" value="Сохранить"/>&nbsp;&nbsp;<input type="button"
                                                                                                           onclick="javascript:history.back();return false;"
                                                                                                           alt="Cancel"
                                                                                                           class="btn"
                                                                                                           value="Отмена"/><br/><br/>
    </div>
<!--
    <fieldset class="well" style="width:750px;margin: 0px auto;">
        <legend>ID:</legend>
        <table width="100%">
            <tbody>
			<tr>
                <?php
                     //   echo $Data->table->getId()->getForm();
                        ?>
            </tr>
	        </tbody>
        </table>
        </fieldset> -->
        <?php
    foreach ($Data->table->blocks as $block) {
        $fr = false;
        $tVarH = '
    <fieldset class="well" style="width:750px;margin: 0px auto;">
        <legend>' . $block->name . '</legend>
        <table width="100%">
            <tbody>';

        $tVarH2 = '
    <fieldset class="well">
        <legend>' . $block->name . '</legend>
        <table width="100%">
            <tbody>';
        $cVar = '';


        foreach ($block as $field) {

            if ($field->FormShow) {
                if ($actionType == 2) {
                    if (!($field instanceof field_nodb)) {
                        $field->value = $ListData[$id][$field->sqlField];
                    }
                    if($field->multifield){
                        foreach($field->multifieldData as $mfsql=>$mfvalue){
                            $field->multifieldData[$mfsql] = $ListData[$id][$mfsql];
                        }
                    }
                    $cVar .= $field->getForm();
                } else {
                    $cVar .= $field->getForm($field->name, $field->sqlField, '', $actionType);
                }
            }
        }

        if (preg_match('/iframe/iU', $cVar) || $block->wide) {
            echo $tVarH2 . $cVar;
        } else {
            echo $tVarH . $cVar;
        }
        

        ?>
        </tbody>
        </table>
        </fieldset>
        <?php
    }
    ?>
    <div style="clear:both">
        <input type="submit" alt="Сохранить" class="btn btn-primary" value="Сохранить"/>&nbsp;&nbsp;<input type="button"
                                                                                                           onclick="javascript:history.back();return false;"
                                                                                                           alt="Cancel"
                                                                                                           class="btn"
                                                                                                           value="Отмена"/>
    </div>
    </form>
</div>
   