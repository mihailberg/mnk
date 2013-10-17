<?php
include ($_SERVER['DOCUMENT_ROOT'] . '/nga/tables/land.php');

//$land_block2[1]->setValue(1);
$land_table_block6[2]->setValue(1);

$land_table->title = 'Элитная загородная недвижимость';
$land_table->where = false;

$land_table_elite_check = $land_table->addBlock('Отображать в загородной');
$land_table_elite_check[0] = $land_table->add('Отображать в загородной', 'elite_check', 'checkbox');


include(nga_config::i()->pathServer['nga'] . '/tables/cottage_set.php');
$cottage_set->addWhere('elite', 1);

$land_table_block[3] = $land_table->add('Коттеджный поселок', 'cottage_setID', 'select');
$land_table_block[3]->addValues('Не в поселке');
$land_table_block[3]->constructFromTable($cottage_set);


$land_elite_map = $land_table->addBlock('На карте');
$land_elite_map->wide = true;
$land_elite_map[0] = $land_table->add('Карта', 'X', 'custom_map');


$land_table->addWhere('elite', 1);