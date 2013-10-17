<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?php echo $Data->path['current'];?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/jquery-1.9.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
    <link type="text/css"
          href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/jquery-ui-1.8.20.custom/css/smoothness/jquery-ui-1.8.20.custom.css"
          rel="stylesheet"/>
    <script type="text/javascript"
            src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/jquery-ui-1.8.20.custom/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/jquery-ui-1.8.20.custom/js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript"
            src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/jquery-ui-timepicker-addon.js"></script>
    <!-- Le styles -->
    <link href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        ul.nav li.dropdown:hover ul.dropdown-menu {
            display: block;
        }

        a.menu:after, .dropdown-toggle:after {
            content: none;
        }


    </style>
    <link href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/css/bootstrap-responsive.css"
          rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed"
          href="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/ico/apple-touch-icon-57-precomposed.png">

    <script type="text/javascript">
        function deleteOnClick(location) {
            sure = confirm("Удалить запись?");
            if (sure) document.location.href = location;
        }
    </script>

</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/">@</a>

            <div class="nav-collapse">
                <ul class="nav">

                    <!-- Новостройки -->
                    <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/newflat_gk.php') ? 'active' : '';?>"><a
                            href="newflat_gk.php">Новостройки</a></li>

                    <!-- Городская недвижимость -->
                    <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/flat.php') ? 'active' : '';?>"><a
                            href="flat.php">Городская</a></li>
                    <!--Коммерческая -->
                    <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/commercial.php') ? 'active' : '';?>"><a
                            href="/admin/commercial.php">Коммерческая</a></li>
                    <!-- заГородная недвижимость -->
                    <li class="dropdown <?php echo (
                        $_SERVER['SCRIPT_NAME'] == '/admin/cottage_set.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/land.php') ? 'active' : '';?>">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Загородная
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/land.php') ? 'active' : '';?>"><a
                                    href="land.php">Загородная недвижимость</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/cottage_set.php') ? 'active' : '';?>">
                                <a href="cottage_set.php">Коттеджные поселки</a></li>
                        </ul>
                    </li>
                    <!-- Проекты для инвестирования -->
                    <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/invest.php') ? 'active' : '';?>"><a
                            href="invest.php">Проекты для инвестирования</a></li>
                    <!-- зарубежная -->
                    <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/foreign.php') ? 'active' : '';?>"><a
                            href="foreign.php">Зарубежная</a></li>


                    <li class="dropdown <?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/newflat_gk_elite.php' || $_SERVER['SCRIPT_NAME'] == '/admin/land_elite.php' || $_SERVER['SCRIPT_NAME'] == '/admin/flat_elite.php' || $_SERVER['SCRIPT_NAME'] == '/admin/cottage_set_elite.php') ? 'active' : '';?>">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Элитные
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/newflat_gk_elite.php') ? 'active' : '';?>">
                                <a href="newflat_gk_elite.php">Новостройки</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/land_elite.php') ? 'active' : '';?>">
                                <a href="land_elite.php">Загородная</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/cottage_set_elite.php') ? 'active' : '';?>">
                                <a href="cottage_set_elite.php">Коттеджные поселки</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/flat_elite.php') ? 'active' : '';?>">
                                <a href="flat_elite.php">Вторичная</a></li>
                        </ul>
                    </li>

                    <!-- Страницы -->
                    <li class="dropdown <?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/page.php'||$_SERVER['SCRIPT_NAME'] == '/admin/news.php') ? 'active' : '';?>"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Страницы<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/page.php') ? 'active' : '';?>">      <a href="page.php">Страницы</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/news.php') ? 'active' : '';?>">      <a href="news.php">Новости</a></li>
                        </ul>
                    </li>


                    <!-- Заявки -->
                    <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/application.php') ? 'active' : '';?>"><a
                            href="application.php">Заявки</a></li>


                    <li class="dropdown <?php echo (
                        $_SERVER['SCRIPT_NAME'] == '/admin/settings.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/subway_stations.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/region.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/country.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/contacts.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/highway.php' ||
                            $_SERVER['SCRIPT_NAME'] == '/admin/city.php'
                    ) ? 'active' : '';?>">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-cog icon-white"></i> Настройки
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/settings.php') ? 'active' : '';?>">
                                <a href="settings.php">Курсы валют</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/country.php') ? 'active' : '';?>">
                                <a href="country.php">Страны</a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/city.php') ? 'active' : '';?>"><a
                                    href="city.php">Города </a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/region.php') ? 'active' : '';?>">
                                <a href="region.php">Районы </a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/subway_stations.php') ? 'active' : '';?>">
                                <a href="subway_stations.php">Метро </a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/highway.php') ? 'active' : '';?>">
                                <a href="highway.php">Направления </a></li>
                            <li class="<?php echo ($_SERVER['SCRIPT_NAME'] == '/admin/contacts.php') ? 'active' : '';?>">
                                <a href="contacts.php">Контакты </a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse active-->
            <!--
          <div class="btn-group pull-right">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <i class="icon-user"></i> <?php echo $Data->User->getName();?>
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="/admin/logout.php">Выйти</a></li>
            </ul>
          </div>
          -->
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="row-fluid">
        <div style="margin:10px auto;">
            <div>
                <div class="page-header">
                    <h1><?php echo $Data->path['current'];?></h1>
                </div>

                <?php echo $content ?>
            </div>
        </div>
        <!--/span-->
    </div>
    <!--/row-->

    <hr>

    <footer>
        <p></p>
    </footer>

