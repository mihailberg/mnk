<div  class="well">
<form name="REPLIER" method="GET" enctype="multipart/form-data">
    <input type="hidden" name="action" value="search" />
    <div style="clear:both">	            	</div>
<?php

foreach ($Data->table->blocks as $block) { 
if($block->search){
?>
<fieldset class="edit_block">
	<legend><?php echo $block->name;?></legend>
    <table class="form">
        <tbody>
        <?php
        foreach ($block as $field) {
			if($field->search){
				echo $field->getSearch();
            }
        }
		?>	
        </tbody>
    </table>
</fieldset>
<?php } } ?>
<div style="clear:both">
    <input type="submit" alt="Поиск" value="Поиск" class="btn btn-primary" />
    <input type="reset" alt="Очистить" value="Очистить" class="btn" />
</div>
</form>
</div>

<div>
    <h2 class="">Результаты поиска</h2>
<?php

if(IsSet($_GET['decorated'])){
	foreach ($Data->table->blocks as $block) { 
		if($block->search){
			foreach ($block as $field) {
				if($field->search){
					if($field->searchType=='where'&&!empty($_GET[$field->sqlField])){
						$Data->table->addWhere($field->sqlField,$_GET[$field->sqlField]);
					}
                    
                    //Between
					if($field->searchType=='between' && (
                        !empty($_GET[$field->sqlField.'_from'])||!empty($_GET[$field->sqlField.'_to'])		)){
                        
                        
							
						$from = (!empty($_GET[$field->sqlField.'_from']))? (int)$_GET[$field->sqlField.'_from']: 0;
						$to = (!empty($_GET[$field->sqlField.'_to']))? (int)$_GET[$field->sqlField.'_to']: 0;

                        if(empty($from) && empty ($to) ){
                            //Skip
                        }
                        if(!empty($from)&&empty($to)){
                            $Data->table->addWhere($field->sqlField,$from,">=");
                        }
                        if(empty($from)&&!empty($to)){
                            $Data->table->addWhere($field->sqlField,$to,"<=");
                        }
                        if(!empty($from)&&!empty($to)&& ($from < $to)){
                            $Data->table->addBetween($field->sqlField,$from,$to);
                        }
    	    	    }
                    
                    if($field->searchType=='multiselect'&&!empty($_GET[$field->sqlField])){                        
						$Data->table->addIn($field->sqlField,
                            implode(',',$_GET[$field->sqlField]));
					}
                    if($field->searchType=='checkbox'&&!empty($_GET[$field->sqlField])){
                        if($_GET[$field->sqlField] == 2){}
                        if($_GET[$field->sqlField] == 1){
                            $Data->table->addWhere($field->sqlField,1);
                        }
                        if($_GET[$field->sqlField] == 3){
                            $Data->table->addWhere($field->sqlField,0);
                        }
					}                    
    	    	}
        	}
        }
    }
    
    include(nga_config::i()->pathServer['tpl'].'/list.tpl.php');
}
/*
$ListData = $Data->table->getData();
//print_r($Data->table->query);
*/
?>

</div>