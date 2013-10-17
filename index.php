<?php
session_start();
/*ddos detector*/
//array_walk($_SESSION, 'unset');
/*
$time=getmicrotime();
if (isset($_SESSION["time"])) {
	if (($time-$_SESSION["time"])<0.4) {
		$_SESSION["block"]=true;
	}
}
$_SESSION["time"]=$time;

if (isset($_SESSION["block"])) {
	if ($_SESSION["block"]==true) {
		header('HTTP/1.0 503 Service Unavailable');
		echo @file_get_contents('503.html');
		flush();
		die();
	}
}
*/
/*end of ddos detector*/

//print_r($_SERVER);
//if(!ini_get('zlib.output_compression')) @ob_start("ob_gzhandler");
header("Expires: Mon, 12 Jul 2005 12:13:13 GMT"); // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
header("Cache-Control: no-store, no-cache, must-revalidate"); // HTTP/1.1
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header('Content-Type: text/html; charset=utf-8');
function getmicrotime()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

$time_start = getmicrotime();
define("time_start", $time_start);
setlocale(LC_ALL, "ru_RU.UTF8");

set_include_path($_SERVER['DOCUMENT_ROOT']);

require_once('nga/lib/nga.php');

/**
 * URL
 */

$routes = array(
    'novostrojki' => 'newFlat',
    'gorodskaja-nedvizhimost' => 'flat',
    'kommercheskaja-nedvizhimost' => 'commercial',
    'zagorodnaja-nedvizhimost' => 'land',
    'zarubezhnaja-nedvizhimost' => 'foreign',
    'elitnaja-nedvizhimost' => 'elite',
    'proekty-dlja-investirovanija' => 'invest',
    'luchshiye-predlozheniya' => 'best',
    '' => 'site',
    'news' => 'news'
);

//var_dump($_SERVER['REQUEST_URI']);
if (mb_strlen($_SERVER['REQUEST_URI']) > 1 && mb_substr($_SERVER['REQUEST_URI'], -1) == '/') {
    $ref = mb_substr($_SERVER['REQUEST_URI'], 0, -1);
    header('HTTP/1.1 301 Moved Permanently');
    header('Location: http://' . $_SERVER['HTTP_HOST'] . '' . $ref);
    exit();

    //require_once 'app/controllers/ngaController.class.php';
    //require_once 'app/controllers/page.class.php';
    //new page(array(0));
    //die();
}
if(!isset($_SERVER['REDIRECT_URL'])){
    $_SERVER['REDIRECT_URL'] = $_SERVER['REQUEST_URI'];
    if($pos = mb_strpos($_SERVER['REDIRECT_URL'],'?',1)){
        $_SERVER['REDIRECT_URL'] = mb_substr($_SERVER['REDIRECT_URL'],0,$pos);
    }
//    print_r($_SERVER);
}
$url = explode("/", strtolower(trim($_SERVER['REDIRECT_URL'], ' /')));
//echo $_SERVER['REQUEST_URI'];
//echo count($url);
//print_r($url);


$firstUrl = $url[0];

require_once 'app/controllers/ngaController.class.php';

if (isset($routes[$firstUrl])) {
    require_once 'app/controllers/' . $routes[$firstUrl] . '.class.php';
    $control = new $routes[$firstUrl]($url);
} else {
    require_once 'app/controllers/page.class.php';
    new page($url);
}
$time_end = getmicrotime();
//echo $time_end-$time_start;
?>