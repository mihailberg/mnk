<h2><?php echo $commercialData['title']; ?></h2>

<?php if($commercialData['cityID']!=1){?>
    <?php if(!empty($cityid[$commercialData['cityID']])){?><span>Город:&nbsp;</span><?php echo $cityid[$commercialData['cityID']]; ?><br /><?php }?>
<?php } else {

    if (!empty($commercialData['district'])) {
        echo '<span>Округ: </span> ' . $commercialData['district'].'<br />';
    }

} ?>
<?php if(!empty($metro[$commercialData['stationID']]['name'])){?><span>Ближайшее метро:&nbsp;</span><?php echo $metro[$commercialData['stationID']]['name']; ?><br /><?php }?>
<?php if(!empty($commercialData['address'])){?><span>Адрес:&nbsp;</span><?php echo $commercialData['address']; ?><br /><?php }?>
<?php if(!empty($commercialData['assign'])){ ?><span>Назначение:</span>&nbsp; <?php echo $assign[$commercialData['assign']];?><br /><?php } ?>
<span>Тип сделки:&nbsp;</span><?php echo ($commercialData['rent']==0)?'продажа':'аренда'; ?><br />
<?php
if ($commercialData['rent']) {
    if(!empty($commercialData['price_m'])) echo "<span>Арендная ставка за 1м<sup>2</sup> в год:&nbsp;</span>" . number_format($commercialData['price_m'] / $currencyValue, 0, '.', ' ') . "&nbsp;" . $currencyList[$currency] . "<br />";
    if(!empty($commercialData['price'])) echo "<span>Ежемесячная арендная ставка:&nbsp;</span>" . number_format($commercialData['price'] / $currencyValue, 0, '.', ' ') . "&nbsp;" . $currencyList[$currency] . "<br />";
} else {

    if(!empty($commercialData['price'])) echo "<span>Стоимость:&nbsp;</span>" . number_format($commercialData['price'] / $currencyValue, 0, '.', ' ') . "&nbsp;" . $currencyList[$currency] . "<br />";
    if(!empty($commercialData['price_m'])) echo "<span>Стоимость за 1м<sup>2</sup>:&nbsp;</span>" . number_format($commercialData['price_m'] / $currencyValue, 0, '.', ' ') . "&nbsp;" . $currencyList[$currency] . "<br />";
}

if (!empty($commercialData['square'])&&$commercialData['square']!='0.0'):                 ?><span>Площадь:&nbsp;</span><?php echo $commercialData['square']; ?>м<sup>2</sup><br /><?php endif; ?>
<!--<span>Общее описание объекта</span><br />-->
<?php
if (!empty($commercialData['floor'])&&!empty($commercialData['floors'])){ ?>
    <span>Этаж/Этажность:&nbsp;</span><?php echo $commercialData['floor']."/".$commercialData['floors']; ?><br /><?php
}

if (empty($commercialData['floor'])&&!empty($commercialData['floors'])){ ?>
    <span>Этажность:&nbsp;</span><?php echo $commercialData['floors']; ?><br /><?php
}
//echo '<!--'.print_r($commercialData,1).'-->';
if (!empty($commercialData['kwt'])){ ?>
    <span>Электричество:&nbsp;</span><?php echo $commercialData['kwt']; ?> кВт<br /><?php
}



//if (!empty($commercialData['otdelka'])){ ?><!--<span>Состояние отделки:&nbsp;</span>--><?php //echo $commercialData['otdelka']; ?><!--<br />--><?php //} ?>
<?php if (!empty($commercialData['security'])){ ?><span>Безопасность:&nbsp;</span><?php echo $commercialData['security']; ?><br /><?php } ?>
<?php //if (!empty($commercialData['furniture'])){ ?><!--<span>Мебель:&nbsp;</span>--><?php //echo $commercialData['furniture']; ?><!--<br />--><?php //} ?>
<?php //if (!empty($commercialData['provider'])){ ?><!--<span>Провайдер:&nbsp;</span>--><?php //echo $commercialData['provider']; ?><!--<br />--><?php //} ?>
<?php if (!empty($commercialData['tele'])){ ?><span>Телекоммуникации:&nbsp;</span><?php echo $commercialData['tele']; ?><br /><?php } ?>
<?php if (!empty($commercialData['conditioning'])){ ?><span>Кондиционирование:&nbsp;</span><?php echo $commercialData['conditioning']; ?><br /><?php }
if (!empty($commercialData['planing']) && file_exists($_SERVER['DOCUMENT_ROOT'] . $commercialData['planing'])) {
    echo '<span>Планировка:</span>
<a class="fancybox" rel="otherRel" href="' . $commercialData['planing'] . '"><img src="/img/photo.png"></a><br />';
}
if (!empty($commercialData['parking'])){ echo "<span>Парковка:&nbsp;</span>".$commercialData['parking']."<br />";} ?>

<?php if ($commercialData['type'] == 1 || $commercialData['type'] == 2) { ?>
    <?php if (!empty($commercialData['square_full'])&&$commercialData['square_full']!='0.0'):                 ?><span>Общая площадь:&nbsp;</span><?php echo $commercialData['square_full']; ?>м<sup>2</sup><br /><?php endif; ?>
    <span>Класс объекта:&nbsp;</span><?php echo $commercialData['class']; ?><br />

<?php } ?>
<?php if(!empty($commercialData['rent'])) {?>
<!--    --><?php //if(
//
//    !empty($commercialData['nds'])||
//    !empty($commercialData['operating_costs'])||
//    !empty($commercialData['utility_payments'])||
//    !empty($commercialData['rent_contract'])||
//    !empty($commercialData['lease'])||
//    !empty($commercialData['electricity'])||
//    !empty($commercialData['communication'])
//
//    ){?><!--    <span class='caption_span'>Коммерческие условия</span>--><?php //} ?>
    <?php if (!empty($commercialData['nds'])){ echo "<span>Налогообложение:&nbsp;</span>" .                         $bc0[$commercialData['nds']] . "<br />";} ?>
<!--    --><?php //if (!empty($commercialData['operating_costs'])){ echo "<span>Эксплуатационные расходы:&nbsp;</span>" .    $bc1[$commercialData['operating_costs']] . "<br />";} ?>
    <?php if (!empty($commercialData['utility_payments'])){ echo "<span>Коммунальные платежи:&nbsp;</span>" .       $bc2[$commercialData['utility_payments']] . "<br />";} ?>
<!--    --><?php //if (!empty($commercialData['rent_contract'])){ echo "<span>Договор аренды:&nbsp;</span>" .                $bc3[$commercialData['rent_contract']] . "<br />";} ?>
<!--    --><?php //if (!empty($commercialData['lease'])){ echo "<span>Срок аренды:&nbsp;</span>" .                           $bc4[$commercialData['lease']] . "<br />";} ?>
<!--    --><?php //if (!empty($commercialData['electricity'])){ echo "<span>Электричество:&nbsp;</span>" .                   $bc5[$commercialData['electricity']] . "<br />";} ?>
<!--    --><?php //if (!empty($commercialData['communication'])){ echo "<span>Связь:&nbsp;</span>" .                         $bc6[$commercialData['communication']];} ?>
<?php  } ?>