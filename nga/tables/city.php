<?php
include(nga_config::i()->pathServer['nga'] . '/tables/country.php');


$city = new nga_table('city','Города');
$city_block = $city->addBlock('Общее');
$cityID = $city->addID('ID','cityID','num');
$city_block[0] = $city->add('Название','title','string');
$city_block[1] = $city->add('Страна','countryID','select');
$city_block[1]->addValues('Выберите значение');
$city_block[1]->constructFromTable($country_table);

$city->setListShow($city_block[0]);
$city->setFormNoShow($cityID);
?>