<h2><?php echo $flatData['address'];?></h2>
<?php
if (!empty($flatData['district']) && isset($districts[$flatData['district']])) {
    echo '<span>Округ:</span> ' . $districts[$flatData['district']] . '<br />';
}

if (!empty($flatData['stationID']) && isset($metro[$flatData['stationID']]) && $flatData['cityID']==1) {
    echo '<span>Метро:</span> «' . $metro[$flatData['stationID']]['name'] . '»<br />';
}
?>

<?php if($flatData['cityID']!=1){?>
    <?php if (!empty($flatData['cityID'])&&isset($city[$flatData['cityID']])):?><span>Город:&nbsp;</span><?php echo  $city[$flatData['cityID']]['title'];?><br /><?php endif;?>

    <?php if (!empty($flatData['regionID'])):                                ?><span>Район:&nbsp;</span><?php echo $flatData['regionID']; ?><br><?php endif;?>


    <?php if (isset($flatData['highwayID']) && isset($highway[$flatData['highwayID']])) {  echo '<span>Направление:&nbsp;</span>' . $highway[$flatData['highwayID']]['title'] . '<br>';}?>




<?php } else {?>
<!--    --><?php //if (!empty($flatData['cityID']) && isset($city[$flatData['cityID']])): ?><!--  <span>Город:&nbsp;</span>--><?php //echo  $city[$flatData['cityID']]['title'];?><!--<br />--><?php //endif;?>
    <?php if (!empty($flatData['regionID'])):                                    ?><span>Район:&nbsp;</span><?php echo $flatData['regionID']; ?><br><?php endif;?>

<?php }?>

<!--<span>Адрес:&nbsp;</span>--><?php //echo $flatData['address']; ?><!--<br>-->



<?php
if (!empty($flatData['price'])) {
    echo '<span>Стоимость:&nbsp;</span>';
    if(empty($flatData['currency'])) $flatData['currency'] = 1;

    echo number_format($flatData['price'], 0, '.', ' ') . ' ' . $currencyList[$flatData['currency']];
    echo '<br>';
}

if (!empty($flatData['type'])&&isset($house_types[$flatData['type']])):
    ?><span>Тип дома:&nbsp;</span><?php echo $house_types[$flatData['type']]; ?><br /><?php
endif;

if ($flatData['room'] > 0){
    echo '<span>Количество комнат:&nbsp;</span>'.$flatData['room'].'<br />';
}
//var_dump((bool)$flatData['isroom']);
if($flatData['isroom']) {
    echo '<span>Комната</span><br />';
}
?>
<?php if (!empty($flatData['floor'])):                                              ?><span>Этаж<?php if(!empty($flatData['floors'])&&$flatData['floors']!="0") echo '/Этажность';?>:&nbsp;</span><?php echo  $flatData['floor']; echo ((!empty($flatData['floors'])&&$flatData['floors']!="0") ? "/" . $flatData['floors']:''); ?><br><?php endif;?>
<?php if (!empty($flatData['square'])&&$flatData['square']!='0.0'):                 ?><span>Общая площадь:&nbsp;</span><?php echo $flatData['square']; ?> м<sup>2</sup><br><?php endif;?>
<?php if (!empty($flatData['square_live'])&&$flatData['square_live']!='0.0'):       ?><span>Жилая площадь:&nbsp;</span><?php echo $flatData['square_live']; ?> м<sup>2</sup><br><?php endif;?>
<?php if (!empty($flatData['square_rooms'])&&$flatData['square_rooms']!='0.0'):     ?><span>Площадь комнат:&nbsp;</span><?php echo $flatData['square_rooms']; ?> м<sup>2</sup><br><?php endif;?>
<?php if (!empty($flatData['square_kitchen'])&&$flatData['square_kitchen']!='0.0'): ?><span>Площадь кухни:&nbsp;</span><?php echo $flatData['square_kitchen']; ?> м<sup>2</sup><br><?php endif;?>
<?php if (!empty($flatData['bath_count'])):                                         ?><span>Кол-во санузлов:&nbsp;</span><?php echo $flatData['bath_count']; ?><br><?php endif;?>
<span>Балкон/лоджия:&nbsp;</span><?php echo ($flatData['balcony']==1)?'есть':'нет'; ?><br />
<?php if (!empty($flatData['window'])): ?><span>Вид из окна:&nbsp;</span><?php echo $flatData['window']; ?><br><?php endif;?>
<?php if (!empty($flatData['phone'])): ?><span>Телефон<br><?php endif;?>
<!--<span>Лифт:&nbsp;</span>--><?php //echo ($flatData['lift']==1)?'есть':'нет'; ?><!--<br>-->
<?php if (!empty($flatData['metro_remoteness'])): ?><span>Удаленность от метро:&nbsp;</span><?php echo $flatData['metro_remoteness']; ?><br><?php endif;?>
<?php //if (!empty($flatData['status'])): ?><!--<span>Состояние квартиры:&nbsp;</span>--><?php //echo $flatData['status']; ?><!----><?php //endif;?>