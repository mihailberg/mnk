<?php
$commercial = new nga_table('commercial', 'Коммерческая');
$commercialID = $commercial->addID('ID', 'commercialID', 'num');

//ПРИМЕЧАНИЕ
$commercial_block = $commercial->addBlock('Общее');

include(nga_config::i()->pathServer['nga'] . '/tables/city.php');
$commercial_block[0] = $commercial->add('Город', 'cityID', 'select');
$commercial_block[0]->constructFromTable($city);
$commercial_block[1] = $commercial->add('Адрес', 'address', 'textarea');
$commercial_block[2] = $commercial->add('Метро', 'stationID', 'select');
include(nga_config::i()->pathServer['nga'] . '/tables/subway_stations.php');
$commercial_block[2]->constructFromTable($subway_stations);
$commercial_block[3] = $commercial->add('Объект', 'title', 'string');
//PARENT
$parent = clone $commercial;

$parent->addWhere('parent', 0);
$parent->addWhere('type', '(1,2,3,4)', 'IN');
//m-s 'Бизнес-центр (строящийся)',
//m-s 'Бизнес-центр (готовый)',
//m-s 'Здание',
//m-s 'Жилой дом (строящийся)',
$commercial_block[4] = $commercial->add('Назначение', 'assign', 'select');
$commercial_block[4]->addValues(
    'не указано',
    'Офис',
    'Помещение свободного назначения',
    'Торговые помещения',
    'Помещения под ресторан/кафе',
    'Помещения под банк',
    'Помещения под мед.центры',
    'Помещения под салон красоты',
    'Помещения под бытовые услуги',
    'Склад',
    'Производство',
    'Автосервис',
    'иное');

if(!empty($_GET['gid'])){
    $commercial_block[25] = $commercial->add('Общий объект', 'parent', 'static');
    $commercial_block[25]->setValue((int)$_GET['gid']);
    $commercial_block[25]->FormShow = false;
} else {
    $commercial_block[25] = $commercial->add('Общий объект', 'parent', 'select');
    $commercial_block[25]->addValues('не выбран');
    $commercial_block[25]->constructFromTable($parent);
}
$commercial_block[5] = $commercial->add('Тип объекта', 'type', 'select');
$commercial_block[5]->addValues(
    'не указан',
    'Бизнес-центр (строящийся)',
    'Бизнес-центр (готовый)',
    'Здание',
    'Новостройка',
    'Жилой дом',
    'Особняк',
    'Капитальное строение',
    'Ангар',
    'Земельный участок',
    'иное'
);
//$commercial_block[0] = $commercial->add('Округ', 'district', 'select');
$commercial_block[6] = $commercial->add('Площадь', 'square', 'string');
//$commercial_block[3] = $commercial->add('Площадь от', 'square', 'string');//if multi
$commercial_block[7] = $commercial->add('Тип сделки', 'rent', 'select');
$commercial_block[7]->addValues(
    'продажа',
    'аренда'
);
//тип сделки
$commercial_block[8] = $commercial->add('Цена(при аренде цена/месяц)', 'price', 'string');
$commercial_block[9] = $commercial->add('Цена за м<sup>2</sup> (при аренде за м<sup>2</sup>/год)', 'price_m', 'string');
$commercial_block[10] = $commercial->add('Этаж', 'floor', 'num');
$commercial_block[11] = $commercial->add('Этажность', 'floors', 'num');
$commercial_block[12] = $commercial->add('Состояние отделки', 'otdelka', 'string');
$commercial_block[13] = $commercial->add('Безопасность', 'security', 'string');
$commercial_block[14] = $commercial->add('Мебель', 'furniture', 'string');
$commercial_block[15] = $commercial->add('Провайдер', 'provider', 'string');
$commercial_block[16] = $commercial->add('Телекоммуникации', 'tele', 'string');
$commercial_block[17] = $commercial->add('Кондиционирование', 'conditioning', 'string');
//$commercial_block[] = $commercial->add('Телекоммуникации', '', 'string');
$commercial_block[18] = $commercial->add('Планировка', 'planing', 'image');
$commercial_block[19] = $commercial->add('Парковка', 'parking', 'string');
$commercial_block[20] = $commercial->add('Класс', 'class', 'string');
$commercial_block[21] = $commercial->add('Общая площадь м<sup>2</sup>', 'square_full', 'string');
$commercial_block[22] = $commercial->add('Перекрытия', 'overlap', 'string');
$commercial_block[23] = $commercial->add('Описание места нахождения Объекта', 'desc_place', 'editor');
$commercial_block[24] = $commercial->add('Описание ЖК/БЦ', 'desc_bc', 'editor');
$commercial_block[26] = $commercial->add('Округ', 'district', 'select');
$commercial_block[26]->addValues('Выберите значение', 'ЦАО', 'САО', 'ЗАО', 'ВАО', 'ЮАО', 'СВАО', 'СЗАО', 'ЮЗАО', 'ЮВАО');

