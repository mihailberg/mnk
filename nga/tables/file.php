<?php

$table_file = new nga_table('file', 'Файлы');
$file_block = $table_file->addBlock('Общее');
$fileID = $table_file->addID('ID', 'fileID', 'num');
$file_block[0] = $table_file->add('Название', 'title', 'string');
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
$file_block[1] = $table_file->add('R_TYPE','R_TYPE','select');
$file_block[1]->addValues('Выберите значение', 'ЖК новостройки');
$file_block[2] = $table_file->add('R_ID','R_ID','num');

*/
$file_block[1] = $table_file->add('Файл', 'SRC', 'file');
//$file_block[2] = $table_file->add('SRC','SRC','hidden');
if (isset($_GET['R_TYPE'])) {
    $table_file->addWhere('R_TYPE', (int)$_GET['R_TYPE']);
}
if (isset($_GET['gid'])) {
    $table_file->addWhere('R_ID', (int)$_GET['gid']);
}
//$table_file->
//R_TYPE
//$file_block[1]->constructFromTable($country_table);

$table_file->setListShow($file_block[0], $file_block[1]);
$table_file->setFormNoShow($fileID);
?>