<div class="section">
    <div class="all-box">
        <div class="pageMenu">
            <ul>
                <?php
                //Pages
                if (isset($tree) && is_array($tree)) {
                    if($tid != 12 && $parentID!=12){
                        foreach ($tree as $id => $node) {
                            $cNode = array_shift($node);
                                if($id != 12 && $cNode['parentID']!=12){
                                    echo '<li><a href="/' . $cNode['url'] . '" class="' . (($id == $tid || $parentID == $id) ? 'active' : '') . '">' . $cNode['h1'] . '</a>';
                                    //Sub
                                    if (count($node) > 0 && ($parentID == $id || $id == $tid)) {
                                        echo '<ul>';
                                        foreach ($node as $subPage) {
                                            echo '<li><a href="/' . $cNode['url'] . '/' . $subPage['url'] . '"  class="' . (($subPage['tid'] == $tid) ? 'active' : '') . '">' . $subPage['h1'] . '</a></li>';
                                        }
                                        echo '</ul>';
                                    }
                                    echo '</li>';
                                }
                        }
                    }else{
                            //Repair
                        foreach ($tree as $id => $node) {
                            $cNode = array_shift($node);
                            if($id == 12){
                                echo '<li><a href="/' . $cNode['url'] . '" class="' . (($id == $tid || $parentID == $id) ? 'active' : '') . '">' . $cNode['h1'] . '</a>';
                                //Sub
                                if (count($node) > 0 && ($parentID == $id || $id == $tid)) {
                                    echo '<ul>';
                                    foreach ($node as $subPage) {
                                        echo '<li><a href="/' . $cNode['url'] . '/' . $subPage['url'] . '"  class="' . (($subPage['tid'] == $tid) ? 'active' : '') . '">' . $subPage['h1'] . '</a></li>';
                                    }
                                    echo '</ul>';
                                }
                                echo '</li>';
                            }
                        }
                    }
                }
                ?>
            </ul>
        </div>
        <div class="pageContent">
            <?php echo $content; ?>
        </div>
        <div class="cb"></div>
    </div>
</div>