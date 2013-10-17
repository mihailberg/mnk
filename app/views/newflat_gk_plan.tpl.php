<div class="newflat_plan_korpus">
<?php
    echo '<ul class="plan_korpus cb">';

    foreach($korpus as $p){
        echo '<li';
        if($p['korpus'] == $currentPlan['korpus']){
            echo ' class="current"';
        }
        echo '>';
        echo '
        <a  href="/'.$urlArray[0].'/'.$urlArray[1].'/'.$urlArray[2].'/'.$urlArray[3].'/korpus/'.$p['korpus'].'">Корпус '.$p['korpus'].'</a>
        </li>';
        if($p['korpus'] == $currentPlan['korpus']){
            //$p['sections'] = array_reverse($p['sections']);
            $section = array();
            foreach($p['sections'] as $s){
                if($s['section'] == $currentPlan['section']){
                    array_push($section, '<li class="sectiontab current"><a href="/'.$urlArray[0].'/'.$urlArray[1].'/'.$urlArray[2].'/'.$urlArray[3].'/korpus/'.$s['korpus'].'/section/'.$s['section'].'">Секция '.$s['section'].'</a></li>');
                }else{
                    array_push($section, '<li class="sectiontab"><a href="/'.$urlArray[0].'/'.$urlArray[1].'/'.$urlArray[2].'/'.$urlArray[3].'/korpus/'.$s['korpus'].'/section/'.$s['section'].'">Секция '.$s['section'].'</a></li>');
                };
            }
        }
    }

    echo '
    </ul>';

    if(isset($section) && is_array($section)){
        echo '<ul class="plan_section cb">';
        foreach($section as $v){
            echo $v;
        }
        echo '<div class="cb"></div></ul>';
    }

    echo '<div class="cb" style="margin: 10px 0px;">';

    echo '<center><br /><h3 style="color: #B6B6B6;">Секция '.$currentPlan['section'].'</h3></center>';
    if(empty($currentPlan['image_section'])){ echo ' <small>нет изображения</small>';  } else {
        echo '<br /><div style="text-align:center;"><img width="600" src="'.$currentPlan['image_section'].'" /></div>';//image_korpus
    }

    echo '<center><br /><h3 style="color: #B6B6B6;">Корпус '.$currentPlan['korpus'].'</h3></center>';
    if(empty($currentPlan['image_korpus'])){ echo ' <small>нет изображения</small>';  } else {
        echo '<br /><div style="text-align:center;"><img width="600" src="'.$currentPlan['image_korpus'].'" /></div>';//image_korpus
    }
    echo '</div>';
?>
</div>