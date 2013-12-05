<?php
/**
 *
 * Price As is
 * $land['type'] array
 *
 */
?><?php if (!empty($land['typeArray'][0])){
    echo implode(', ',$land['typeArray']);echo '<br />';
} ?>

<?php if (!empty($city[$land['cityID']])): ?>
    <span>Населенный пункт:&nbsp;</span><?php echo $city[$land['cityID']]['title']; ?><br><?php endif; ?>
<?php if (!empty($region[$land['regionID']])): ?>
    <span>Район:&nbsp;</span><?php echo $region[$land['regionID']]['title']; ?><br><?php endif; ?>
<?php if (!empty($highway[$land['highwayID']])): ?>
    <span>Шоссе:&nbsp;</span><?php echo $highway[$land['highwayID']]['title']; ?><br><?php endif; ?>

<?php if (!empty($trainway[$land['train_way']])&&!empty($land['train_way'])): ?>
    <span>ЖД направление:&nbsp;</span><?php echo $trainway[$land['train_way']]; ?><br><?php endif; ?>

<?php if (!empty($land['mkad_remoteness'])): ?>  <span>Расстояние от МКАД:&nbsp;</span><?php echo $land['mkad_remoteness']; ?><br><?php endif; ?>

<?php if (!in_array(2,$land['type']) && !empty($land['square_house'])) echo "<span>Площадь дома:&nbsp;</span>" . $land['square_house'] . " м<sup>2</sup><br>"; ?>

<?php
if (!empty($land['square_land'])) echo "<span>Площадь участка:&nbsp;</span>" . $land['square_land'] . " соток<br>";

if (!empty($land['price'])) {

    echo '<span>Стоимость:&nbsp;</span>';
    echo number_format($land['price'], 0, '.', ' ') . "&nbsp;" . $currencyList[$land['currency']] . "<br />";
}





if (in_array(2, $land['type'])) {
//    echo '<span class="caption_span">Характеристики дома:</span>';
    if (!empty($land['floors'])) echo '    <span>Этажность/уровни:&nbsp;</span>' . $land['floors'] . '<br>';
    if (!empty($land['year'])) echo '    <span>Год постройки:&nbsp;</span>' . $land['year'] . '<br>';
    if (!empty($land['otdelka'])) echo '    <span>Состояние отделки:&nbsp;</span>' . $land['otdelka'] . '<br>';
    if (!empty($land['mebel'])) echo '    <span>Наличие мебели:&nbsp;</span> в наличии<br>';
    if (!empty($land['foundation'])) echo '    <span>Фундамент:&nbsp;</span>' . $land['foundation'] . '<br>';
    if (!empty($land['roof'])) echo '    <span>Крыша:&nbsp;</span>' . $land['roof'] . '<br>';
    if (!empty($land['ceilings'])) echo '    <span>Перекрытия:&nbsp;</span>' . $land['ceilings'] . '<br>';
    if (!empty($land['layout'])) echo '    <span>Планировка:&nbsp;</span>' . $land['layout'] . '<br>';
}
?>
<!--    <span class="caption_span">Описание участка:</span>-->
<?php if (!empty($land['form'])): ?>  <span>Форма участка:&nbsp;</span><?php echo $land['form']; ?><br><?php endif; ?>
<?php if (!empty($land['fence'])): ?>  <span>Ограждение&nbsp;</span><br><?php endif; ?>
<?php if (!empty($land['gate'])): ?>  <span>Ворота&nbsp;</span><br><?php endif; ?>
<?php if (!empty($land['landscape_design'])): ?>  <span>Ландашфтный дизайн</span><br><?php endif; ?>
<?php if (!empty($land['parking'])): ?>  <span>Стоянка для автомобилей</span><br><?php endif; ?>
<!--    <span class="caption_span">Коммуникации:</span>-->

<?php if (!empty($land['communication_electricity'])): ?>   <span>Электричество&nbsp;<img style="height:16px;" src="/img/land_icons/electro.jpg" /></span>&nbsp;<br /><?php endif; ?>
<?php if (!empty($land['communication_water'])): ?>         <span>Вода/канализация&nbsp;<img style="height:16px;" src="/img/land_icons/water.jpg" /></span><br /><?php endif; ?>
<?php if (!empty($land['gas'])): ?>                         <span>Газоснабжение&nbsp;<img style="height:16px;" src="/img/land_icons/gas.jpg" /></span><br /><?php endif; ?>
<?php if (!empty($land['heating'])): ?>                     <span>Отопление</span><br /><?php endif; ?>
<?php if (!empty($land['internet'])): ?>  <span>Интернет/ТВ</span><br /><?php endif; ?>
<?php if (!empty($land['phone'])): ?>  <span>Телефон</span><br /><?php endif; ?>

<!--    <span class="caption_span">Инфраструктура:</span>-->
<?php //if (!empty($land['ecology'])): ?><!--  <span>Экология:&nbsp;</span>--><?php //echo $land['ecology']; ?><!--<br>--><?php //endif; ?>
<?php //if (!empty($land['probka'])): ?><!--  <span>Наличие пробок:&nbsp;</span>--><?php //echo $land['probka']; ?>
<!--    <br>--><?php //endif; ?>
<?php //if (!empty($land['metro_access'])): ?>
<!--    <span>Как добраться до метро:&nbsp;</span>--><?php //echo $land['metro_access']; ?><!--<br>--><?php //endif; ?>
<?php //if (!empty($land['infrastructure'])): ?>
<!--    <span>Наличие магазинов, садов, школ:&nbsp;</span>--><?php //echo $land['infrastructure']; ?><!--<br>--><?php //endif; ?>