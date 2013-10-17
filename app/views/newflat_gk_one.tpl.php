<?php
$rim = array(0=>'0', 1=> 'I',2=> 'II',3=>'III',4=>'IV');?>
<div class="flat-info-box">
    <?php if(!empty($newFlat['title'])):?><span class="caption"><?php echo $newFlat['title'];?><br><?php endif;?></span>
    <?php if(!empty($city[$newFlat['cityID']]['title'])):?><span>Город: </span><?php echo $city[$newFlat['cityID']]['title'];?><br /><?php endif;?>

    <?php if(!empty($district[$newFlat['district']])):?>    <span>Округ:&nbsp;</span><?php echo $district[$newFlat['district']];?><br><?php endif;?>
    <?php if(!empty($metro[$newFlat['stationID']]['name'])):?>    <span>Метро:&nbsp;</span><?php echo $metro[$newFlat['stationID']]['name'];?><br><?php endif;?>
    <?php if(!empty($newFlat['address'])):?>    <span>Адрес:&nbsp;</span><?php echo $newFlat['address'];?><br><?php endif;?>


    <?php if(!empty($house_types[$newFlat['type']])):?>    <span>Тип дома:&nbsp;</span><?php echo $house_types[$newFlat['type']];?><br><?php endif;?>


    <?php if(!empty($newFlat['complete_year'])):?>
        <span>Срок сдачи:&nbsp;</span>
        <?php if(!empty($newFlat['kvartal'])):?>
            <?php echo $rim[$newFlat['kvartal']];?> квартал,
        <?php endif;?><?php echo $newFlat['complete_year'];?><br><?php endif;?>

<?php

if(isset($currencyList[$newFlat['currency']])){
     if(!empty($newFlat['price_m'])):?><span>Стоимость за 1м<sup>2</sup> от:&nbsp;</span><?php
        echo number_format($newFlat['price_m'], 0, '.', ' ') . "&nbsp;" . $currencyList[$gk['currency']];
    ?><br />
    <?php endif;?>

    <?php if(!empty($newFlat['price'])):?>    <span>Стоимость от:&nbsp;</span><?php
        echo number_format($newFlat['price'] , 0, '.', ' ') . "&nbsp;" . $currencyList[$gk['currency']];
    ?><br />
    <?php endif;?>
<?php } ?>

    <?php if(!empty($newFlat['square'])):?>    <span>Площадь от:&nbsp;</span><?php echo $newFlat['square'];?> м<sup>2</sup><br><?php endif;?>
    <?php if(!empty($newFlat['banks'])):?>    <span>Ипотека:&nbsp;</span><?php echo $newFlat['banks'];?><br><?php endif;?>



</div>