<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title><?php echo $title;?></title>
    <link rel="shortcut icon" href="/faviconnew.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/js/fancybox/jquery.fancybox-1.3.4.css" media="screen"/>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/css/print.css" media="print">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/main.js"></script>
    <script type="text/javascript" src="/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
    <script type="text/javascript" src="/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script id="rhlpscrtg" type="text/javascript" charset="utf-8" async="async"
            src="https://web.redhelper.ru/service/main.js?c=mnkestate"></script>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="/js/advSearch.js"></script>
<?php

//echo '<!-- ';
//print_r($mapResult);
//echo '-->';
?>
    <script type="text/javascript">
        /* GOGLE MAP */

        <?php
        if ($urlArray[0] != "elitnaja-nedvizhimost") {

            $oneUrl = '';
            $urls = array('novostrojki' => 'gk',
                'gorodskaja-nedvizhimost' => 'flat',
                'kommercheskaja-nedvizhimost' => 'commercial',
                'zagorodnaja-nedvizhimost' => 'land',
                'zarubezhnaja-nedvizhimost' => 'foreign',
                'proekty-dlja-investirovanija' => 'invest');
            if (isset($urls[$urlArray[0]]))
                $oneUrl = $urls[$urlArray[0]];


        echo "
        var places = [";
            if (isset($mapResult) && is_array($mapResult)) {
                $m = "";
                foreach ($mapResult as $v) {

                    if (!empty($v['latitude']) && !empty($v['longitude']) //&& !empty($v['price'])
                    ) {
                        //print_r($v);
                        if(empty($v['address'])) $v['address']='&nbsp;&nbsp;';
                        $price = '';
                        if (isset($v['square'])) {
                            $square = $v['square'];
                        } else {
                            $square = '';
                        }
                        $cur_cur = (isset($v['currency']))?$v['currency']:1;

                        $m .= '[' .
                            $v['tid'] . ',' .
                            $v['latitude'] . ',' .
                            $v['longitude'] . ', "' . 
                            strtr(nl2br($v['address']),array("\n"=>"","\r"=>'','"'=>'\"')).'", "' .  nl2br($square) .
                            '", "' . number_format($v['price'], 0, '.', ' ') .
                            '",  "' . $currencyList[$cur_cur] . '"],';

                    }
                }
                echo trim($m, ',');
            }
            echo "];
        var infowindow = new google.maps.InfoWindow({
         content: ''
        });
        ";
        
                    echo "
        function initialize_map() {";
            if($urlArray[0] == "zarubezhnaja-nedvizhimost"){
                echo "
                    var latlng = new google.maps.LatLng(47.320952,11.52246);
                    var myOptions = {
                        zoom:3,
                        center:latlng,
                        mapTypeId:google.maps.MapTypeId.ROADMAP
                    };
                ";
            }else{
                echo "
                    var latlng = new google.maps.LatLng(55.751386,37.622955);
                    var myOptions = {
                        zoom:10,
                        center:latlng,
                        mapTypeId:google.maps.MapTypeId.ROADMAP
                    };
                ";
            }
        echo "var map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
            setMarkers(map, places);

        };";

        echo "function setMarkers(map, locations) {
            //Определяем область показа маркеров
            var latlngbounds = new google.maps.LatLngBounds();
            var marker = [];

            for (var i = 0; i < places.length; i++) {
                var myLatLng = new google.maps.LatLng(locations[i][1], locations[i][2]);
                //Добавляем координаты маркера в область
                latlngbounds.extend(myLatLng);
                marker[i] = new google.maps.Marker({
                    position:myLatLng,
                    map:map,
                    url:'/" . $urlArray[0] . "/" . $oneUrl . "/' + locations[i][0],
                    content: '<b>'+locations[i][3]+'</b>'+
                    '<p>Площадь: '+locations[i][4]+'м<sup>2</sup></p>'+
                    '<p>Стоимость: '+locations[i][5]+' '+locations[i][6]+'</p>'+
                    '<a href=\"/" . $urlArray[0] . "/" . $oneUrl . "/' + locations[i][0]+'\">Подробнее</a>'
                });

                google.maps.event.addListener(marker[i], 'click', function() {
                    infowindow.content = this.content
                    infowindow.open(map,this);
                    //    window.location.href = this.url;
                });
            }
            //Центрируем и масштабируем карту
            //map.setCenter(latlngbounds.getCenter(), map.fitBounds(latlngbounds));
        };";
        }  ?>
        $(document).ready(function () {
            $('.mmetro').advSearchFilter('#mmetroPlace');
            $('.highway').advSearchFilter('#highwayPlace');

            $('.direction').advSearchFilter('#directionPlace');
            $('.assign').advSearchFilter('#assignPlace');
            $('.city').advSearchFilter('#cityPlace');
            $('.country').advSearchFilter('#countryPlace');
            $('.type').advSearchFilter('#typePlace');
            $('.region').advSearchFilter('#regionPlace');
            $('.cottage_set').advSearchFilter('#cottage_setPlace');
            $('.train_way').advSearchFilter('#train_wayPlace');

//            $('.mo_tab').find('input,select,textarea').attr('disabled','disabled');
            if (window.location.hash == '#mo') {
                $('.moscow_tab').removeClass('current');

                $('.mo_tab').addClass('current');

                $('.all_view_link').attr('href',function(){
                   return this.href+'?mo=1';
                });

                var value = 1;
                $('.typeHidden').attr('value',value);

                $('#box_moscow').hide();
                $('#box_mo').show();
                <?php    if($urlArray[0] != "elitnaja-nedvizhimost") echo 'initialize_map();';             ?>

            }

            window.all_view_href = '<?php echo $urlArray[0] . $searchurl;?>';
            window.addGet = '';

            $('ul.tabs').delegate('li:not(.current)', 'click', function () {

                window.addGet = '?'+$(this).attr('rel');
                $('.all_view_link').attr('href',window.all_view_href+window.addGet);

                var $passTab = $(this).addClass('current').siblings().removeClass('current');
                $passTab.parents('div.section').find('div.box').hide().eq($(this).index()).fadeIn(300);

                //Map
                <?php    if($urlArray[0] != "elitnaja-nedvizhimost") echo 'initialize_map();';             ?>

            });

            $('.select_shadow').click(function () {
                var id = $(this).attr('id');
                var title = $(this).parent().prev().text();
                $('.b-form-dialog-box.' + id).dialog({
                    draggable:false,
                    resizable:false,
                    width:300,
                    height:400,
                    modal:true
                });

                $('.b-form-dialog-box.' + id).find('.close').click(function(event){
                    $('.b-form-dialog-box.' + id).dialog('close');
                });
                $('.b-form-dialog-box.' + id).prev().find('.ui-dialog-title').text(title);
            });

            $('.select_shadow.assign_type').click(function () {
                var id = $(this).attr('id');
                var title = $(this).parent().prev().text();


                $('.b-form-dialog-box.' + id).dialog({
                    draggable:true,
                    resizable:true,
                    width:570,
                    height:380,
                    modal:true
                });
                $('.b-form-dialog-box.' + id).prev().find('.ui-dialog-title').text(title);

            });

            $('.marker').click(function(event){
                $(this).children('.mPlace').toggle();
            })

            var url = window.location.href.split('/');


        <?php if ($urlArray[0] != "elitnaja-nedvizhimost") echo'initialize_map();';?>
        });


    </script>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body <?php if ($urlArray[0] == "elitnaja-nedvizhimost" || $urlArray[0] == "zarubezhnaja-nedvizhimost") echo'class="elite"';?>>
