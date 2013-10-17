<div id="searchResult" class="searchResult <?php echo $this->entityName;?>">
    <?php
    if (!is_array($searchResult)) {
        echo 'Нет объектов</div>';
        return;
    }?>

    <?php if (isset($rowCount)){


            $page = $this->page;

            $nav_block = '';


            $page_num = 1;
            if ($rowCount > $this->perPage) {
                echo ' <span class="found">Найдено: ' . $rowCount . '</span>';

                $page_num = floor($rowCount / $this->perPage);
                if (($rowCount % $this->perPage) != 0)
                    $page_num++;



                $start = 1;
                $end = 9;

                $current = $page;
                $start = (($current - 4) > 1) ? ($current - 4) : 1;
                $end = ($page_num < 10) ? $page_num : ($start + 9);


                $disabled = ($page == 1) ? ' class="disabled"' : '';
                $qs = (!empty($_SERVER['QUERY_STRING'])) ? '?'.$_SERVER['QUERY_STRING']:'';


                $url = '/'.$this->fullUrl[0].'/'.mb_strtolower($this->getAction()).'/page';

                $nav_block = '<div class="pagination"><ul>';
                $nav_block.= '<li' . $disabled . '>';
                if(!$disabled)  $nav_block.=  '<a href="' . $url . ($current - 1) .$qs . '">';
                    else $nav_block.='<span>';

                $nav_block.=  '&laquo;';
                if(!$disabled)  $nav_block.=  '</a>';
                else $nav_block.='</span>';
                $nav_block.=  '</li>';

                for ($i = $start; $i <= $end; $i++) {
                    $a = ($i == $page) ? ' class="active"' : '';
                    $nav_block .= '<li' . $a . '><a href="' . $url . $i .$qs .' ">' . $i . "</a></li> ";
                }
                $disabled = ($page == $page_num) ? ' class="disabled"' : '';

                $nav_block.= '<li' . $disabled . '>';
                if(!$disabled)  $nav_block.=  '<a href="' . $url . ($current + 1) . $qs . '">';
                    else $nav_block.='<span>';

                $nav_block.=  '&raquo;';
                if(!$disabled)  $nav_block.=  '</a>';
                else $nav_block.='</span>';
                $nav_block.=  '</li>';

                $nav_block .= '</ul></div>';
                echo $nav_block;
            }

    }
    ;?>
    <table>
        <?php
        //кол-во столбцов
        $columnCount = 2;
        //кол-во строк
        $SRrowCount = ceil(count($searchResult) / 2);
        //Перебираем строки
        for ($i = 0; $i < $SRrowCount; $i++) {
            echo '<tr>';
            //Перебираем столбцы
            for ($j = 0; $j < $columnCount; $j++) {
                $gk = array_shift($searchResult);
                //Если нет элемента - выходим из цикла.
                if ($gk === NULL) {
                    break;
                }
                if ($this->entityName == 'elite') {
                    if ($gk['eliteType'] == 'newflat') {
                        include 'app/views/patterns/newflat.plate.php';
                    } elseif ($gk['eliteType'] == 'flat') {
                        include 'app/views/patterns/flat.plate.php';
                    } elseif ($gk['eliteType'] == 'land') { //land
                        include 'app/views/patterns/land.plate.php';
                    }
                } else {
                    //Если есть - рисуем плитку
                    include 'app/views/patterns/' . $this->entityName . '.plate.php';
                }
                if($j == 0) echo "<td width='10'></td>";
            }
            echo '</tr><tr height="10"></tr>';
        }
        ?>
    </table>
    <?php
        if(isset($nav_block)) echo $nav_block;
    ?>
</div>