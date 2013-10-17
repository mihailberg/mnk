<?php



    if(isset($_POST['callbackform'])){
        $name = strip_tags(trim($_POST['name']));
        $email = strip_tags(trim($_POST['email']));
        $phone = strip_tags(trim($_POST['phone']));
        $msg = strip_tags(trim($_POST['msg']));

        if($name == "")$name = "Не указано";
        if($email == "")$email = "Не указан";

        mail('alkash-00@yandex.ru', "Форма обратной связи", "Имя: $name\nEmail: $email\nТелефон: $phone\nСообщение: $msg");

        $host = 'advseo.mysql';
        $base = 'advseo_estate';
        $user = 'advseo_andrey';
        $pass = 'dq1tloi5';

        $connect = mysql_connect($host, $user, $pass);

        if($connect){
            mysql_select_db($base);
            mysql_query("set character_set_client='utf8'");
            mysql_query("set character_set_results='utf8'");
            mysql_query("set collation_connection='utf8_general_ci'");
            mysql_query("INSERT INTO application SET name='".$name."', email='".$email."', phone='".$phone."', content='".$msg."', date='".date('Y-m-d H:i:s')."'");
        }else{
            die('Не удалось соединиться с базой данных');
        }

        mysql_close();

        echo 1;
    }