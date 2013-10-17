<?php

$title = '';
$title = $gk['title'];

if(empty($title)){
    if (isset($landTypes[$gk['type']])) {
        $title .= $landTypes[$gk['type']];
    }
    if (!empty($gk['settlement'])) {
        if ($title != '') $title .= " в ";
        $title .= $gk['settlement'];
    }
}

if (isset($gk['eliteType'])) {
    $class = "elite" . $gk['eliteType'];
} else $class = 'land';

echo "
    <td class='results_item " . $class . "'>";



if(
    (isset($gk['elite'])&&$gk['elite'] == 1 )||
    (isset($gk['elite_check'])&&$gk['elite_check'] == 1)
){
    echo "  <a href='/elitnaja-nedvizhimost/land/" . $gk['tid'] . "'>";
} else {
    echo "  <a href='/zagorodnaja-nedvizhimost/land/" . $gk['tid'] . "'>";
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
                    <ul>
                        " . (($gk['type'] != 0) ? "<li><strong style=\"font-weight:bold;\">" . $title . "</strong></li>" : '');

                    echo "<li><strong>Цена:</strong>&nbsp;" . number_format($gk['price'], 0, '.', ' ') . " " . $currencyList[$gk['currency']] . "</li>";
                    echo isset($highway[$gk['highwayID']]['title']) ? "<li><strong>Шоссе:</strong>&nbsp;" . $highway[$gk['highwayID']]['title'] . "</li>" : "";
                    echo isset($region[$gk['regionID']]['title']) ? "<li><strong>Район:</strong>&nbsp;" . $region[$gk['regionID']]['title'] . "</li>" : '';
                    echo "<li><strong>Населеный пункт:</strong>&nbsp;" . $gk['settlement'] . "</li>";
if ($gk['type'] != 2&&!empty($gk['train_way'])) {
    echo "<li><strong>ЖД направление:</strong>&nbsp;" . $train_wayTypes[$gk['train_way']] . "</li>";
}
if ($gk['type'] == 1 || $gk['type'] == 3) {
    echo "<li><strong>Площадь дома:</strong>&nbsp;" . $gk['square_house'] . " м<sup>2</sup></li>";
}
if ($gk['type'] == 4) {
    echo "<li><strong>Площадь таунхауса:</strong>&nbsp;" . $gk['square_house'] . " м<sup>2</sup></li>";
}
if (!empty($gk['square_land'])) echo "<li><strong>Площадь участка:</strong>&nbsp;" . $gk['square_land'] . " соток</li>";
echo "</ul>
            </div>
            <div class='cb'></div>
					</a>
        </td>";
?>