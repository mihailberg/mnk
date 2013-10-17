<?php
$title = '';
$title .= (isset($country[$gk['countryID']]['title']))? $country[$gk['countryID']]['title'] . " ":'';
$title .= (isset($city[$gk['cityID']]['title']))? $city[$gk['cityID']]['title'] :"";
/*
if(!empty($gk['type'])&&isset($foreignType[$gk['type']])){
    $title .= $foreignType[$gk['type']];
}
*/

echo "
        <td class='results_item foreign'>
            <a href='/zarubezhnaja-nedvizhimost/foreign/" . $gk['tid'] . "'>
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
                        <li><strong>" . $foreignType[$gk['type']] . "</strong></li>
                        <li><strong>Цена:</strong>&nbsp;" . number_format($gk['price'], 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$gk['currency']] . "</span></li>";

                        if(isset($country[$gk['countryID']]['title'])||isset($city[$gk['cityID']]['title']))
                            echo "<li><strong>Местонахождение:</strong>&nbsp;" . ((isset($country[$gk['countryID']]['title']))? $country[$gk['countryID']]['title'] :'' . "") . "  ". ((isset($city[$gk['cityID']]['title']))? $city[$gk['cityID']]['title'] :"") . "</li>";

                        if(!empty($gk['square_land'])){
                            echo "<li><strong>Площадь участка:</strong>&nbsp;" . $gk['square_land'] . " соток</li>";
                        }

if (1 == $gk['type'] || 2 == $gk['type'] || 4 == $gk['type'] || 5 == $gk['type'] || 6 == $gk['type']){
    if(!empty($gk['square'])) echo "<li><strong>Площадь:</strong>&nbsp;" . $gk['square'] . " м<sup>2</sup></li>";
    if(!empty($gk['object_view'])) echo "<li><strong>Вид объекта:</strong>&nbsp;" . $foreignObject[$gk['object_view']] . "</li>";
    if(!empty($gk['live_count'])) echo "<li><strong>Количество спален:</strong>&nbsp;" . $gk['live_count'] . "</li>";
}
echo            "</ul>
                </div>
                <div class='cb'></div>
							</a>
            </td>";
?>