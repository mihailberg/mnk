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
    <script src="/nga/templates/default/assets/bootstrap/js/holder.js"></script>
    <script>     Holder.add_theme("gray", {background:"#eee", foreground:"#aaa", size:14, font:"Tahoma"}).run();    </script>

    <script id="rhlpscrtg" type="text/javascript" charset="utf-8" async="async"
            src="https://web.redhelper.ru/service/main.js?c=mnkestate"></script>


    <script type="text/javascript">
        $(document).ready(function () {

            $('a.fancybox').fancybox();

            /*
            $('.objlist_tr').click(function () {
                var linkId = $(this).find('.objId').text();
                window.location.href = "/gorodskaja-nedvizhimost/flat/" + linkId;
            });

            $('.results_item.flat').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/gorodskaja-nedvizhimost/flat/" + linkId;
            });

            $('.results_item.newflat').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/novostrojki/gk/" + linkId;
            });

            $('.results_item.land').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/zagorodnaja-nedvizhimost/land/" + linkId;
            });


            $('.results_item.eliteflat').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/elitnaja-nedvizhimost/flat/" + linkId;
            });

            $('.results_item.elitenewflat').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/elitnaja-nedvizhimost/gk/" + linkId;
            });

            $('.results_item.eliteland').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/elitnaja-nedvizhimost/land/" + linkId;
            });

            $('.results_item.commercial2 td.noPhoto').click(function () {
                var linkId = $(this).parents('tr').find('.objId').text().substring(2);
                window.location.href = "/kommercheskaja-nedvizhimost/commercial/" + linkId;
            });

            $('.results_item.invest').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/proekty-dlja-investirovanija/invest/" + linkId;
            });

            $('.results_item.foreign').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/zarubezhnaja-nedvizhimost/foreign/" + linkId;
            });
            */

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
    <?php if($urlArray[0] == "gorodskaja-nedvizhimost") { ?>
      <div class="all-box">
        <div class="b-form">
    <?php } ?>
          <h1><?php echo $h1; ?></h1>
          <?php echo $content;?>
    <?php if($urlArray[0] == "gorodskaja-nedvizhimost") { ?>
        </div>
      </div>
    <?php } ?>
    </div>
</section>
<?php include 'app/views/footer.tpl.php';?>
</body>
</html>