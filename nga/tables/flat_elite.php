<?php
include ($_SERVER['DOCUMENT_ROOT'] . '/nga/tables/flat.php');

//$flat_block2[1]->setValue(1);
$coordinates[3]->setValue(1);



$flat_elite_check = $flat->replaceBlockByObj($flat_elite_check,'Отображать в городской');
$flat_elite_check[0] = $flat->add('Отображать в городской', 'elite_check', 'checkbox');


require_once(nga_config::i()->pathServer['nga'] . '/tables/highway.php');
$flat->title = 'Элитная вторичная недвижимость';
$flat->where = false;
$flat->addWhere('elite', 1);
$coordinates[4] = $flat->add('Направление', 'highwayID', 'select');
$coordinates[4]->constructFromTable($highway);


$flat_elite_map = $flat->addBlock('На карте');
$flat_elite_map->wide = true;
$flat_elite_map[0] = $flat->add('Y', 'Y', 'hidden');
$flat_elite_map[1] = $flat->add('Карта', 'X', 'custom_map');

/*
$coordinates[5] = $flat->add('Направление', 'highwayID', 'select');
$coordinates[5]->constructFromTable($highway);
*/