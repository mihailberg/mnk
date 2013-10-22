<?php

include (nga_config::i()->pathServer['nga'] . '/tables/city.php');


include(nga_config::i()->pathServer['nga'] . '/tables/highway.php');
include(nga_config::i()->pathServer['nga'] . '/tables/cottage_set.php');
$cottage_set->addWhere('elite', 0);

$land_table = new nga_table('land', 'Загородная недвижимость');

$landID = $land_table->addID('ID', 'landID', 'num');


//ПРИМЕЧАНИЕ
$land_table_block = $land_table->addBlock('Основное');
$land_table_block[0] = $land_table->add('Тип объекта', 'type', 'select_multi');
$land_table_block[0]->addValues('Выберите значение', 'Дом', 'Земельный участок', 'Дача', 'Таунхаус');


$land_table_block[1] = $land_table->add('Город', 'cityID', 'select');
$land_table_block[1]->constructFromTable($city);

$land_table_block[12] = $land_table->add("Название", "title", "string");
$land_table_block[2] = $land_table->add('Шоссе', 'highwayID', 'select');
$land_table_block[2]->constructFromTable($highway);

$land_table_block[3] = $land_table->add('Коттеджный поселок', 'cottage_setID', 'select');
$land_table_block[3]->addValues('Не в поселке');
$land_table_block[3]->constructFromTable($cottage_set);


include(nga_config::i()->pathServer['nga'] . '/tables/region.php');
$outmsk = clone $region;
$outmsk->addWhere('moscow', 0);
$land_table_block[4] = $land_table->add('Район', 'regionID', 'select');
$land_table_block[4]->constructFromTable($outmsk);
$land_table_block[5] = $land_table->add('Населенный пункт', 'settlement', 'string');
$land_table_block[6] = $land_table->add('Ж/д направление', 'train_way', 'select');
$land_table_block[6]->addValues('Не указано', 'Белорусское', 'Горьковское', 'Казанское', 'Киевское', 'Курское', 'Ленинградское', 'Павелецкое', 'Рижское', 'Савеловское', 'Ярославское', 'Кольцевое');
$land_table_block[7] = $land_table->add('Площадь дома(м2)', 'square_house', 'num');
$land_table_block[8] = $land_table->add('Площадь участка(соток)', 'square_land', 'num');

$land_table_block[9] = $land_table->add('Валюта', 'currency', 'select');
$land_table_block[9]->setValueList(array(
        1 => 'Рубли',
        2 => '$',
        3 => 'Евро'
    ));

$land_table_block[10] = $land_table->add('Стоимость', 'price', 'num');
$land_table_block[11] = $land_table->add('Расстояние от МКАД', 'mkad_remoteness', 'num');



$land_table_block2 = $land_table->addBlock('Характеристика дома');
$land_table_block2[0] = $land_table->add('Этажность/уровни', 'floors', 'string');
$land_table_block2[1] = $land_table->add('Год постройки', 'year', 'num');
$land_table_block2[2] = $land_table->add('Состояние отделки', 'otdelka', 'string');
$land_table_block2[3] = $land_table->add('Наличие мебели', 'mebel', 'checkbox');
$land_table_block2[4] = $land_table->add('Фундамент', 'foundation', 'string');
$land_table_block2[5] = $land_table->add('Крыша', 'roof', 'string');
$land_table_block2[6] = $land_table->add('Перекрытия', 'ceilings', 'string');
$land_table_block2[7] = $land_table->add('Планировка', 'layout', 'string');

$land_table_block3 = $land_table->addBlock('Описание участка');
$land_table_block3[0] = $land_table->add('Форма', 'form', 'string');
$land_table_block3[1] = $land_table->add('Ограждение', 'fence', 'checkbox');
$land_table_block3[2] = $land_table->add('Ворота', 'gate', 'checkbox');
$land_table_block3[3] = $land_table->add('Наличие ландшафтного дизайна', 'landscape_design', 'checkbox');
$land_table_block3[4] = $land_table->add('Стоянка для автомобилей', 'parking', 'checkbox');

$land_table_block4 = $land_table->addBlock('Коммуникации');
$land_table_block4[0] = $land_table->add('Электричество', 'communication_electricity', 'checkbox');
$land_table_block4[1] = $land_table->add('Вода, канализация', 'communication_water', 'checkbox');
$land_table_block4[2] = $land_table->add('Отопление', 'heating', 'checkbox');
$land_table_block4[3] = $land_table->add('Интернет, ТВ', 'internet', 'checkbox');
$land_table_block4[4] = $land_table->add('Телефон', 'phone', 'checkbox');
$land_table_block4[5] = $land_table->add('Газоснабжение', 'gas', 'checkbox');

$land_table_block5 = $land_table->addBlock('Описание');
//$land_table_block5[0] = $land_table->add('Экология', 'ecology', 'textarea');
//$land_table_block5[1] = $land_table->add('Наличие пробок', 'probka', 'checkbox');
//$land_table_block5[2] = $land_table->add('Как добраться до метро', 'metro_access', 'textarea');
//$land_table_block5[3] = $land_table->add('Наличие магазинов/ д/с/ школа', 'infrastructure', 'textarea');
$land_table_block5[0] = $land_table->add('Описание', 'description', 'editor');

$land_table_block6 = $land_table->addBlock('КООРДИНАТЫ');
$land_table_block6[0] = $land_table->add('Широта', 'latitude', 'string');
$land_table_block6[1] = $land_table->add('Долгота', 'longitude', 'string');

$land_table_block6[2] = $land_table->add('elite', 'elite', 'static');
$land_table_block6[2]->setValue(0);
$land_table->addWhere('elite', 0);

$land_table_best = $land_table->addBlock('Лучшее предложение');
$land_table_best[0] = $land_table->add('Лучшее предложение', 'best', 'checkbox');

$land_table_elite_check = $land_table->addBlock('Отображать в элитной');
$land_table_elite_check[0] = $land_table->add('Отображать в элитной', 'elite_check', 'checkbox');

//ФОТОГРАФИИ

$land_table->preInsert = 1;
$images = $land_table->addBlock('ФОТОГРАФИИ');
$images[0] = $land_table->add('Основное фото', 'gallery', 'multiphoto');
$images[0]->table = 'photo';
$images[0]->fk_field = 'R_ID';
$images[0]->fk_type = 5;
if (isset($_GET['id'])) {
    $images[0]->fk_value = (int)$_GET['id'];
}


$land_table->setListShow($land_table_block[1], $land_table_block[12], $land_table_block[3],$land_table_block[10],$land_table_block[9]);

$land_table->setFormNoShow($landID);

//print_r($land_table);

//foreach($land_table as $field){
//    echo $field->sqlField.""."<br />".PHP_EOL;
//}
//die();
?>