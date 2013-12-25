<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title><?php echo $title; ?></title>
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
    <script src="/nga/templates/default/assets/bootstrap/js/holder.js"></script>

    <script type="text/javascript" src="/js/jquery.jcarousel.min.js"></script>

    <script>     Holder.add_theme("gray", {background: "#eee", foreground: "#aaa", size: 14, font: "Tahoma"}).run();    </script>

    <script type="text/javascript">


//        $(document).ready(function () {
//
//        });

    </script>
    <script id="rhlpscrtg" type="text/javascript" charset="utf-8" async="async"
            src="https://web.redhelper.ru/service/main.js?c=mnkestate"></script>

    <!-- GOOGLE MAP -->

    <script type="text/javascript">

        <?php if (!empty($this->tplData['coords']['latitude']) && !empty($this->tplData['coords']['longitude']) && $urlArray[0] != "elitnaja-nedvizhimost"): ?>
        function initialize_map() {
            var latlng = new google.maps.LatLng(56.323678, 44.0);
            var myOptions = {
                zoom: 9,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
            var latlngbounds = new google.maps.LatLngBounds();
            var myLatLng = new google.maps.LatLng(<?php echo $this->tplData['coords']['latitude']; ?>, <?php echo $this->tplData['coords']['longitude']; ?>);
            latlngbounds.extend(myLatLng);
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                title: "<?php echo $this->layoutData['h1']; ?>"
            });
            map.setCenter(latlngbounds.getCenter());
        }
        ;

        <?php endif;?>

        $(document).ready(function () {


            $('a.fancybox').fancybox({
                'titleFormat': function(title, currentArray, currentIndex, currentOpts) {
                      var l = currentArray.length; var curI = (currentIndex + 1);
                      if (curI > l) curI -= l;
                      if (curI > l) {                 curI -= l;                          ++curI;             }
                      return '<span id="fancybox-title-over">Фото ' + curI + ' / ' + l +''+ (title.length ? ' &nbsp; ' + title : '') + '</span>';
                },
                onAfterAnimation: function(){
                    console.log($(this));
                }
            });
            $('a.fancybox2').fancybox({
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Фото ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
            <?php if (!empty($this->tplData['coords']['latitude']) && !empty($this->tplData['coords']['longitude']) && $urlArray[0] != "elitnaja-nedvizhimost"): ?>
            initialize_map();
            <?php endif;?>
        });
    </script>

    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>


    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body <?php if ($urlArray[0] == "elitnaja-nedvizhimost" || $urlArray[0] == "zarubezhnaja-nedvizhimost") echo 'class="elite"'; ?>>
<?php

/* ПОДКЛЮЧЕНИЕ ХЕДЕРА */

include 'header.tpl.php';
?>
<section class="colMain">
<div class="b-content-form">
<h1 class="left"><?php echo $h1; ?></h1>

<div class="flat-button-print right" onclick="javascript:window.print()">
    Версия для печати
</div>
<div class="cb"></div>
<?php
if ($urlArray[0] == "novostrojki") {
    include 'newflat_tabs.tpl.php';
}
if ($urlArray[0] == "elitnaja-nedvizhimost" && $urlArray[1] == 'gk') {
    include 'newflat_tabs.tpl.php';
}
if ($urlArray[0] == "kommercheskaja-nedvizhimost" && $urlArray[1] == "commercial" && isset($subObjects)) {
    include 'commercial_tabs.tpl.php';
}
?>

<div class="flat">
<div class="flatId">id <?php echo $id; ?></div>
<div class="flat_1_2_box <?php echo htmlspecialchars($urlArray[0]);?>">

<?php
//Main page
//if()

?>


<?php
if(!empty($similarObjects)){
    echo '<div style="float:left;width:810px;margin-right: 20px;">';
}
//Есть массив фотки
if (isset($photos) && !empty($photos) && is_array($photos)) {
$first = array_shift($photos);
?>

    <div class="flat_1">
        <div class="flat-img-box">
            <div class="flat-img-big">
                <?php
                echo '
                        <a class="fancybox" id="mainPhotoId" rel="mainPhoto" href="' . $first['SRC'] . '">
                            <img src="' . $first['MID'] . '" />
                        </a>';
                ?>
            </div>
        </div><?php
        if (isset($photos) && count($photos) && ($urlArray[0] == "kommercheskaja-nedvizhimost" || $urlArray[0] == 'zagorodnaja-nedvizhimost')) {
            if (count($photos) >= 3) {
                //Start carousel
                ?>

                <script>jQuery(document).ready(function() {
                           jQuery('#product_carousel').jcarousel({
                               auto: 0,
                               wrap: 'last',
                               initCallback: mycarousel_initCallback,
                               scroll: 1,
                           });
                       });
                </script>
        <?php
                //size: <?php count($photos);
            }

                echo '<ul id="product_carousel" class="infiniteCarousel jcarousel-skin-tango small">';
                foreach ($photos as $k => $photo) {
                    echo '<li><a style="height:100px;" class="fancybox" rel="mainPhoto" href="' . $photo['SRC'] . '"><img src="' . $photo['THUMB'] . '" /></a></li>';
                }
                echo '</ul>';
                echo '<br /><br />';
        }

        ?>
    </div>
    <?php } ?>

    <div class="flat_2 <?php if (!isset($first)) {
        echo 'full';
    } ?>">
        <div class="flat-info-box">
            <?php echo $content; ?>
        </div>
    </div>


    <?php
    //Фоток больше одной
    if (isset($photos) && count($photos) && $urlArray[0] != "kommercheskaja-nedvizhimost" && $urlArray[0] != 'zagorodnaja-nedvizhimost') {       ?>
        <div class="cb photos"><br/>
        <?php
        if (count($photos) >= 5) {
                //Start carousel
                ?>

                <script>jQuery(document).ready(function() {
                           jQuery('#product_carousel').jcarousel({
                               auto: 0,
                               //wrap: 'circular',
                               initCallback: mycarousel_initCallback,
                               scroll: 3,
                               size: <?php echo (int)count($photos); ?>
                           });
                       });

//                                   itemVisibleOutCallback: function(e,e1,e2){
//                                       console.log($(e2));        number++
//                                       $(e1).find('a').unbind('fancybox');
//                                   },
//                                   itemVisibleInCallback: function(e,e1,e2){
//                                       $(e1).find('a').fancybox({
//                                       });
//                                   },
//                                     itemVisibleInCallback: function(){
//                                       console.log(this);
//
//                                       $(this).children('a').addClass('.fancybox');
//                                   },
</script>
        <?php

        echo '
       <ul id="product_carousel" class="infiniteCarousel jcarousel-skin-tango">';
        foreach ($photos as $k => $photo) {
            echo '<li><a class="fancybox" rel="mainPhoto" href="' . $photo['SRC'] . '"><img src="' . $photo['THUMB'] . '" /></a></li>';
        }
        echo '</ul>';
            echo '
                   <br /><br />';
        }

        ?></div><?php    }    ?>
    <div class="cb"></div>
    <?php
    if (count($urlArray) < 4 && !empty($description)) {
        if ($urlArray['0'] == 'proekty-dlja-investirovanija') {
            echo "<div class='description_flats'>" . $description . "</div>";
        } else {
            echo "<div class='description_flats'>" . $description . "</div>";
        }
    }

    if (isset($land) && isset($cottage_set[$land['cottage_setID']])) {
        echo '<div class="description_flats">' . $cottage_set[$land['cottage_setID']]['description'] . '</div>';
    }


    if (
        $urlArray[0] == "novostrojki" ||
        ($urlArray[0] == "elitnaja-nedvizhimost" && $urlArray[1] == 'gk')

    ) {
        if (!isset($urlArray[3])) {
            if (count($newflat_minimal) > 0) {
                echo '<div class="table_flats">
                                        <span class="caption_span">Квартиры</span>
                                        <table>';
                //echo '<!--';                print_r($newflat_minimal);                echo '-->';

                foreach ($newflat_minimal as $newflatRow) {
                    echo '<tr>
                            <td>' . $newflatRow['room'] . '-комнатные</td>
                            <td>от ' . $newflatRow['square'] . ' м<sup>2</sup></td>
                            <td>от ' . number_format(($newflatRow['price_m'] ), 0, '.', ' ') . ' ' . $currencyList[$newflatRow['price_m_currency']] . ' / м<sup>2</sup></td>
                            <td>от ' . number_format($newflatRow['price'] , 0, '.', ' ') . ' ' . $currencyList[$newflatRow['price_currency']] . '</td>
                            </tr>';
                }
                echo '</table></div>';
            }
        }
    }


    if (empty($urlArray[3]) && !empty($this->tplData['coords']['latitude']) && !empty($this->tplData['coords']['longitude']) 
    && $urlArray[0] != 'elitnaja-nedvizhimost'
    ) {
        ?>
        <div class="cb"></div>
        <div class="googleMapOne">
            <div id="map_canvas" style="width:360px;height:300px;">

            </div>
        </div>
    <?php } ?>


</div>
<?php if (!empty($similarObjects)) { ?>
    </div>
    <div class="flat_3">
    <div class="flat-like-box">
        <span class="margin">Похожие объекты:</span>
        <?php
        $oneUrl = '';
        $urls = array('novostrojki' => 'gk',
            'gorodskaja-nedvizhimost' => 'flat',
            'kommercheskaja-nedvizhimost' => 'commercial',
            'zagorodnaja-nedvizhimost' => 'land',
            'zarubezhnaja-nedvizhimost' => 'foreign',
            'proekty-dlja-investirovanija' => 'invest');
        if (isset($urls[$urlArray[0]]))
            $oneUrl = $urls[$urlArray[0]];
        if ($urlArray[0] == 'elitnaja-nedvizhimost' && isset($oneObjectUrl)) {
            $oneUrl = $oneObjectUrl;
        }

        foreach ($similarObjects as $o) {
            if(!isset($o['title'])) $o['title'] = '';
            if(!isset($o['currency'])) $o['currency'] = 1;


            echo '<div class="like-box">';

                if (!empty($o['THUMB'])) {
                    echo '<a href="/' . $urlArray[0] . '/' . $oneUrl . '/' . $o['tid'] . '"><img src="' . $o['THUMB'] . '" alt = "' . $o['title'] . '" />';
                } else {
                    echo '<a href="/' . $urlArray[0] . '/' . $oneUrl . '/' . $o['tid'] . '"><img data-src="holder.js/258x189/text:' . $o['title'] . '" alt="' . $title . '">';
                }

            echo '
                    <span>Площадь' . (($oneUrl == 'gk') ? ' от' : '') . ': </span> ' . $o['square'] . ' м<sup>2</sup><br />
                    <span>Стоимость' . (($oneUrl == 'gk') ? ' от' : '') . ': </span> ';


            echo number_format($o['price'], 0, '.', ' ') . "&nbsp;<span class='price_units_rub'>" . $currencyList[$o['currency']];
            echo
            '<br />
            </a>
        </div>';

        }?>

    </div>
    </div><?php
} else {
    echo '<style>
            .flat_1_2_box {
                float: none!important;
            }
            .flat_2.full {
                width: 100%!important;
            }
            </style>';
}  ?>



<div class="cb"></div>


</div>

<div class="cb"></div>
</div>
</div>
</section>
<?php include 'app/views/footer.tpl.php'; ?>
</body>
</html>