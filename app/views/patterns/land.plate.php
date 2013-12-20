<?php
/**
 *
 * Price From session
 * $gk['type'] array
 *
 */

//print_r($gk);
$title = $gk['title'];
//MicroHack
if($gk['square_house'] == '0.00') $gk['square_house'] = '';
$gk['price'] = $gk['price']*$this->exchange[$gk['currency']] / $currencyValue;


//Пустой титл
if(empty($title)){
    if (!empty($land['typeArray'])){
        reset($land['typeArray']);
        $title .= current($land['typeArray']);
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
    echo "<img src='" . $gk['THUMB'] . "' alt='" . $title . "' />";
} else {
    echo '<img data-src="holder.js/158x158/text:' . $title . '" alt="' . $title . '">';
}
echo "
            </div>
            <div class='resultItemInfo'>
                <div class='objId'>id&nbsp;" . $gk['tid'] . "</div>
                    <ul>";

                    if(!empty($title)){
                        echo"<li><h3 class='widthLimit'>".$title."</h3></li>";
                    }
                        echo "<li><strong>Стоимость:</strong>&nbsp;" . number_format($gk['price'], 0, '.', ' ') . " " . $currencyList[$currency] . "</li>";

                        echo isset($highway[$gk['highwayID']]['title']) ? "<li><strong>Шоссе:</strong>&nbsp;" . $highway[$gk['highwayID']]['title'] . "</li>" : "";

                        echo isset($region[$gk['regionID']]['title']) ? "<li><strong>Район:</strong>&nbsp;" . $region[$gk['regionID']]['title'] . "</li>" : '';

                    if(!empty($gk['settlement'])) echo "<li><strong>Населеный пункт:</strong>&nbsp;" . $gk['settlement'] . "</li>";

                    if (is_array($gk['type']) && !in_array(2,$gk['type']) && ! empty($gk['train_way']) && isset($train_wayTypes[$gk['train_way']])) {
                        echo "<li><strong>ЖД направление:</strong>&nbsp;" . $train_wayTypes[$gk['train_way']] . "</li>";
                    }
                    if (is_array($gk['type']) &&  (in_array(1,$gk['type']) || in_array(3,$gk['type']) ) && !empty($gk['square_house'])) {
                        echo "<li><strong>Площадь дома:</strong>&nbsp;" . $gk['square_house'] . " м<sup>2</sup></li>";
                    }
                    if (is_array($gk['type']) &&  in_array(4,$gk['type']) && ! empty($gk['square_house'])) {
                        echo "<li><strong>Площадь таунхауса:</strong>&nbsp;" . $gk['square_house'] . " м<sup>2</sup></li>";
                    }

                    if (!empty($gk['square_land'])) echo "<li><strong>Площадь участка:</strong>&nbsp;" . $gk['square_land'] . " соток</li>";
echo "</ul>
            </div>
            <div class='cb'></div>
					</a>
        </td>";
?>