<?php
header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Fine Uploader</title>
        <meta charset="utf-8" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="/services/client/fineuploader.css" rel="stylesheet" type="text/css"/>
        <script src="/services/client/js/header.js"></script>
        <script src="/services/client/js/util.js"></script>
        <script src="/services/client/js/button.js"></script>
        <script src="/services/client/js/handler.base.js"></script>
        <script src="/services/client/js/handler.form.js"></script>
        <script src="/services/client/js/handler.xhr.js"></script>
        <script src="/services/client/js/uploader.basic.js"></script>
        <script src="/services/client/js/dnd.js"></script>
        <script src="/services/client/js/uploader.js"></script>
        <script src="/services/client/js/jquery-plugin.js"></script>
        <script src="/services/test/js/uploader-demo-jquery.js"></script>
        <style type="text/css">
            li{
                height:130px;
                padding:5px;
                background: #fff;
                margin:3px;
            }
            li.qq-upload-success{
                display: none;
            }
            li span{
                margin-left: 10px;
                height:130px;

            }
            li span.upload_thumb{
                width:160px;
                padding: 5px 5px;
                text-align: center;
                display: inline-block;
                border:1px solid #777;
            }
        </style>
    </head>
    <body>

                <form method="post">
                    <ul id="basicUploadSuccessExample" class="unstyled"></ul>


                    <input type="submit" value="Сохранить" />
                </form>

    </body>
</html>

