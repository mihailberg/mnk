<?php if(!empty($invest['highwayID'])):?><span>Шоссе:&nbsp;</span><?php echo $invest['highwayID'];?><br><?php endif;?>
<?php if(!empty($invest['regionID'])):?><span>Район:&nbsp;</span><?php echo $invest['regionID'];?><br><?php endif;?>
<?php if(!empty($invest['mkad_remoteness'])):?><span>Растояние от МКАД:&nbsp;</span><?php echo $invest['mkad_remoteness'];?><br><?php endif;?>
<?php if(!empty($invest['square'])):?><span>Площадь Га:&nbsp;</span><?php echo $invest['square'];?><br><?php endif;?>
<?php if(!empty($invest['land_category'])):?><span>Категория земли:&nbsp;</span><?php echo $invest['land_category'];?><br><?php endif;?>
<?php if(!empty($invest['use_type'])):?><span>Разрешенный вид использования:&nbsp;</span><?php echo $invest['use_type'];?><br><?php endif;?>
<?php if(!empty($invest['buildings'])):?><span>Наличие зданий/строений на участке:&nbsp;</span><?php echo $invest['buildings'];?><br><?php endif;?>
<?php if(!empty($invest['rights_type'])):?><span>Вид права:&nbsp;</span><?php echo $invest['rights_type'];?><br><?php endif;?>

<?php if(!empty($invest['price_m'])):?><span>Стоимость за 1м<sup>2</sup>:&nbsp;</span><?php
    echo number_format($invest['price_m'] / $currencyValue, 0, '.', ' ') . "&nbsp;" . $currencyList[$currency];
?><br />
<?php endif;?>

<?php if(!empty($invest['price'])):?>    <span>Стоимость:&nbsp;</span><?php
    echo number_format($invest['price'] / $currencyValue, 0, '.', ' ') . "&nbsp;" . $currencyList[$currency];
?><br />
<?php endif;?>


<span class="caption_span">Характеристики объекта:</span>
<?php if(!empty($invest['build_change'])):?><span>Возможное изменение вида разрешенного использования:&nbsp;</span><?php echo $invest['build_change'];?><br><?php endif;?>
<?php
if($build_change_files){
    $html = '';
    foreach($build_change_files as $file){
        $value = $file['SRC'];
        $title = (!empty($file['title']))?$file['title']:'http://'.$_SERVER['HTTP_HOST'].$file['SRC'];
        $html .= '<span>';
        $type = mime_content_type($_SERVER['DOCUMENT_ROOT'].$value);
        if(mb_strpos($type,'/')!== false){
            $type = substr($type,mb_strpos($type,'/'));
        }
        if(file_exists($_SERVER['DOCUMENT_ROOT'].'/img/crystal/'.$type)){
            $html.='<img src="/img/crystal/'.$type.'" width="30" />&nbsp;';
        }

        $html.='<a href = "'.$value.'">'.$title.'</a></span><br />';
    }
    echo $html;
}
?>

<?php if(!empty($invest['ird'])):?><span>Разработанная ИРД<br><?php endif;?>
<?php
if($ird_files){
    $html = '';
    foreach($ird_files as $file){
        $value = $file['SRC'];
        $title = (!empty($file['title']))?$file['title']:'http://'.$_SERVER['HTTP_HOST'].$file['SRC'];
        $html .= '<span>';
        $type = mime_content_type($_SERVER['DOCUMENT_ROOT'].$value);
        if(mb_strpos($type,'/')!== false){
            $type = substr($type,mb_strpos($type,'/'));
        }
        if(file_exists($_SERVER['DOCUMENT_ROOT'].'/img/crystal/'.$type)){
            $html.='<img src="/img/crystal/'.$type.'" width="30" />&nbsp;';
        }

        $html.='<a href = "'.$value.'">'.$title.'</a></span><br />';
    }
    echo $html;
}
?>

<?php if(!empty($invest['akt'])):?><span>Распорядительные акты<br><?php endif;?>
<?php
if($akt_files){
    $html = '';
    foreach($akt_files as $file){
        $value = $file['SRC'];
        $title = (!empty($file['title']))?$file['title']:'http://'.$_SERVER['HTTP_HOST'].$file['SRC'];
        $html .= '<span>';
        $type = mime_content_type($_SERVER['DOCUMENT_ROOT'].$value);
        if(mb_strpos($type,'/')!== false){
            $type = substr($type,mb_strpos($type,'/'));
        }
        if(file_exists($_SERVER['DOCUMENT_ROOT'].'/img/crystal/'.$type)){
            $html.='<img src="/img/crystal/'.$type.'" width="30" />&nbsp;';
        }

        $html.='<a href = "'.$value.'">'.$title.'</a></span><br />';
    }
    echo $html;
}
?>
        <?php if(!empty($invest['conditions'])):?><span>Условия входа в проект:&nbsp;</span><br /><?php echo nl2br($invest['conditions']);?><br><?php endif;?>