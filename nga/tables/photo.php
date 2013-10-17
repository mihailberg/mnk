<?php

$table_photo = new nga_table('photo', 'Фото');
$photo_block = $table_photo->addBlock('Общее');
$photoID = $table_photo->addID('ID', 'photoID', 'num');
$photo_block[0] = $table_photo->add('Название', 'title', 'string');
/*
 * 1 - новостройки стройготовность
 * 2 - новостройки общие фотки
 * 3 - вторичная - основное
 * 4 - коммерческая
 * 5 - Загородная
 * 6 - Инвестирование
 * 7 - зарубежная
 *
 *
$photo_block[1] = $table_photo->add('R_TYPE','R_TYPE','select');
$photo_block[1]->addValues('Выберите значение', 'ЖК новостройки');
$photo_block[2] = $table_photo->add('R_ID','R_ID','num');

*/
$photo_block[1] = $table_photo->add('Картинка', 'THUMB', 'image_preview');
//$photo_block[2] = $table_photo->add('SRC','SRC','hidden');
if (isset($_GET['R_TYPE'])) {
    $table_photo->addWhere('R_TYPE', (int)$_GET['R_TYPE']);
}
if (isset($_GET['gid'])) {
    $table_photo->addWhere('R_ID', (int)$_GET['gid']);
}
//$table_photo->
//R_TYPE
//$photo_block[1]->constructFromTable($country_table);

$table_photo->setListShow($photo_block[0], $photo_block[1]);
$table_photo->setFormNoShow($photoID);
?>