</div>
<!--/.fluid-container-->


<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!--    <script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-transition.js"></script>    -->

<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-alert.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-modal.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-dropdown.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-scrollspy.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-tab.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-tooltip.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-popover.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-button.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-collapse.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-carousel.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/bootstrap-typeahead.js"></script>
<script src="<?php echo nga_config::i()->pathClient['tpl'];?>/assets/bootstrap/js/holder.js"></script>


<script>
    $(function () {


        /**
         *
         * IFRAME Height
         */

        $(document).ready(function () {
            $(".subiframe").load(setHeight);
        });
        function setHeight() {

            var iFrame = $(this, parent.document.body);
            //console.log(iFrame.height());
            iFrame.height($(this.contentWindow.document.body).height());
            //iFrame.height($(document.body).height() + 30);
        }


        $(".datepicker").datetimepicker({

            timeText:'Время',
            hourText:'Часы',
            minuteText:'Минуты',
            secondText:'Секунды',
            currentText:'Текущее',
            closeText:'Закрыть',
            timeFormat:'hh:mm:ss',
            dateFormat:"yy-mm-dd"

        });

        $.datepicker.regional['ru'] = {
            closeText:'Закрыть',
            prevText:'<Пред',
            nextText:'След>',
            currentText:'Сегодня',
            monthNames:['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
                'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
            monthNamesShort:['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
                'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
            dayNames:['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
            dayNamesShort:['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
            dayNamesMin:['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
            weekHeader:'Не',
            dateFormat:'dd.mm.yy',
            firstDay:1,
            isRTL:false,
            showMonthAfterYear:false,
            yearSuffix:''
        };
        $.datepicker.setDefaults($.datepicker.regional['ru']);

        $.timepicker.regional['ru'] = {
            timeOnlyTitle:'Выберите время',
            timeText:'Время',
            hourText:'Часы',
            minuteText:'Минуты',
            secondText:'Секунды',
            millisecText:'миллисекунды',
            currentText:'Текущее',
            closeText:'Закрыть',
            ampm:false
        };
        $.timepicker.setDefaults($.timepicker.regional['ru']);



    });
</script>
<style>
    .ui-timepicker-div .ui-widget-header {
        margin-bottom: 8px;
    }

    .ui-timepicker-div dl {
        text-align: left;
    }

    .ui-timepicker-div dl dt {
        height: 25px;
        margin-bottom: -25px;
    }

    .ui-timepicker-div dl dd {
        margin: 0 10px 10px 65px;
    }

    .ui-timepicker-div td {
        font-size: 90%;
    }

    .ui-tpicker-grid-label {
        background: none;
        border: none;
        margin: 0;
        padding: 0;
    }

    .ui-datepicker {
        font-size: 90% !important;
    }
</style>

</body>
</html>










<?php /*


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title></title>
    <link href="<?php echo nga_config::i()->pathClient['css'];?>/common.css" media="screen" rel="stylesheet" type="text/css" />
    
        <!-- Le styles -->
    <link href="<?php echo nga_config::i()->pathClient['css'];?>/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="assets/css/docs.css" rel="stylesheet">
    <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    
    
    <!--<link href="<?php echo nga_config::i()->pathClient['css'];?>/mFrame.css" media="screen" rel="stylesheet" type="text/css" />-->
    <!--<link href="<?php echo nga_config::i()->pathClient['css'];?>/admin.css" media="screen" rel="stylesheet" type="text/css" />-->

</head>
<body>
    <div id ="nav">
        <?php
        $pp = '';
        foreach($path as $p=>$name){
            $pp .=$p;
            echo '<a href="'.$pp.'">'.$name.'</a>&nbsp;/&nbsp;';

        }
        ?>
		<?php echo $nav;?>
    </div>

    <div class="m_frame">
        <div class="m_left">
            <div class="m_top">
                <div class="m_t_l">
                    <div class="m_t_r">
                        <div id="m1_top">
                        <?php //    <a href="<?php echo $this->url(array('controller'=>'guestbook'), 'default', true) ?>"><?php echo $this->url(array('controller'=>'guestbook'), 'default', true) ?></a>                           ?>
                        </div>
                    </div>
                </div>
           </div>

            <div id="m1">
                <?php echo $content ?>
            </div>


             <div class="m_bottom">
                <div class="m_b_l">
                    <div class="m_b_r"></div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
 * 
 *     <div id ="nav">
        <?php
        $pp = '';
        foreach($path as $p=>$name){
            $pp .=$p;
            echo '<a href="'.$pp.'">'.$name.'</a>&nbsp;/&nbsp;';

        }
        ?>
		<?php echo $nav;?>
    </div>
*/
?>