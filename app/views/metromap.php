<link rel="stylesheet" type="text/css" href="/metro/jquery-ui-1.8.17.custom.min.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/metro/metro.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/metro/main.css" media="all"/>
<!--<link rel="stylesheet" type="text/css" href="/metro/extended_search.css" media="all"/>-->

<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--<script src="http://www.cian.ru/nd/global/excanvas.js"></script>-->
<script type="text/javascript" src="/metro/jquery.ba-bbq.min.js"></script>
<script type="text/javascript" src="/metro/metro.js"></script>
<script type="text/javascript" src="/metro/extended_search.js"></script>

<div class="ex_location_type" rel="location_metro" style="margin-top: 10px;">
    <div class="metrobox ex_location_type" rel="location_metro"></div>

    <div class="als_metro_circle_triggers" style="">
        <span class="als_metro_wrapper">
            <span class="pseudo als_metro_select_circle als_metro_select_inside"
                  style="  cursor: pointer; text-decoration: underline;">Выбрать весь центр</span>
        </span>

        <!--
        <span class="als_metro_wrapper">
        <span class="pseudo als_metro_select_inside">Выделить станции внутри кольца</span>
        </span>

        <span class="als_metro_wrapper">
        <span class="pseudo als_metro_select_circle">Выделить кольцевые станции</span>
        </span>
        -->

        <div class="metro_selected_title"
             style="position: relative; overflow: hidden; font-size: 14px;font-weight: bold;margin:10px 0px;min-width: 200px;">
            Выбраны станции
        </div>
        <div class="metro_selected" style="display:none;margin:10px 0px;"></div>
        <span class="pseudo als_metro_deselect"
              style="font-size:14px;display:none;cursor: pointer; text-decoration: underline;margin-top: 15px;">Удалить выбранные станции</span>


    </div>
    <div style="clear: both;"></div>
</div>