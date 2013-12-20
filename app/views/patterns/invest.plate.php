<?php


$title = '';

if (!empty($gk['type'])) {
    $title .= "" . $investType[$gk['type']];
}
if (!empty($gk['highwayID'])) {
    if ($title != '') $title .= ", ";
    $title .= $highway[$gk['highwayID']]['title'] . ' шоссе';
}

echo "
        <td class='results_item invest'>
					<a href='/proekty-dlja-investirovanija/invest/" . $gk['tid'] . "'>
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
                    <ul>
                        <li><strong>" . $investType[$gk['type']] . "</strong></li>
                        <li><strong>Шоссе:</strong>&nbsp;" . $highway[$gk['highwayID']]['title'] . "</li>
                        " . (isset($region[$gk['regionID']]) ? "<li><strong>Район:</strong>&nbsp;" . $region[$gk['regionID']]['title'] . "</li>" : '') . "
                        <li><strong>Растояние от МКАД:</strong>&nbsp;" . $gk['mkad_remoteness'] . "</li>
                        <li><strong>Категория земли:</strong>&nbsp;" . $gk['land_category'] . "</li>
                        <li><strong>Вид разрешенного использования:</strong>&nbsp;" . $gk['use_type'] . "</li>
                        <li><strong>Площадь участка Га:</strong>&nbsp;" . $gk['square'] . "</li>
                        <li><strong>Наличие здайния/строений на участке:</strong>&nbsp;" . $gk['buildings'] . "</li>
                        <li><strong>Вид права:</strong>&nbsp;" . $gk['rights_type'] . "</li>
                        <li><strong>Стоимость:</strong>&nbsp;" . $gk['price'] . "</li>
                    </ul>
            </div>
            <div class='cb'></div>
					</a>
        </td>";?>