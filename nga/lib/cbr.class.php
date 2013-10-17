<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cbr
 *
 * @author ng
 */
class cbr
{
    
    const URL = "http://www.cbr.ru/scripts/XML_daily.asp?date_req=";
    private $USD;
    private $EUR;
    
    public function __construct()
    {
        $this->loadQuotes();
    }
    
    public function getUSD(){
        return $this->USD;
    }
    public function getEUR(){
        return $this->EUR;
    }
    
    private function loadQuotes(){
        /*
        $proxy_name = 'адрес.прокси.сервера';
        $proxy_port = 3128; // порт прокси
        $proxy_user = "логин";
        $proxy_pass = "пароль";
        $date = date("d/m/Y");
        $text="";
        $request_url = $date";// линк

        $proxy_fp = fsockopen($proxy_name, $proxy_port);
        if (!$proxy_fp)
            return false;
        fputs($proxy_fp, "GET $request_url HTTP/1.0\r\nHost: $proxy_name\r\n");
        fputs($proxy_fp, "Proxy-Authorization: Basic ". base64_encode ("$proxy_user:$proxy_pass")."\r\n\r\n");
        while(!feof($proxy_fp)){
            $text .= fread($proxy_fp, 4096);
        }
       fclose($proxy_fp);
        */
      $text = file_get_contents(self::URL.date("d/m/Y"));
      $pattern = "#<Valute ID=\"([^\"]+)[^>]+>[^>]+>([^<]+)[^>]+>[^>]+>[^>]+>[^>]+>[^>]+>[^>]+>([^<]+)[^>]+>[^>]+>([^<]+)#i";
      preg_match_all($pattern, $text, $out, PREG_SET_ORDER);
      $dollar = "";
      $euro = "";

      foreach($out as $cur)
      {
        if($cur[2] == 840) $this->USD = str_replace(",",".",$cur[4]);
        if($cur[2] == 978) $this->EUR   = str_replace(",",".",$cur[4]);
      }
    }
}

?>
