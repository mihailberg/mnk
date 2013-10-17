<ul class="tabs">
    <li<?php if(count($urlArray)==3) echo ' class="current"' ?>><a href="/<?php echo $urlArray[0];?>/<?php echo $urlArray[1];?>/<?php echo $urlArray[2];?>">Общее</a><span><span class="sh"></span></span></li>
    <li<?php if(isset($urlArray[3])&&$urlArray[3]=='planirovki') echo ' class="current"' ?>><a href="/<?php echo $urlArray[0];?>/<?php echo $urlArray[1];?>/<?php echo $urlArray[2];?>/planirovki">Планировки</a><span><span class="sh"></span><span class="shl"></span></span></li>
    <li<?php if(isset($urlArray[3])&&$urlArray[3]=='svobodnye') echo ' class="current"' ?>><a href="/<?php echo $urlArray[0];?>/<?php echo $urlArray[1];?>/<?php echo $urlArray[2];?>/svobodnye">Свободные <?php echo (isset($apartments)&&$apartments==1)?'апартаменты':'квартиры';?></a><span><span class="sh"></span><span class="shl"></span></span></li>
    <li<?php if(isset($urlArray[3])&&$urlArray[3]=='raspologenie') echo ' class="current"' ?>><a href="/<?php echo $urlArray[0];?>/<?php echo $urlArray[1];?>/<?php echo $urlArray[2];?>/raspologenie">Расположение</a><span><span class="sh"></span><span class="shl"></span></span></li>
    <li<?php if(isset($urlArray[3])&&$urlArray[3]=='stroitelnaya-gotovnost') echo ' class="current"' ?>><a href="/<?php echo $urlArray[0];?>/<?php echo $urlArray[1];?>/<?php echo $urlArray[2];?>/stroitelnaya-gotovnost">Строительная готовность</a><span><span class="sh"></span><span class="shl"></span></span></li>
</ul>
<script type="text/javascript">
     $(document).ready(function(){

         $('.tabs li').click(function(){
             //var value = $(this).attr('id');

             window.location.href = $(this).find("a").attr("href");

             return false;
         });
     });
 </script>