<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Демонстрационная версия CMS</title>
    <link href="/metro/css/metro-map.css" rel="stylesheet" type="text/css"/>

    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script>

        markers = {};

        $('document').ready(function () {


        });


        $('#eliteMap').live('click', function (e) {

            var top = parseInt(e.clientY - 15) + $(document).scrollTop();
            var left = parseInt(e.clientX - 15) + $(document).scrollLeft();

            $(this).append('<div style="top:' + top + 'px;left: ' + left + 'px;" class="marker"></div>');
            return false;
        });


    </script>
    <style>
        body {
            margin: 0px;
        }

        #eliteMap {
            background: url('metro/img/metro-map-rus1.gif');
            position: relative;
            width: 607px;
            height: 804px;
        }

        .marker {
            position: absolute;
            width: 30px;
            height: 30px;
            background: #00A6C7;
        }

    </style>
</head>
<body>

<div id="eliteMap">

</div>


</body>
</html>