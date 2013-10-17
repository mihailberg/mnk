<h2><?php echo $flatData['address'];?>
    <?php
    //print_r($flatData);
    $echo = '';
    if (!empty($flatData['district']) && isset($districts[$flatData['district']])) {
        $echo = $districts[$flatData['district']];
    }

    if (!empty($flatData['stationID']) && isset($metro[$flatData['stationID']]) && $flatData['cityID']==1) {
        $echo .= ' м.&nbsp;«' . $metro[$flatData['stationID']]['name'] . '»';
    }

    if (!empty($echo)) echo '<span style="font-weight:normal;">( ' . $echo . ')</span>';
    ?></h2>

<?php if($flatData['cityID']!=1){?>
    <?php if (!empty($flatData['cityID'])&&isset($city[$flatData['cityID']])):?><span>Город:&nbsp;</span><?php echo  $city[$flatData['cityID']]['title'];?><br /><?php endif;?>

    <?php if (!empty($flatData['regionID'])):                                ?><span>Район:&nbsp;</span><?php echo $flatData['regionID']; ?><br><?php endif;?>


    <?php if (isset($flatData['highwayID']) && isset($highway[$flatData['highwayID']])) {  echo '<span>Направление:&nbsp;</span>' . $highway[$flatData['highwayID']]['title'] . '<br>';}?>




<?php } else {?>
<!--    --><?php //if (!empty($flatData['cityID']) && isset($city[$flatData['cityID']])): ?><!--  <span>Город:&nbsp;</span>--><?php //echo  $city[$flatData['cityID']]['title'];?><!--<br />--><?php //endif;?>
    <?php if (!empty($flatData['regionID'])):                                    ?><span>Район:&nbsp;</span><?php echo $flatData['regionID']; ?><br><?php endif;?>
    <?php if (!empty($flatData['stationID']) && isset($metro[$flatData['stationID']])):?> <span>Ближайшее метро:&nbsp;</span><?php echo  $metro[$flatData['stationID']]['name'];?><br /><?php endif;?>
<?php }?>

<!--<span>Адрес:&nbsp;</span>--><?php //echo $flatData['address']; ?><!--<br>-->



<?php
//
//if (!empty($flatData['price_m'])) {
//    echo '<span>Стоимость за 1м<sup>2</sup>:&nbsp;</span>';
//    if(!empty($flatData['currency'])){
//       //Forign & Eilte
//       echo number_format($flatData['price_m'], 0, '.', ' ') . ' ' . $currencyList[$flatData['currency']];
//    } else {
//       echo number_format($flatData['price_m'] / $currencyValue, 0, '.', ' ') . ' ' . $currencyList[$currency];
//    }
//    echo '<br>';
//}

if (!empty($flatData['price'])) {
    echo '<span>Стоимость:&nbsp;</span>';
    if(!empty($flatData['currency'])){
       //Forign & Eilte
       echo number_format($flatData['price'], 0, '.', ' ') . ' ' . $currencyList[$flatData['currency']];
    } else {
       echo number_format($flatData['price'] / $currencyValue, 0, '.', ' ') . ' ' . $currencyList[$currency];
    }
    echo '<br>';
}

 if (!empty($flatData['type'])): ?><span>Тип дома:&nbsp;</span><?php echo $house_types[$flatData['type']]; ?><br><?php endif;?>
<span>Количество комнат:&nbsp;</span><?php if ($flatData['room'] == 0) {
                echo 'комната';
            } else {
                echo $flatData['room'];
            };?><br />
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