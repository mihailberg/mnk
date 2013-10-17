<?php
$flat = new nga_table('flat', 'Квартиры');
$flat_ID = $flat->addID('ID', 'flatID', 'num');

//ПРИМЕЧАНИЕ
$comment = $flat->addBlock('Общее');
$comment[0] = $flat->add('Адрес', 'address', 'string');

include(nga_config::i()->pathServer['nga'] . '/tables/city.php');
$comment[1] = $flat->add('Город', 'cityID', 'select');
$comment[1]->constructFromTable($city);

include(nga_config::i()->pathServer['nga'] . '/tables/region.php');
$inmsk = clone $region;
$inmsk->addWhere('moscow',1);




$comment[2] = $flat->add('Округ', 'district', 'select');
$comment[2]->addValues('Выберите значение','ЦАО','САО','ЗАО','ВАО','ЮАО','СВАО','СЗАО','ЮЗАО','ЮВАО');
require_once(nga_config::i()->pathServer['nga'] . '/tables/region.php');




$comment[3] = $flat->add('Район', 'regionID', 'search_multi_select');
$comment[3]->addValues('Не указано');
$comment[3]->constructFromTable($inmsk);
include(nga_config::i()->pathServer['nga'] . '/tables/subway_stations.php');
$comment[4] = $flat->add('Метро', 'stationID', 'select');
$comment[4]->addValues('Не указано');
$comment[4]->constructFromTable($subway_stations);

$comment[5] = $flat->add('Валюта', 'currency', 'select');
$comment[5]->setValueList(array(
        1 => 'Рубли',
        2 => '$',
        3 => 'Евро'
    ));

$comment[6] = $flat->add("Цена", "price", "num");
$comment[7] = $flat->add("Цена м2", "price_m", "num");
$comment[8] = $flat->add("Комната", "isroom", "checkbox");
$comment[9] = $flat->add("Комнат", "room", "num");
$comment[10] = $flat->add("Этаж", "floor", "num");
$comment[11] = $flat->add("Этажность", "floors", "num");
$comment[12] = $flat->add("Общая площадь квартиры (кв.м.)", "square", "num");
$comment[13] = $flat->add("Жилая площадь (кв.м.)", "square_live", "string");
$comment[14] = $flat->add("Площадь комнат", "square_rooms", "string");
$comment[15] = $flat->add("Площадь кухни", "square_kitchen", "string");
$comment[16] = $flat->add("Кол-во санузлов", "bath_count", "num");
$comment[17] = $flat->add("Состояние квартиры", "status", "string");
$comment[18] = $flat->add("Балкон/лоджия", "balcony", "checkbox");
$comment[19] = $flat->add("Вид из окна", "window", "string");
$comment[20] = $flat->add("Телефон", "phone", "checkbox");
$comment[21] = $flat->add("Тип дома","type","select");
$comment[21]->addValues("Выберите значение","Панель","Кирпич","Кирпич-монолит","Сталинский","иное");
$comment[22] = $flat->add("Лифт", "lift", "checkbox");
$comment[23] = $flat->add("Удаленность от метро", "metro_remoteness", "string");
$comment[24] = $flat->add("Банки(ипотека)", "banks", "textarea");
$comment[25] = $flat->add("Описание", "description", "editor");
$comment[26] = $flat->add("Название", "title", "string");



$flat_best = $flat->addBlock('Лучшее предложение');
$flat_best[0] = $flat->add('Лучшее предложение','best', 'checkbox');

$coordinates = $flat->addBlock('Координаты');
$coordinates[0] = $flat->add('Широта', 'latitude', 'string');
$coordinates[1] = $flat->add('Долгота', 'longitude', 'string');
$coordinates[2] = $flat->add('Москва', 'incity', 'checkbox');
//$comment[2] = $flat->add('Город', 'cityID', 'select_hidden');
//$comment[2]->constructFromTable($region);
$coordinates[3] = $flat->add('elite', 'elite', 'static');
$coordinates[3]->setValue(0);
$flat->addWhere('elite',0);


$flat->preInsert = 1;
$images = $flat->addBlock('ФОТОГРАФИИ');
$images[0] = $flat->add('Основное фото', 'gallery', 'multiphoto');
$images[0]->table = 'photo';
$images[0]->fk_field = 'R_ID';
$images[0]->fk_type = 3;
if(isset($_GET['id'])){
    $images[0]->fk_value = (int)$_GET['id'];
}


$flat_elite_check = $flat->addBlock('Отображать в элитной');
$flat_elite_check[0] = $flat->add('Отображать в элитной', 'elite_check', 'checkbox');


$flat->addOrderBy('flatID', 'DESC');


$flat->setListShow($comment[0], $comment[1],
 $comment[4], $comment[5],$comment[6],$comment[7],$comment[8] //,$contacts[3],$contacts[4]
    );
$flat->setFormNoShow($flat_ID);
$flat->setSearchForm(
//РАСПОЛОЖЕНИЕ и ПЛОЩАДЬ
$comment,
$comment[4],
$comment[5],
$comment[6],
$comment[7],
$comment[8],
$comment[9]  
);
?>