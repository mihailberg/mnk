<?php

if (isset($gk['eliteType'])) {
    $class = "elite" . $gk['eliteType'];
} else $class = 'newflat';

$title = $gk['address'];

echo "
    <td class='results_item " . $class . "'>";
if (isset($gk['elite'])&&$gk['elite'] == 1){
    echo "  <a href='/elitnaja-nedvizhimost/gk/" . $gk['tid'] . "'>";
} else {
    echo "  <a href='/novostrojki/gk/" . $gk['tid'] . "'>";
}

echo "
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
            <h3 class='widthLimit'>" . $gk['title'];
if (isset($gk['stationID']) && (int)$gk['stationID'] > 0 && isset($metro[$gk['stationID']]['name'])) echo "&nbsp;<small>(<span> м.&nbsp;«" . $metro[$gk['stationID']]['name'] . "»</span>)</small>";
echo "</h3>
            <ul>
                ";?>

<?php if(!empty($city[$gk['cityID']]['title'])):?><li><strong>Город:</strong>&nbsp;<?php echo $city[$gk['cityID']]['title'];?></li><?php endif;?><?php
                echo "<li><strong>Адрес:</strong>&nbsp;" . $gk['address'] . "</li>";
                if(isset($currencyList[$gk['currency']])){
                    echo "<li><strong>Стоимость 1м<sup>2</sup> от:</strong>&nbsp;" . number_format($gk['price_m'], 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$gk['currency']] . "</span></li>";
                    echo "<li><strong>Стоимость от:</strong>&nbsp;" . number_format($gk['price'], 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$gk['currency']] . "</span></li>";
                }
                if($gk['square']){
                    echo "<li><strong>Площадь от:</strong>&nbsp;" . $gk['square'] . "&nbsp;м<sup>2</sup></li>";
                }
                echo    (!empty($gk['banks']) ? "<li><strong>Ипотека:</strong>&nbsp;" . nl2br($gk['banks']) . "</li>" : "") . "
            </ul>
        </div>
        <div class='cb'></div>
			</a>
    </td>";
