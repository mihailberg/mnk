<?php

include (nga_config::i()->pathServer['nga'] . '/tables/region.php');
$region->where = false;



$newflat_gk = new nga_table('newflat_gk', 'ЖК новостройки');
$newflat_gk_ID = $newflat_gk->addID('ID', 'newflat_gkID', 'num');

$newflat_gk_block = $newflat_gk->addBlock('Основное');
$newflat_gk_block[0] = $newflat_gk->add('Название', 'title', 'string'); //ЖК __________,
$newflat_gk_block[1] = $newflat_gk->add('Тип дома', 'type', 'select'); // округ_____
$newflat_gk_block[1]->addValues('Выберите значение', 'Панель', 'Кирпич', 'Кирпич-монолит', 'иное');

$newflat_gk_block[2] = $newflat_gk->add('Cрок сдачи', 'complete_year', 'string',array('required'=>true));

$newflat_gk_block[3] = $newflat_gk->add('Квартал', 'kvartal', 'select');
$newflat_gk_block[3]->addValues('Не указан','I','II','III','IV');


$newflat_gk_block[4] = $newflat_gk->add('Район', 'regionID', 'search_multi_select');
$newflat_gk_block[4]->addValues('Не указан');
$newflat_gk_block[4]->constructFromTable($region);

$newflat_gk_block[5] = $newflat_gk->add('Ипотека: Банки', 'banks', 'textarea');
$newflat_gk_block[6] = $newflat_gk->add('Описание', 'description', 'editor');


$images = $newflat_gk->addBlock('ФОТОГРАФИИ');
$images[0] = $newflat_gk->add('Основное фото', 'gallery', 'multiphoto');
$images[0]->table = 'photo';
$images[0]->fk_field = 'R_ID';
$images[0]->fk_type = 2;
if (isset($_GET['id'])) {
    $images[0]->fk_value = (int)$_GET['id'];
}

$coordinates = $newflat_gk->addBlock('Расположение');

include(nga_config::i()->pathServer['nga'] . '/tables/city.php');
$coordinates[0] = $newflat_gk->add('Город', 'cityID', 'select');
$coordinates[0]->constructFromTable($city);

$coordinates[1] = $newflat_gk->add('Широта', 'latitude', 'string');
$coordinates[2] = $newflat_gk->add('Долгота', 'longitude', 'string');
$coordinates[3] = $newflat_gk->add('Адрес', 'address', 'textarea');
$coordinates[4] = $newflat_gk->add('Округ', 'district', 'select');
$coordinates[4]->addValues('Выберите значение', 'ЦАО', 'САО', 'ЗАО', 'ВАО', 'ЮАО', 'СВАО', 'СЗАО', 'ЮЗАО', 'ЮВАО');

$coordinates[5] = $newflat_gk->add('Метро', 'stationID', 'select');
include(nga_config::i()->pathServer['nga'] . '/tables/subway_stations.php');
$coordinates[5]->addValues('Выберите значение');
$coordinates[5]->constructFromTable($subway_stations);

$coordinates[6] = $newflat_gk->add('Как добраться', 'howget', 'editor');
//$coordinates[7] = $newflat_gk->add('reg', 'howget', 'editor');


$newflat_gk_best = $newflat_gk->addBlock('Лучшее предложение');
$newflat_gk_best[0] = $newflat_gk->add('Лучшее предложение', 'best', 'checkbox');

//$coordinates[7] = $newflat_gk->add('Лучшее предложение','best', 'checkbox');


$newflat_gk->preInsert = 1;


$newflat_gk_block_subtable = $newflat_gk->addBlock('Свободные квартиры');
$newflat_gk_block_subtable[0] = $newflat_gk->add('Свободные квартиры', 'free_flats', 'subtable');

//require_once(nga_config::i()->pathServer['nga'] . '/tables/newflat.php');
$newflat_gk_block_subtable[0]->table = 'newflat';
$newflat_gk_block_subtable[0]->fk_field = 'newflat_gkID';
//$newflat_gk_block_subtable[0]->fk_value = 'newflat_gkID';

$newflat_gk_block_plan = $newflat_gk->addBlock('Планировки');
$newflat_gk_block_plan[0] = $newflat_gk->add('Планировки', 'plans', 'subtable');

$newflat_gk_block_plan[0]->table = 'plan';
$newflat_gk_block_plan[0]->fk_field = 'newflat_gkID';


$newflat_gk_block_plan = $newflat_gk->addBlock('Строительная готовность');
$newflat_gk_block_plan[0] = $newflat_gk->add('Строительная готовность', 'gallery', 'multiphoto');

$newflat_gk_block_plan[0]->table = 'photo';
$newflat_gk_block_plan[0]->fk_field = 'R_ID';
$newflat_gk_block_plan[0]->fk_type = 1; //1-жк-готовность
$newflat_gk_block_plan[1] = $newflat_gk->add('elite', 'elite', 'static');
$newflat_gk_block_plan[1]->setValue(0);



$newflat_gk_elite_check = $newflat_gk->addBlock('Отображать в элитной');
$newflat_gk_elite_check[0] = $newflat_gk->add('Отображать в элитной', 'elite_check', 'checkbox');


$newflat_gk->addWhere('elite', 0);


$newflat_gk->setListShow($newflat_gk_block[0]);
$newflat_gk->setFormNoShow($newflat_gk_ID);

//unset($newflat_gk->blocks[1]);
//print_r($newflat_gk);
?>