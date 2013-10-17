<?php

class sendForm
{

  function __construct()
  {
    $name = $this->c($_POST["name"]);
    $mail = $this->c($_POST["mail"]);
    $phone = $this->c($_POST["phone"]);
    $msg = $this->c($_POST["msg"]);
    $mailString = "";

    if(!empty($name))
    {
      $mailString .= "Имя: ".$name."\n";
    }

    if(!empty($mail))
    {
      $mailString .= "Почта: ".$mail."\n";
    }

    if(!empty($phone))
    {
      $mailString .= "Телефон: ".$phone."\n";
    }

    if(!empty($msg))
    {
      $mailString .= "Сообщение: ".$msg."\n";
    }

    mail("alkash-00@yandex.ru", "Форма обратной связи МНК-НЕДВИЖИМОСТЬ", $mailString);
    echo "good";
  }

  protected function c($d)
  {
    return trim(strip_tags($d));
  }

}

new sendForm();