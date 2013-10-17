<?php
$newflat = new nga_table('newflat', 'Новостройки');
$ID = $newflat->addID('ID', 'newflatID', 'num');
$ID->FormShow = false;
//ПРИМЕЧАНИЕ
$newflat_block = $newflat->addBlock('Общее');

//ЖК
$newflat_block[0] = $newflat->add('ЖК', 'newflat_gkID', 'static');
//require_once(nga_config::i()->pathServer['nga'] . '/tables/newflat_gk.php');
//$newflat_block[0]->constructFromTable($newflat_gk);

$newflat_block[0]->FormShow = false;

if(!empty($_GET['gid'])){
    $newflat_block[0]->setValue((int)$_GET['gid']);
    $newflat->addWhere('newflat_gkID',(int)$_GET['gid']);
}


$newflat_block[1] = $newflat->add('Корпус', 'korpus', 'string');
$newflat_block[2] = $newflat->add('Секция', 'section', 'string');
$newflat_block[3] = $newflat->add('Этаж', 'floor', 'num');
$newflat_block[4] = $newflat->add('Комната', 'isroom', 'checkbox');
$newflat_block[5] = $newflat->add('Комнат', 'room', 'num');


$newflat_block[6] = $newflat->add('Площадь', 'square', 'string');

$newflat_block[7] = $newflat->add('Валюта', 'currency', 'select');
$newflat_block[7]->setValueList(array(
        1 => 'Рубли',
        2 => '$',
        3 => 'Евро'
    ));


$newflat_block[8] = $newflat->add('Цена за м<sup>2</sup>', 'price_m', 'string');
$newflat_block[9] = $newflat->add('Цена', 'price', 'string');
$newflat_block[10] = $newflat->add('Планировка', 'plan_img', 'image');

$newflat->addOrderBy('newflatID', 'DESC');

$newflat->groupField =  'newflat_gkID';
//$newflat->setFormNoShow($ID, $newflat_block[0]);

$newflat->setListShow($newflat_block[1],$newflat_block[2],$newflat_block[3], $newflat_block[4], $newflat_block[5],$newflat_block[6],$newflat_block[7],$newflat_block[8],$newflat_block[9] );
?>