$commercial_block[27] = $commercial->add('Электричество', 'kwt', 'string');

if(isset($_GET['id'])){
    $commercial_block_subtable = $commercial->addBlock('Свободные помещения');
    $commercial_block_subtable[0] = $commercial->add('Свободные помещения', 'free_flats', 'subtable');


    //require_once(nga_config::i()->pathServer['nga'] . '/tables/newflat.php');
    $commercial_block_subtable[0]->table = 'commercial';
    $commercial_block_subtable[0]->fk_field = 'parent';
    $commercial_block_subtable[0]->fk_value = $_GET['id'];
}
if(!empty($_GET['gid'])){
    $commercial->addWhere('parent',(int)$_GET['gid']);
}

$commercial_block_best = $commercial->addBlock('Лучшее предложение');
$commercial_block_best[0] = $commercial->add('Лучшее предложение', 'best', 'checkbox');


$commercial_block_bc = $commercial->addBlock('Коммерческие условия (Аренда)');
$commercial_block_bc[0] = $commercial->add('Налогообложение', 'nds', 'select');
$commercial_block_bc[0]->addValues(
    'не указано',
    'НДС включен',
    'НДС не включен'
);
$commercial_block_bc[1] = $commercial->add('Эксплуатационные расходы', 'operating_costs', 'select');
$commercial_block_bc[1]->addValues(
    'не указаны',
    'Включены',
    'Не включены'
);
$commercial_block_bc[2] = $commercial->add('Коммунальные платежи', 'utility_payments', 'select');
$commercial_block_bc[2]->addValues(
    'не указаны',
    'включены',
    'не включены'
);
$commercial_block_bc[3] = $commercial->add('Договор аренды', 'rent_contract', 'select');
$commercial_block_bc[3]->addValues(
    'не указано',
    'прямой',
    'субаренда'
);
$commercial_block_bc[4] = $commercial->add('Срок аренды от (мес)', 'lease', 'select');
$commercial_block_bc[4]->addValues(
    'не указано',
    1,
    '3',
    '6',
    '9', 12, 18, 24
);
$commercial_block_bc[5] = $commercial->add('Электричество', 'electricity', 'select');
$commercial_block_bc[5]->addValues(
    'не указано',
    'входит в стоимость',
    'оплачивается отдельно'
);
$commercial_block_bc[6] = $commercial->add('Связь', 'communication', 'select');
$commercial_block_bc[6]->addValues(
    'не указано',
    'входит в стоимость',
    'оплачивается отдельно'
);



$commercial_coordinates = $commercial->addBlock('Координаты');
$commercial_coordinates[0] = $commercial->add('Широта', 'latitude', 'string');
$commercial_coordinates[1] = $commercial->add('Долгота', 'longitude', 'string');

$commercial->preInsert = 1;
$images = $commercial->addBlock('ФОТОГРАФИИ');
$images[0] = $commercial->add('Основное фото', 'gallery', 'multiphoto');
$images[0]->table = 'photo';
$images[0]->fk_field = 'R_ID';
$images[0]->fk_type = 4;
if (isset($_GET['id'])) {
    $images[0]->fk_value = (int)$_GET['id'];
}


$commercial->addOrderBy('parent', 'ASC');
$commercial->addOrderBy('commercialID', 'DESC');
$commercial->groupField =  'parent';
$commercial->setListShow($commercial_block[3], $commercial_block[25], $commercial_block[0], $commercial_block[1],
    $commercial_block[4], $commercial_block[5], $commercial_block[6]
);
?>