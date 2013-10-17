<?php
include ($_SERVER['DOCUMENT_ROOT'] . '/nga/tables/newflat_gk.php');

//$newflat_gk_block2[1]->setValue(1);
$newflat_gk_block_plan[1]->setValue(1);


$newflat_gk->title = 'Элитные ЖК';
$newflat_gk->where = false;



$newflat_gk_elite_check = $newflat_gk->replaceBlockByObj($newflat_gk_elite_check,'Отображать в новостройках');
$newflat_gk_elite_check[0] = $newflat_gk->add('Отображать в новостройках', 'elite_check', 'checkbox');


//$newflat_gk_block_plan[0]->fk_type = 8-GK;//1-жк-готовность
$newflat_gk_block_plan[1]->setValue(1);
$newflat_gk_block[7] = $newflat_gk->add('Свободные', 'apartments', 'select');
$newflat_gk_block[7]->addValues('квартиры', 'апартаменты');

$newflat_gk_elite_map = $newflat_gk->addBlock('На карте');
$newflat_gk_elite_map->wide = true;
$newflat_gk_elite_map[0] = $newflat_gk->add('Карта', 'X', 'custom_map');
/*
include 'nga/tables/highway.php';
$coordinates[7] = $newflat_gk->add('Шоссе', 'highwayID', 'select');
$coordinates[7]->constructFromTable($highway);
*/
$newflat_gk->addWhere('elite', 1);