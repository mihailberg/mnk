<?php

if (isset($gk['eliteType'])) {
    $class = "elite" . $gk['eliteType'];
} else $class = 'flat';

$title = $gk['title'];

if(empty($title)){
    $title = $gk['address'];
}
/*if(!empty($foreignType[$gk['type']])){
    $title .= " ".$foreignType[$gk['type']];
}
*/
if (!empty($metro[$gk['stationID']]['name'])) {
    $title .= " м." . $metro[$gk['stationID']]['name'];
}

echo "
<td class='results_item " . $class . "'>";

if(isset($gk['elite'])&&$gk['elite'] == 1||$class!='flat'){
    echo "
        <a href='/elitnaja-nedvizhimost/flat/" . $gk['tid'] . "'>";
} else {
    echo "
        <a href='/gorodskaja-nedvizhimost/flat/" . $gk['tid'] . "'>";
}
echo "
        <div class='img_s'>";
if (!empty($gk['THUMB'])) {
    echo "<img src='" . $gk['THUMB'] . "' alt='" . $title . "' />";
} else {
    echo '<img data-src="holder.js/158x158/text:' . $title . '" alt="' . $title . '">';
}
echo "
    </div>

    <div class='resultItemInfo'>
        <div class='objId'>id&nbsp;" . $gk['tid'] . "</div>
        <h3 class='widthLimit'>" . $gk['title'] . "</h3>";
echo "
        <ul>
            <li><strong>Адрес:</strong>&nbsp;" . $gk['address'] . "</li>";

if (isset($gk['stationID']) && (int)$gk['stationID'] > 0 && isset($metro[$gk['stationID']]['name']))
    echo "<li><strong>Метро:</strong> «" . $metro[$gk['stationID']]['name'] . "»</li>";



      echo "<li><strong>Стоимость 1м<sup>2</sup>:</strong>&nbsp;" . number_format($gk['price_m'], 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$gk['currency']] . "</span></li>";
      echo "<li><strong>Стоимость:</strong>&nbsp;" . number_format($gk['price'], 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$gk['currency']] . "</span></li>";

echo "            <li><strong>Площадь:</strong>&nbsp;" . $gk['square'] . "&nbsp;м<sup>2</sup></li>
            " . (!empty($gk['banks']) ? "<li><strong>Ипотека:</strong>&nbsp;" . $gk['banks'] . "</li>" : "") . "

        </ul>
    </div>
    <div class='cb'></div>
</a></td>";