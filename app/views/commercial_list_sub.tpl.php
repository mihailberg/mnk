<?php
/**
 *
 * Price From session
 *
 */
?><div id="searchResult" class="searchResult newflat">
    <?php
    if (!is_array($searchResult)) {
        echo 'Свободных помещений нет</div>';
        return;

    }
    $gk=current($searchResult);?>

    <table class="searchResult newflat_table">
        <tr class = "caption" style="border: 1px solid #dbdcdd;">
            <td width="1%">&nbsp;</td>
            <td width="1%">ID</td>
            <td>Площадь</td>
            <td><?php echo ($gk['rent']==1)?'Арендная ставка за 1м<sup>2</sup> в год': 'Стоимость 1 м<sup>2</sup> ';?> (<?php echo $currencyList[$currency];?>)</td>
            <td><?php echo ($gk['rent']==1)?'Ежемесячная арендная ставка': 'Стоимость';?> (<?php echo $currencyList[$currency];?>)</td>
            <td>Назначение</td>
            <td width="1%">Планировка</td>
        </tr>
        <?php foreach ($searchResult as $gk) { ?>
        <tr class="results_item commercial2">
            <td class="noPhoto"><?php if ($gk['THUMB']) {
                echo "<img src='/img/photo.png'>";
            } else {
                echo "&nbsp;";
            }?></td>
            <td class="noPhoto">#&nbsp;<?php echo $gk['tid'];?></td>
            <td class="noPhoto"><?php echo $gk['square'];?></td>
            <td class="noPhoto"><?php echo number_format($gk['rub_price_m'] / $currencyValue, 0, '.', ' ');?></td>
            <td class="noPhoto"><?php echo number_format($gk['rub_price'] / $currencyValue, 0, '.', ' ');?></td>
            <td class="noPhoto"><?php if(!empty($gk['assignArray'][0])) echo implode(', ',$gk['assignArray']);?></td>
            <td style="text-align: center;"><?php if ($gk['planing']) {
                echo '<a class="fancybox" rel="mainPhoto" href="' . $gk['planing'] . '" style="z-index:100;");"><img src="/img/photo.png" onclick = "return false;" /></a>';
            } else {
                echo "&nbsp;";
            }?></td>
        </tr>
        <?php } ?>
    </table>
</div>