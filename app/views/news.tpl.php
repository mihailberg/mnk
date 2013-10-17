
<!--    -->
<!--        <div class="pageMenu">-->
<!--            <ul>-->
<!--                --><?php
//
//                ?>
<!--            </ul>-->
<!--        </div>-->
<div class="all-box" style="padding: 20px">

            <?php
            if (!is_array($newsData) || count($newsData) == 0) {
                echo 'Новостей нет.</div>';
                return;
            }
            foreach($newsData as $news){
                echo '
                <div class="newsPlate">
                    <div class="nTitle"><h3>'.$news['title'].'</h3></div>
                    <div class="nDate">'.date_format(new DateTime($news['date']),'Y.m.d H:i').'</div>
                    <div class="nContent">'.$news['content'].'</div>
                </div>

                ';
            }
            ?>

            <?php
            // echo $content;
            ?>
                <div class="cb"></div>
</div>