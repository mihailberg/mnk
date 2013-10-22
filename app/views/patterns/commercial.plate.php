<?php
/**
 *
 * Price From session
 *
 */
?><?php
$title = $gk['title'];

echo "  <td class='results_item commercial'><a href='/kommercheskaja-nedvizhimost/commercial/" . $gk['tid'] . "'>
        <div class='img_s'>";
if (!empty($gk['THUMB'])) {
    echo "<img src='" . $gk['THUMB'] . "' alt='" . $title . "' width='158' />";
} else {
    echo '<img data-src="holder.js/158x158/text:' . $title . '" alt="' . $title . '">';
}
echo "
        </div>
        <div class='resultItemInfo'>
            <div class='objId'>id&nbsp;" . $gk['tid'] . "</div>
            <ul>";

                if(!empty($title)) echo"<li><h3 class='widthLimit'>".$title."</h3></li>";
                if(!empty($gk['address'])) echo"<li class='widthLimit'><strong>Адрес:</strong>&nbsp;" . $gk['address'] . "</li>";

if (isset($gk['stationID']) && (int)$gk['stationID'] > 0 && isset($metro[$gk['stationID']]['name']))
    echo "<li><strong>Метро:</strong>&nbsp;" . $metro[$gk['stationID']]['name'] . "</li>";

if (!empty($gk['price_m'])) {
    echo "<li>";

    if($gk['rent']){
        echo "<strong>Арендная ставка за 1м<sup>2</sup> в год:</strong>&nbsp;" . number_format($gk['rub_price_m'] / $currencyValue, 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$currency] . "</span>";
    } else {
        echo "<strong>Стоимость за 1м<sup>2</sup>:</strong>&nbsp;" . number_format($gk['rub_price_m'] / $currencyValue, 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$currency] . "</span>";
    }

    echo "</li>";
}


if (!empty($gk['price'])) {
    echo "<li>";

    if($gk['rent']){
        echo "<strong>Ежемесячная арендная ставка: </strong>" . number_format($gk['rub_price'] / $currencyValue, 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$currency] . "</span>";
    } else {
        echo "<strong>Стоимость:</strong>" . number_format($gk['rub_price'] / $currencyValue, 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$currency] . "</span>";
    }

    echo "</li>";
}

if(!empty($gk['square']))  echo "
    <li>
         <strong>Площадь:</strong>&nbsp;" . $gk['square'] . "&nbsp;м<sup>2</sup>
    </li>";
echo "
</ul>
        </div>
        <div class='cb'></div>
    </a></td>";