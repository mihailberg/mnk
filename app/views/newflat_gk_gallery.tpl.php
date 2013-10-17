
<?php
if(!is_array($photos) || count($photos)==0){
    echo 'Фотографий нет.';
} else {
?>
<style>
    .gallery_photo{
        float:left;width:160px;height:120px;margin:5px;
    }
</style>
<?php

    foreach($photos as $photo){
        echo '<div class="gallery_photo"><a title="'.$photo['title'].'" href = "'.$photo['SRC'].'" class="fancybox2" rel="gallery"><img alt="'.$photo['title'].'"  src="'.$photo['THUMB'].'" /><br />
        '.$photo['title'].'
        </a></div>';
    }
}
?>