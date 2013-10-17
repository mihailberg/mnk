<?php
$cottage_set = new nga_table('cottage_set','Элитные коттеджные поселки');
$cottage_set_block = $cottage_set->addBlock('Общее');
$cottage_setID = $cottage_set->addID('ID','cottage_setID','num');
$cottage_set_block[0] = $cottage_set->add('Название','title','string');
$cottage_set_block[1] = $cottage_set->add('Описание','description','editor');

$cottage_set_block[2] = $cottage_set->add('elite', 'elite', 'static');
$cottage_set_block[2]->setValue(1);
$cottage_set->addWhere('elite',1);

$cottage_set->setListShow($cottage_set_block[0]);
$cottage_set->setFormNoShow($cottage_setID);
?>