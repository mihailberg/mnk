<?php

//External

//Country
include(nga_config::i()->pathServer['nga'].'/tables/country.php');
$outcountry = clone $country_table;
$outcountry->addWhere('countryID',1,'!=');

//City
include(nga_config::i()->pathServer['nga'].'/tables/city.php');
$outcity = clone $city;
$outcity->addWhere('countryID',1,'!=');



require_once(nga_config::i()->pathServer['nga'].'/tables/highway.php');



$foreign_table = new nga_table('foreign','Зарубежная недвижимость');

$foreignID = $foreign_table->addID('ID','foreignID','num');

$foreign_table_block = $foreign_table->addBlock('Основное');
$foreign_table_block[0] = $foreign_table->add('Тип объекта', 'type',  'select');
$foreign_table_block[0]->addValues('Выберите значение','Апартаменты', 'Коттедж', 'Коттеджный поселок', 'Таунхаус', 'Вилла', 'Пентахус', 'Новостройка', 'Коммерческая недвижимость');


$foreign_table_block[1] = $foreign_table->add('Страна',	'countryID', 'select');
$foreign_table_block[1]->values[0] = 'не указано';
$foreign_table_block[1]->constructFromTable($outcountry);

$foreign_table_block[2] = $foreign_table->add('Город',	'cityID', 'select');
$foreign_table_block[2]->values[0] = 'не указано';
$foreign_table_block[2]->constructFromTable($outcity);


//Вид объекта: первичный/вторичный
$foreign_table_block[3] = $foreign_table->add('Вид объекта',	'object_view', 'select');
$foreign_table_block[3]->addValues('Выберите значение','Первичный','Вторичный');

$foreign_table_block[4] = $foreign_table->add('Площадь объекта/дома', 'square', 'num');
$foreign_table_block[5] = $foreign_table->add('Площадь участка(соток)',	'square_land', 'num');

$foreign_table_block[6] = $foreign_table->add('Валюта', 'currency', 'select');
$foreign_table_block[6]->setValueList(array(
        1 => 'Рубли',
        2 => '$',
        3 => 'Евро'
    ));


//$currencyList
$foreign_table_block[7] = $foreign_table->add('Цена', 'price', 'num');

$foreign_table_block[8] = $foreign_table->add('Широта', 'latitude', 'string');
$foreign_table_block[9] = $foreign_table->add('Долгота', 'longitude', 'string');
$foreign_table_block[10] = $foreign_table->add('Название', 'title', 'string');



$foreign_table->preInsert = 1;
$images = $foreign_table->addBlock('ФОТОГРАФИИ');
$images[0] = $foreign_table->add('Основное фото', 'gallery', 'multiphoto');
$images[0]->table = 'photo';
$images[0]->fk_field = 'R_ID';
$images[0]->fk_type = 7;
if(isset($_GET['id'])){
    $images[0]->fk_value = (int)$_GET['id'];
}



$foreign_table_block2 = $foreign_table->addBlock('Описание объекта/аппартаментов');
$foreign_table_block2[0] = $foreign_table->add('Этаж', 'floor', 'num');
$foreign_table_block2[1] = $foreign_table->add('Этажность', 'floors', 'num');
$foreign_table_block2[2] = $foreign_table->add('Секция', 'section', 'string');
$foreign_table_block2[3] = $foreign_table->add('Планировка', 'planing', 'string');


$foreign_table_best = $foreign_table->addBlock('Лучшее предложение');
$foreign_table_best[0] = $foreign_table->add('Лучшее предложение','best', 'checkbox');

$foreign_table_block3 = $foreign_table->addBlock('Жилое помещение');
$foreign_table_block3[0] = $foreign_table->add('Количество спален', 'live_count', 'num');
$foreign_table_block3[1] = $foreign_table->add('Количество санузлов', 'bath_count', 'num');
$foreign_table_block3[2] = $foreign_table->add('Кухня (м<sup>2</sup>)', 'square_kitchen', 'num');
$foreign_table_block3[3] = $foreign_table->add('Гостиная (м<sup>2</sup>)', 'square_guest', 'num');

$foreign_table_block4 = $foreign_table->addBlock('Информация');
$foreign_table_block4[0] = $foreign_table->add('Год постройки', 'year', 'num');
$foreign_table_block4[1] = $foreign_table->add('Дополнительные постройки', 'additional_building', 'string');
$foreign_table_block4[2] = $foreign_table->add('Отделка', 'otdelka', 'checkbox');
$foreign_table_block4[3] = $foreign_table->add('Наличие мебели', 'mebel', 'checkbox');
$foreign_table_block4[4] = $foreign_table->add('Телефон', 'phone', 'checkbox');
$foreign_table_block4[5] = $foreign_table->add('Интернет', 'internet', 'checkbox');
$foreign_table_block4[6] = $foreign_table->add('Тип дома', 'house_type', 'string');
$foreign_table_block4[7] = $foreign_table->add('Лифт', 'lift', 'checkbox');
$foreign_table_block4[8] = $foreign_table->add('Охрана', 'guard', 'checkbox');
$foreign_table_block4[9] = $foreign_table->add('Парковка', 'parking', 'checkbox');
$foreign_table_block4[10] = $foreign_table->add('Расходы на содержание/эксплуатацию объекта (ежемесячно)', 'month_costs', 'string');

$foreign_table_block5 = $foreign_table->addBlock('Описание  жилого комплекса');
$foreign_table_block5[0] = $foreign_table->add('Количество домов, которые входят в комплекс',    'gk_build_count', 'num');
$foreign_table_block5[1] = $foreign_table->add('Наличие бассейнов',                          'gk_pool', 'checkbox');
$foreign_table_block5[2] = $foreign_table->add('Наличие детских площадок',                 'gk_kind_area', 'checkbox');
$foreign_table_block5[3] = $foreign_table->add('Выход на море',                         'gk_sea', 'checkbox');
$foreign_table_block5[4] = $foreign_table->add('Удаленность от центра города',           'gk_center_remoteness', 'num');
$foreign_table_block5[5] = $foreign_table->add('Наличие доп.услуг в комплексе.',       'gk_conditions', 'checkbox');
$foreign_table_block5[6] = $foreign_table->add('Описание места',       'place_description', 'editor');


$foreign_table_block6 = $foreign_table->addBlock('Дополнительные затраты');
$foreign_table_block6[0] = $foreign_table->add('При покупке', 'additional_price', 'string');
$foreign_table_block6[1] = $foreign_table->add('Налог на недвижимость', 'additional_tax', 'string');



$foreign_table->setListShow($foreign_table_block[0],$foreign_table_block[1],$foreign_table_block[2],$foreign_table_block[3],$foreign_table_block[7],$foreign_table_block[6]);
$foreign_table->setFormNoShow($foreignID);

?>