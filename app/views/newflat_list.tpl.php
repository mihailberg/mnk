<div id="searchResult" class="searchResult newflat">
    <?php
    if (!is_array($searchResult)) {
        echo 'Свободных квартир нет</div>';
        return;
    }?>
    <table class="searchResult newflat_table">
        <tr class="caption">
            <td>id</td>
            <td>Корпус</td>
            <td>Секция</td>
            <td>Комнат</td>
            <td>Площадь&nbsp;(м<sup>2</sup>)</td>
            <td>Этаж</td>
            <td>Стоимость&nbsp;1м<sup>2</sup>(<?php echo $currencyList[$currency];?>)</td>
            <td>Стоимость&nbsp;(<?php echo $currencyList[$currency];?>)</td>
            <td>Планировка</td>
        </tr>
        <?php foreach ($searchResult as $gk) { ?>
        <tr class="">
            <td class="objId"><?php echo $gk['tid'];?></td>
            <td><?php echo $gk['korpus'];?></td>
            <td><?php echo $gk['section'];?></td>
            <td><?php echo $gk['room'];?></td>
            <td><?php echo $gk['square'];?></td>
            <td><?php echo $gk['floor'];?></td>
            <td class="priceColumn"><?php echo number_format($gk['rub_price_m'] / $currencyValue, 0, '.', ' ') . "&nbsp;";?></td>
            <td class="priceColumn"><?php echo number_format($gk['rub_price'] / $currencyValue, 0, '.', ' ') . "&nbsp;";?></td>
                <?php               if (!empty($gk['plan_img'])) { ?>
            <td class="planningIco" style="text-align: center;"><a class="fancybox" href="<?php echo $gk['plan_img'];?>"><img src="/img/plan_ico.png" height="18" /></a></td>
                <?php } else { ?>
            <td style="text-align: center;">
                <a href="/novostrojki/gk/<?php echo $gk['newflat_gkID'];?>/planirovki/korpus/<?php echo $gk['korpus'];?>/section/<?php echo $gk['section'];?>"><img src="/img/plan_ico.png" height="18" /></a>
            </td>
                <?php } ?>
        </tr>
        <?php } ?>
    </table>
</div>