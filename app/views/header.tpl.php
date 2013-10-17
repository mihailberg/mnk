<header <?php if(isset($urlArray[1])) echo 'class="small"'; ?>>
    <div class="header <?php if(isset($urlArray[1])) echo 'small'; ?>">
        <div class="logo <?php if(isset($urlArray[1])) echo 'small'; ?>">
            <a href="/">
                <img src="/img/logo.jpg" />
            </a>
        </div>
        <div class="top_img">
            <img <?php if(isset($urlArray[1])) echo 'class="small"'; ?> src="/img/<?php
            if($urlArray[0] == "zagorodnaja-nedvizhimost")echo"bg-header-country";
            elseif($urlArray[0] == "kommercheskaja-nedvizhimost")echo"bg-header-business";
            elseif($urlArray[0] == "novostrojki")echo"bg-header-newhome";
            elseif($urlArray[0] == "proekty-dlja-investirovanija")echo"bg-header-investment";
            elseif($urlArray[0] == "zarubezhnaja-nedvizhimost")echo"bg-header-outcountry";
            elseif($urlArray[0] == "gorodskaja-nedvizhimost")echo"bg-header";

            else{
                echo"bg-header-business";
            }

            ?>.jpg">
        </div>
        <div class="phone <?php if(isset($urlArray[1])) echo 'small'; ?>">
          <span><span class="small">+7 (495)</span><?php echo str_replace('+7 (495)','',$contacts[2]['value']);?></span>
        </div>
        <div class="cb"></div>
    </div>
    <div class="header-nav">
        <table>
            <td><a href="/"><span></span>На главную</a></td>
            <td><a onclick="openDialog('callBack','Оставить заявку',430);"><span></span>Оставить заявку</a></td>
            <td><a onclick="openDialog('orderCall','Заказать звонок',400);"><span></span>Заказать звонок</a></td>
            <td><a onclick="openConsult();"><span></span>Онлайн консультант</a></td>
            <?
            $bestUrl = '';
            if($urlArray[0] == "zagorodnaja-nedvizhimost")          $bestUrl = "land";
            elseif($urlArray[0] == "kommercheskaja-nedvizhimost")   $bestUrl = "commercial";
            elseif($urlArray[0] == "novostrojki")                   $bestUrl = "newflat";
            elseif($urlArray[0] == "proekty-dlja-investirovanija")  $bestUrl = "invest";
            elseif($urlArray[0] == "zarubezhnaja-nedvizhimost")     $bestUrl = "foreign";
            elseif($urlArray[0] == "gorodskaja-nedvizhimost")       $bestUrl = "flat";
            elseif($urlArray[0] == "elitnaja-nedvizhimost")       $bestUrl = "elite";

            if($bestUrl!= ''){
                $bestUrl= '/index/'.$bestUrl;
            }


            ?>
            <td><a href="/luchshiye-predlozheniya<?php echo $bestUrl;?>"><span></span>Лучшие предложения</a></td>
        </table>
    </div>
    <div class="cb"></div>
</header>
<div id="callBack">
  <div class="cb"></div>
  <span>Имя<span class="mainOrange" style="display: inline;width: auto;float: none;">*</span>:</span>
  <input type="text" name="callBackName" />
  <div class="cb"></div>
  <span>E-mail<span class="mainOrange" style="display: inline;width: auto;float: none;">*</span>:</span>
  <input type="text" name="callBackMail" />
  <div class="cb"></div>
  <span>Телефон:</span>
  <input type="text" name="callBackPhone" />
  <div class="cb"></div>
  <span>Сообщение<span class="mainOrange" style="display: inline;width: auto;float: none;">*</span>:</span>
  <textarea name="callBackMsg"></textarea>
  <div class="cb"></div>
  <div id="callBackResponse"></div>
  <button onclick="sendCallBack();">Отправить</button>
  <div class="cb"></div>
  <div><small>поля отмеченные <span class="mainOrange" style="display: inline;width: auto;float: none;">*</span> обязательны к заполнению </small></div>
</div>
<div id="orderCall">
  <div class="cb"></div>
  <span>Имя<span class="mainOrange" style="display: inline;width: auto;float: none;">*</span>:</span>
  <input type="text" name="orderCallName" />
  <div class="cb"></div>
  <span>Телефон<span class="mainOrange" style="display: inline;width: auto;float: none;">*</span>:</span>
  <input type="text" name="orderCallPhone" />
  <div class="cb"></div>
  <div class="cb"></div>
  <span>Сообщение:</span>
  <textarea name="orderMsg"></textarea>
  <div class="cb"></div>

  <div id="orderCallResponse"></div>
  <button onclick="sendOrderCall();">Заказать</button>
  <div class="cb"></div>
  <div><small>поля отмеченные <span class="mainOrange" style="display: inline;width: auto;float: none;">*</span> обязательны к заполнению </small></div>
</div>