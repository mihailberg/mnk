<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title><?php echo $title;?></title>

    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/js/fancybox/jquery.fancybox-1.3.4.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="/css/print.css" media="print">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/main.js"></script>
    <script type="text/javascript" src="/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
    <script type="text/javascript" src="/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            if (window.location.hash == '#mo') {
                $('#moscow_tab').removeClass('current');
                $('#mo_tab').addClass('current')

                $('#box_moscow').hide();
                $('#box_mo').show();
            }

            $('a.fancybox').fancybox();

            $('.objlist_tr').click(function () {
                var linkId = $(this).find('.objId').text();
                window.location.href = "/gorodskaja-nedvizhimost/flat/" + linkId;
            });

            $('.results_item.newflat').click(function () {
                var linkId = $(this).find('.objId').text().substring(2);
                window.location.href = "/novostrojki/gk/" + linkId;
            });
        });
    </script>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
<header>
    <div class="header">
        <a href="/" class="logo"></a>
        <img src="/img/logo.jpg" class="imgMediaPrint">
    </div>
</header>
<section class="colMain">
    <div class="breadcrumb">
        <ul class="br-button">
            <li><a href="#"><span>На главной</span></a></li>
            <li><a href="#"><span>Ваш консультант</span></a></li>
            <li><a href="#"><span>Оставить заявку</span></a></li>
            <li><a href="#"><span>Лучшие предложения</span></a></li>
            <li><a href="#"><span>Заказать звонок</span></a></li>
            <li><a href="#"><span>Мои объекты</span></a></li>
        </ul>
        <div class="top-phone"><span>+7(495) 000-0000</span></div>
    </div>
    <div class="b-content-form">
        <?php echo $content;?>
    </div>
</section>
<footer class="colMain">
    <ul>
        <li><a href="#">Контакты</a></li>
        <li><a href="#">Услуги</a></li>
        <li><a href="#">Региональные представительства</a></li>
        <li><a href="#">Наши партнеры</a></li>
        <li><a href="#">Новости</a></li>
        <li><a href="#">Полезная информация</a></li>
    </ul>
    <div class="cb"></div>
    <div class="contactMediaPrint">
        <span>&copy; Компания МНК Недвижимость</span><br>
        <span>Телефон: +7 (495) 000-00-00</span><br>
        <span>E-mail: company@mail.ru</span>
    </div>
</footer>
</body>
</html>