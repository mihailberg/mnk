<div id="searchResult" class="searchResult newflat">
    <?php
    if(!is_array($bestResult)){
        echo 'Нет объектов</div>';return;
    }?>

<?php

foreach($bestResult as $searchResult){


    $first = array_shift(array_values($searchResult));
    echo '
    <h2 class="plateH2">'.$first['section_title'].'</h2>
    <table>';
    //кол-во столбцов
    $columnCount = 2;
    //кол-во строк
    $rowCount = ceil(count($searchResult)/2);
    //Перебираем строки
    for($i=0;$i<$rowCount;$i++){
            echo '<tr>';
        //Перебираем столбцы
        for($j=0;$j<$columnCount;$j++){
            $gk = array_shift($searchResult);
            //Если нет элемента - выходим из цикла.
            if($gk===NULL){break;}
            //Если есть - рисуем плитку

            switch($gk['globalType']) {
                case 'flat': include 'app/views/patterns/flat.plate.php'; break;
                case 'land': include 'app/views/patterns/land.plate.php'; break;
                case 'newflat': include 'app/views/patterns/newflat.plate.php'; break;
                case 'invest': include 'app/views/patterns/invest.plate.php'; break;
                case 'commercial': include 'app/views/patterns/commercial.plate.php'; break;
                case 'foreign': include 'app/views/patterns/foreign.plate.php'; break;
                default: break;
            }

            if($gk['globalType'] == 'elite') {
                if($gk['eliteType'] == 'newflat'){
                    include 'app/views/patterns/newflat.plate.php';
                } elseif($gk['eliteType'] == 'flat'){
                    include 'app/views/patterns/flat.plate.php';
                } else {    //land
                    include 'app/views/patterns/land.plate.php';
                }
            }
            if($j == 0) echo "<td width='10'></td>";
        }

            echo '</tr><tr height="10"></tr>';
    }
    echo '</table>';
}
?>

</div>