<?php

/* ПОДКЛЮЧЕНИЕ ХЕДЕРА */
include 'header.tpl.php';
?>
<section class="colMain">
    <div class="b-content-form">
        <h1><?php echo $h1;?></h1>

        <form method="get" id="mainSearchForm" action="<?php echo $urlArray[0];?>/search">
        <div class="section">
            <?php
            if ($urlArray[0] == "zagorodnaja-nedvizhimost") {
                echo '<ul class="tabs">
                            <input type="hidden" name="type" class="typeHidden" value="0" />
                            <li class="current tab_1 tabjs" id="l0" rel="">Все<span><span class="sh"></span></span></li>
                            <li class="tab_2 tabjs" id="l1" rel="type=1">Дома<span><span class="sh"></span><span class="shl"></span></span></li>
                            <li class="tab_2 tabjs" id="l3" rel="type=3">Дачи<span><span class="sh"></span><span class="shl"></span></span></li>
                            <li class="tab_2 tabjs" id="l2" rel="type=2">Участки<span><span class="sh"></span><span class="shl"></span></span></li>
                            <li class="tab_2 tabjs" id="l4" rel="type=4">Таунхаусы<span><span class="sh"></span><span class="shl"></span></span></li>
                        </ul>';
            } elseif ($urlArray[0] == "proekty-dlja-investirovanija") {
                echo '<ul class="tabs">
                    <li class="current tab_1 tabjs moscow_tab changebox" id="0" rel="mo=0">Москва<span><span class="sh"></span></span></li>
                    <li class="tab_2 tabjs mo_tab changebox" id="1" rel="mo=1">Московская область<span><span class="sh"></span><span class="shl"></span></span></li>
                    <input type="hidden" name="noMsk" class="typeHidden" value="0" />
                </ul>';
            } elseif ($urlArray[0] == "zarubezhnaja-nedvizhimost") {
                //echo '';
            } elseif ($urlArray[0] == "elitnaja-nedvizhimost") {
                echo '<ul class="tabs">
                        <li class="current tab_1 tabjs moscow_tab changebox" id="0" rel="mo=0">Москва<span><span class="sh"></span></span></li>
                        <li class="tab_2 tabjs mo_tab changebox" id="1" rel="mo=1">Московская область<span><span class="sh"></span><span class="shl"></span></span></li>
                        <input type="hidden" name="noMsk" class="typeHidden" value="0" />
                    </ul>';
            } else {
                echo '<ul class="tabs">
                        <li class="current tab_1 tabjs moscow_tab" id="0" rel="mo=0">Москва<span><span class="sh"></span></span></li>
                        <li class="tab_2 tabjs mo_tab" id="1" rel="mo=1">Московская область<span><span class="sh"></span><span class="shl"></span></span></li>
                        <input type="hidden" name="noMsk" class="typeHidden" value="0" />
                    </ul>';
            }//<input type="hidden" name="typeHidden" class="typeHidden" value="0" />
            ?>
            <div class="all-box">

                <!-- SEARCH -->
                    <div class="b-form">

                        <?php echo $content;?>
                        <div class="b-form-search-right">
                            <div class="b-form-button-box first input">
                                <span class="arrow"></span>
                                <input type="submit" value="Найти"/>
                            </div>
                            <div class="b-form-button-box middle">
                                <span class="arrow"></span>
                                <a class="all_view_link" href="<?php echo $urlArray[0] . $searchurl;?>">Показать все предложения</a>
                            </div>
                            <div class="b-form-button-box input last">
                                <span class="arrow"></span>
                                <input type="reset" class="formReset" value="Очистить параметры поиска"/>
                            </div>
                        </div>
                        <div class="cb"></div>

                    </div>

                    <!-- SEARCH END -->
                    <?php

                    if ($urlArray[0] == "elitnaja-nedvizhimost") {
                        echo '<style>
                            #eliteMap {
                                background: url(\'/img/elitemap.jpeg\') no-repeat top left;
                                position: relative;
                                width: 1158px;
                                height: 843px;
                            }

                            .marker {
                                position: absolute;
                                width: 21px;
                                height: 29px;
                                margin-top:-27px;
                                margin-left:-11px;
                                /* background: #ed882e; */
                                background: url(/img/arrowOrangeVertical.png) bottom center no-repeat;
                            }
                            .marker div.mPlace{
                                position: relative;
                                display: none;
                            }
                            .marker div.mPlace div.content{
                                position: absolute;
                                bottom:-1px;
                                width:200px;
                                left: -30px;
                                overflow: auto;
                                padding: 10px;
                                /*background: #ed882e;*/
                                background: #f35b40;
                                border-radius:8px;
                                -webkit-border-radius:8px;
                                -moz-border-radius:8px;
                                -khtml-border-radius:8px;
                            }
                            .marker div.mPlace div.content a{
                                color: #fff;
                            }
                            .marker div.mPlace div.content p{
                                margin:4px;
                            }
                            </style>
                            ';

                        echo '<div id="eliteMap">';
                        if (isset($eliteMap) && is_array($eliteMap)) {
                            $urls = array(
                                'newflat' => '/elitnaja-nedvizhimost/gk/',
                                'flat' => '/elitnaja-nedvizhimost/flat/',
                                'land' => '/elitnaja-nedvizhimost/land/'
                            );


                            foreach ($eliteMap as $eCoord) {
                                if(!isset($eCoord['address'])){
                                    $eCoord['address'] = $eCoord['title'];
                                }
                                if($eCoord['Y'] == 0 || $eCoord['X'] ==0) continue;
//                                print_r($eCoord);

                                echo '<div style="top:' . $eCoord['Y'] . 'px;left: ' . $eCoord['X'] . 'px;" class="marker">
                                        <div class="mPlace">
                                            <div class="content">
                                                <span class="caption">'.$eCoord['address'].'</span><br />

                                                <span>Площадь: '.$eCoord['square'].'м<sup>2</sup><br />';

                                if(!empty($eCoord['THUMB'])){
                                    echo '<span><img src = "'.$eCoord['THUMB'].'" /></span><br />';
                                }
                                echo '
                                                <span>Стоимость: '.number_format($eCoord['price'] / $currencyValue, 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$currency] . '</span></span><br /><br />
                                                <span><a href="'.$urls[$eCoord['eliteType']].$eCoord['tid'].'">Подробнее</a></span>
                                            </div>
                                        </div>
                                </div>';
                            }
                        }

                        echo '</div>';
                    } elseif ($urlArray[0] != "zagorodnaja-nedvizhimost" && $urlArray[0] != "zarubezhnaja-nedvizhimost" && $urlArray[0] != "proekty-dlja-investirovanija"
                    ) {

                        $res = nga_config::db()->query("SELECT DISTINCT `subway_stations`.`name` as `title`
                        FROM `" . $this->tableName . "`
                        JOIN `subway_stations` ON ( `" . $this->tableName . "`.`stationID`= `subway_stations`.`id`)");
                        //echo nga_config::db()->error;
                        $exist = array();
                        while ($row = $res->fetch_assoc()) {
                            $exist[] = $row['title'];
                        }



                        echo '<div class="box visible" id="box_moscow">
                    <script>

                    window.metroExcluded = '.json_encode($exist).';
                    window.table = ';
                        if ($urlArray[0] == "novostrojki") echo'"newflat_gk"';
                        if ($urlArray[0] == "gorodskaja-nedvizhimost") echo'"flat"';
                        if ($urlArray[0] == "kommercheskaja-nedvizhimost") echo'"commercial"';
                        //if ($urlArray[0] == "proekty-dlja-investirovanija") echo'"'.$urls[$urlArray[0]].'"';



                        echo ';</script>
                              <div class="metro_mapka">';
                        include "app/views/metromap.php";
                        echo '</div>
                                    </div>
                                    <div class="box" id="box_mo">
                                        <div class="mo_map" style="padding:20px;">
                                            <div id="map_canvas" style="width: 100%; height: 600px; position: relative;"></div>
                                        </div>
                                    </div>
                                ';
                    } else {
                        echo '<div style="padding:20px;"><div id="map_canvas" style="width:100%;height:600px;position:relative;"></div></div>';
                    }
                    ?>
                </form>
            </div>
        </div>
    </div>
</section>
<?php include 'app/views/footer.tpl.php';?>
</body>
</html>