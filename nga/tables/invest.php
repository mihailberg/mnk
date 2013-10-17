<?php
require_once(nga_config::i()->pathServer['nga'] . '/tables/region.php');
$outmsk = clone $region;
$outmsk->addWhere('moscow', 0);

require_once(nga_config::i()->pathServer['nga'] . '/tables/highway.php');


$invest_table = new nga_table('invest', 'Проекты для инвестирования');

$investID = $invest_table->addID('ID', 'investID', 'num');


$invest_table_block = $invest_table->addBlock('Основное');
$invest_table_block[0] = $invest_table->add('Тип объекта', 'type', 'select');
$invest_table_block[0]->addValues('Выберите значение',
    'Жилые многоэтажные инвестпроекты',
    'Жилые малоэтажные инвестпроекты',
    'Инвестпроекты строительства аппартаментов',
    'Инвестпроекты гостиниц',
    'Инвестпроекты торговых центров',
    'Инвестпроекты офисно-деловых центров',
    'Коммерческая недвижимость',
    'Здания',
    'Производство',
    'Земельные участки',
    'Иное');


$invest_table_block[1] = $invest_table->add('Направление', 'direction', 'select');
$invest_table_block[1]->addValues(
    'Выберите значение', 'Запад', 'Северо-запад', 'Север', 'Северо-восток', 'Восток', 'Юго-восток', 'Юг', 'Юго-запад'
);

$invest_table_block[2] = $invest_table->add('Трасса', 'highwayID', 'select');
$invest_table_block[2]->constructFromTable($highway);

$invest_table_block[3] = $invest_table->add('Район', 'regionID', 'select');
$invest_table_block[3]->constructFromTable($outmsk);

$invest_table_block[4] = $invest_table->add('Расстояние от МКАД', 'mkad_remoteness', 'num');
$invest_table_block[5] = $invest_table->add('Площадь участка (ГА)', 'square', 'num');
$invest_table_block[6] = $invest_table->add('Категория земли', 'land_category', 'string');
$invest_table_block[7] = $invest_table->add('Разрешенный вид использования', 'use_type', 'string');
$invest_table_block[8] = $invest_table->add('Наличие зданий/строений на участке', 'buildings', 'checkbox');


$invest_table_block[9] = $invest_table->add('Вид права', 'rights_type', 'string');
$invest_table_block[10] = $invest_table->add('Стоимость', 'price', 'num');

include(nga_config::i()->pathServer['nga'] . '/tables/city.php');
$invest_table_block[10] = $invest_table->add('Город', 'cityID', 'select');
$invest_table_block[10]->constructFromTable($city);
$invest_table_block[11] = $invest_table->add("Название", "title", "string");


$invest_table->preInsert = 1;
$images = $invest_table->addBlock('ФОТОГРАФИИ');
$images[0] = $invest_table->add('Основное фото', 'gallery', 'multiphoto');
$images[0]->table = 'photo';
$images[0]->fk_field = 'R_ID';
$images[0]->fk_type = 6;
if (isset($_GET['id'])) {
    $images[0]->fk_value = (int)$_GET['id'];
}

$invest_coordinates = $invest_table->addBlock('Координаты');
$invest_coordinates[0] = $invest_table->add('Широта', 'latitude', 'string');
$invest_coordinates[1] = $invest_table->add('Долгота', 'longitude', 'string');


$invest_table_best = $invest_table->addBlock('Лучшее предложение');
$invest_table_best[0] = $invest_table->add('Лучшее предложение', 'best', 'checkbox');





$filesBlock1 = $invest_table->addBlock('Возможное  изменение вида разрешенного использования');
$filesBlock1[0] = $invest_table->add('Возможное  изменение вида разрешенного использования', 'build_change', 'checkbox');

$filesBlock1[1] = $invest_table->add('Файлы', 'build_change_files', 'multifile');
$filesBlock1[1]->table = 'file';
$filesBlock1[1]->fk_field = 'R_ID';
$filesBlock1[1]->fk_type = 1;
if (isset($_GET['id'])) {
    $filesBlock1[1]->fk_value = (int)$_GET['id'];
}


$filesBlock2 = $invest_table->addBlock('Наличие разработанной ИРД');
$filesBlock2[0] = $invest_table->add('Наличие разработанной ИРД', 'ird', 'checkbox');

$filesBlock2[1] = $invest_table->add('Файлы', 'ird_files', 'multifile');
$filesBlock2[1]->table = 'file';
$filesBlock2[1]->fk_field = 'R_ID';
$filesBlock2[1]->fk_type = 2;
if (isset($_GET['id'])) {
    $filesBlock2[1]->fk_value = (int)$_GET['id'];
}

$filesBlock3 = $invest_table->addBlock('Наличие распорядительных актов');
$filesBlock3[0] = $invest_table->add('Наличие распорядительных актов', 'akt', 'checkbox');

$filesBlock3[1] = $invest_table->add('Файлы', 'akt_files', 'multifile');
$filesBlock3[1]->table = 'file';
$filesBlock3[1]->fk_field = 'R_ID';
$filesBlock3[1]->fk_type = 3;
if (isset($_GET['id'])) {
    $filesBlock3[1]->fk_value = (int)$_GET['id'];
}


$invest_table_block2 = $invest_table->addBlock('Характеристика объекта');
$invest_table_block2[0] = $invest_table->add('Описание участка по ген.плану', 'desc_gen', 'textarea');
$invest_table_block2[1] = $invest_table->add('Описание градостроительных решений', 'desc_sol', 'textarea');
$invest_table_block2[2] = $invest_table->add('Условия входа в проект', 'conditions', 'textarea');
$invest_table_block2[3] = $invest_table->add('Презентация', 'file', 'file');






$invest_table->setListShow($invest_table_block[0], $invest_table_block[1], $invest_table_block[2], $invest_table_block[3],$invest_table_block[10]);
$invest_table->setFormNoShow($investID);
?>