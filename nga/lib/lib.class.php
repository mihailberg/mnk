<?php

if (!defined("module_lib")) {
    define("module_lib", true);

    /**
     * NameSpace(class) Lib.
     * PHP4 compatible
     * @author Maisuradze Andrey 2009(c)
     * @version 2.1
     * @name Lib
     */
    class lib
    {

        static function loadLib($lib)
        {
            require_once (nga_config::i()->pathServer['lib'] . '/' . $lib . '.class.php');
        }

        static function loadTable($table)
        {
            require_once (nga_config::i()->pathServer['table'] . '/' . $table . '.php');
        }





        /**
         * Remove any directory
         *
         * @param string $aDir
         */
        static function rm($aDir)
        {
            if (!$dh = @opendir($aDir))
                return;
            while ($obj = readdir($dh)) {
                if ($obj == '.' || $obj == '..')
                    continue;
                if (!@unlink($aDir . '/' . $obj))
                    rm($aDir . '/' . $obj);
            }
            closedir($dh);
            rmdir($aDir);
        }

        /**
         * If image exists - return image path
         * else false
         * 
         * @param string $aPath
         * @return string
         */
        static function image_exist($aPath)
        {
            $f = $aPath . '.';
            if (file_exists($f . "jpg"))
                return $f . "jpg";
            if (file_exists($f . "png"))
                return $f . "png";
            if (file_exists($f . "gif"))
                return $f . "gif";
            if (file_exists($f . "jpeg"))
                return $f . "jpeg";
            return false;
        }

        static function print_email($mailto, $inhref="", $cssclass="")
        {
            $content = '';
            if (!$inhref)
                $inhref = $mailto;
            $content.='<script>';
            $content.='dog=30+34;';
            $content.="email='" . substr($mailto, 0, 2) . "'+'" . substr($mailto, 2, (strpos($mailto, "@") - 2)) . "'+'&#'+dog+';" . substr(strrchr($mailto, "@"), 1) . "';";
            $content.="document.write('<a href=\"mailto:'+email+'\"";
            if ($cssclass)
                $content.= " class=\"$cssclass\"";
            if ($inhref == $mailto)
                $content.= ">'+email+'</a>');</script>";
            else
                $content.= ">$inhref</a>');</script>";
            return $content;
        }

        static $tr = array(
            "Ґ" => "G", "Ё" => "YO", "Є" => "E", "Ї" => "YI", "І" => "I",
            "і" => "i", "ґ" => "g", "ё" => "yo", "№" => "#", "є" => "e",
            "ї" => "yi", "А" => "A", "Б" => "B", "В" => "V", "Г" => "G",
            "Д" => "D", "Е" => "E", "Ж" => "ZH", "З" => "Z", "И" => "I",
            "Й" => "Y", "К" => "K", "Л" => "L", "М" => "M", "Н" => "N",
            "О" => "O", "П" => "P", "Р" => "R", "С" => "S", "Т" => "T",
            "У" => "U", "Ф" => "F", "Х" => "H", "Ц" => "TS", "Ч" => "CH",
            "Ш" => "SH", "Щ" => "SCH", "Ъ" => "'", "Ы" => "YI", "Ь" => "",
            "Э" => "E", "Ю" => "YU", "Я" => "YA", "а" => "a", "б" => "b",
            "в" => "v", "г" => "g", "д" => "d", "е" => "e", "ж" => "zh",
            "з" => "z", "и" => "i", "й" => "y", "к" => "k", "л" => "l",
            "м" => "m", "н" => "n", "о" => "o", "п" => "p", "р" => "r",
            "с" => "s", "т" => "t", "у" => "u", "ф" => "f", "х" => "h",
            "ц" => "ts", "ч" => "ch", "ш" => "sh", "щ" => "sch", "ъ" => "'",
            "ы" => "yi", "ь" => "", "э" => "e", "ю" => "yu", "я" => "ya"
        );

        static function transliterate($str)
        {
            return strtr($str, self::$tr);
        }

        /**
         * XSS Defense
         *
         */
        static function checkXss()
        {
            $url = html_entity_decode(urldecode($_SERVER['QUERY_STRING']));
            if ($url) {
                if (
                    (strpos($url, '<') !== false) ||
                    (strpos($url, '>') !== false) ||
                    (strpos($url, '"') !== false) ||
                    (strpos($url, './') !== false) ||
                    (strpos($url, '../') !== false) ||
                    (strpos($url, '\'') !== false) ||
                    (strpos($url, '.php') !== false)
                ) {
                    die("Hacking attempt!(xss)");
                }
            }
        }

        /**
         * Function for navigation
         *
         * @param unknown_type $nav_block
         * @param unknown_type $page
         * @param unknown_type $max_per_page
         */
        static function PageNav(&$nav_block, $page, $max_per_page, $total=0)
        {
            //
            $gidstr = "";
            if (!empty($_GET['gid'])) {
                $gidstr = "&gid=" . $_GET['gid'];
            }
            //Get total
            if (!$total) {
                $result = nga_config::db()->query("SELECT FOUND_ROWS()");
                if ($r = $result->fetch_row()) {
                    $total = $r[0];
                } else {
                    $total = 1;
                }
            }


            $page_num = 1;
            if ($total > $max_per_page) {
                $page_num = floor($total / $max_per_page);
                if (($total % $max_per_page) != 0)
                    $page_num++;
            }else {
                return;
            }

            //QS
            $QS = '';
            $i = 0;
            foreach ($_GET as $var => $value) {
                if ($var != "page" && $var != "gid" && $var != "id" && $var != "action") {
                    $QS .= "$var=$value&";
                }
            }
            $QS = "?" . $QS;
            
            $start = 1;
            $end = 9;
            
            $current = $page;
            $start = (($current - 4) > 1) ? ($current - 4) : 1;
            $end = ($page_num < 10) ? $page_num : ($start + 9);


            $disabled = ($page == 1) ? ' class="disabled"' : '';

            $nav_block = '<div class="pagination"><ul>';
            $nav_block.= '<li' . $disabled . '><a href="' . $_SERVER['PHP_SELF'] . $QS . 'page=' . ($current - 1) . $gidstr . '">&laquo;</a></li>';

            for ($i = $start; $i <= $end; $i++) {
                $a = ($i == $page) ? ' class="active"' : '';
                $nav_block .= '<li' . $a . '><a href="' . $_SERVER['PHP_SELF'] . $QS . 'page=' . $i . $gidstr . '">' . $i . "</a></li> ";
            }
            $disabled = ($page == $page_num) ? ' class="disabled"' : '';
            $nav_block.= '<li' . $disabled . '><a href="' . $_SERVER['PHP_SELF'] . $QS . 'page=' . ($current + 1) . $gidstr . '">&raquo;</a></li>';
            $nav_block .= '                
  </ul>
</div>';



            /*
              $dec = floor( ($page - 1) / 10);
              if($dec > 0) {
              $nav_block .= '<li><a href="'.$_SERVER['PHP_SELF'].$QS.'page=1'.$gidstr.'">1</a> &#133; </li>';
              if($dec > 2) {
              $pcntr = floor($dec/2)*10;
              $nav_block .= '<li><a href="'.$_SERVER['PHP_SELF'].$QS.'page='.$pcntr.$gidstr.'">'.$pcntr."</a> &#133; </li>";
              }
              }
             */


            /*

              for($i = 1; $i < 12; $i++) {
              $pn = ($page - 1) + $i;
              if($pn <= $page_num) {
              if($i == 11) {
              $nav_block .= '<li><a href="'.$_SERVER['PHP_SELF'].$QS.'page='.$pn.$gidstr.'">&raquo;</a></li>';
              }else {
              $a = ($pn == $page)?' class="active"':'';
              $nav_block .= '<li'.$a.'><a href="'.$_SERVER['PHP_SELF'].$QS.'page='.$pn.$gidstr.'">'.$pn."</a></li> ";
              }
              }
              }
             * 
             */
            return $nav_block;
        }


        static function MakeEnding($a, $one, $two, $three)
        {
            $c = (string) $a;
            $x2 = (strlen($c) == 1) ? 0 : $c{(strlen($c) - 2)};

            //echo $a{0};
            if ($c > 0) {
                if ($c{(strlen($c) - 1)} == 1 && ((strlen($c) == 1) || $x2 != 1))
                    return $one;
                if ($c{(strlen($c) - 1)} >= 2 && $c{(strlen($c) - 1)} < 5 && $x2 != 1)
                    return $two;
                if (($c{(strlen($c) - 1)} >= 5 || $c{(strlen($c) - 1)} == 0) || $c{(strlen($c) - 2)} == 1)
                    return $three;
            }
            else
                return $three;
        }

        static function NumWithZero($num)
        {
            if (strlen($num) == 1)
                return '0' . $num;
            else
                return $num;
        }

        static function GetMicrotime()
        {
            list ($usec, $sec) = explode(" ", microtime());
            return ((float) $usec + (float) $sec);
        }

        /**
         * Warning! if type=Array not check.
         *
         * @param string $varName
         * @param string $regexp
         * @param string $type
         * @param mixed $default
         * @param string $method
         * @return $type
         */
        static function getData($varName, $regexp, $type="string", $default='', $method='PS')
        {
            $returnValue = $default;
            //Cookie
            if (strpos($method, "C") !== false) {
                $returnValue = self::getDataSimple($_COOKIE, $varName, $regexp, $default);
            }
            //Session
            if (strpos($method, "S") !== false) {
                $returnValue = self::getDataSimple($_SESSION, $varName, $regexp, $default);
            }
            //Get
            if (strpos($method, "G") !== false) {
                $returnValue = self::getDataSimple($_GET, $varName, $regexp, $default);
            }
            //Post
            if (strpos($method, "P") !== false) {
                $returnValue = self::getDataSimple($_POST, $varName, $regexp, $default);
            }


            if ($type == "string")
                $returnValue = (string) $returnValue;
            if ($type == "int")
                $returnValue = (int) $returnValue;
            if ($type == "float")
                $returnValue = (float) $returnValue;
            if ($type == "bool")
                $returnValue = (bool) $returnValue;
            return $returnValue;
        }

        static function getDataSimple(&$currentArray, $varName, $regexp, $default = '')
        {
            if (IsSet($currentArray[$varName])) {
                if (is_array($currentArray[$varName])) {
                    return $currentArray[$varName];
                }
                if (preg_match($regexp, $currentArray[$varName])) {
                    $returnValue = $currentArray[$varName];
                }
            } else {
                $returnValue = $default;
            }
            return $returnValue;
        }

        static function alert($obj)
        {
            ob_start("obj");
            print_r($obj);
            $a = ob_get_contents();
            ob_end_clean();
            $a = str_replace("\n", "\\n", $a);
            $a = str_replace("\t", "\\t", $a);
            die("<script>alert('" . $a . "');</script>");
        }

        static function SaveDebug($microtime, $action, $info = 'null')
        {
            $microtime = lib :: GetMicrotime() - $microtime;
            $debug = debug_backtrace();

            //Определяем кто вызвал класс.
            $count = 0;
            foreach ($debug as $level => $data) {
                $count = $level;
                if ($data['class'] != __CLASS__) {
                    break;
                }
            }

            return $action . ' : ' . $info . ' ; ' . $debug[$count]['file'] . '::' . $debug[$count]['function'] . '::' . $debug[$count]['line'] . ' (' . $microtime . 'ms)';
        }

        static function TrueResize($pictfrom, $pictfor, $x=300, $y=300, $thX=90, $thY=90)
        {
            $fin_resize = true; // ресайз картинок происходит в конце функции
            //$pict=путь к залитой картинке, все картинки которые получаются заливаем по тому же пути но с дополнениями th И pp
            $picsize = getimagesize($pictfrom);

            $x_src = $picsize[0];
            $y_src = $picsize[1];
            $xcoef = $x / $x_src;
            $ycoef = $y / $y_src;

            if ($picsize[2] == 2) {  //если это JPG
                $img_src = imagecreatefromjpeg($pictfrom);
            }
            if ($picsize[2] == 1) { //если это GIF
                $img_src = imagecreatefromgif($pictfrom);
            }
            $img_scr_white = imagecreatetruecolor($x, $y);

            $img_main = imagecreatetruecolor($x, $y);
            $img_th = imagecreatetruecolor($thX, $thY);

            imagecopyresized($img_main, $img_scr_white, 0, 0, 0, 0, $x, $y, 1, 1);

            if (($x_src >= 90 && $y_src >= 90) || $x_src >= 300 || $y_src >= 300) {
                if ($xcoef >= 1 && $ycoef >= 1) {
                    // без попапа, рисунок становится по центру квадрата 300на300
                    // без попапа, рисунок становится по центру квадрата 300на300
                    if ($xcoef <= $ycoef)
                        $max = $x_src;
                    else
                        $max = $y_src;
                    $img_big_square = imagecreatetruecolor($max, $max);
                    imagecopyresized($img_big_square, $img_scr_white, 0, 0, 0, 0, $max, $max, 1, 1);


                    $x_dst_st = round(($max - $x_src) / 2);
                    $y_dst_st = round(($max - $y_src) / 2);
                    $x_dst_fin = $max - round(($max - $x_src));
                    $y_dst_fin = $max - round(($max - $y_src));

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src;

                    imagecopyresampled($img_big_square, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                    imagecopyresampled($img_th, $img_big_square, 0, 0, 0, 0, 90, 90, $max, $max);


                    //----------------------------------------------------------
                    $fin_resize = false;

                    $img_big = '';
                    $x_dst_st = round((300 - $x_src) / 2);
                    $y_dst_st = round((300 - $y_src) / 2);
                    $x_dst_fin = 300 - round((300 - $x_src));
                    $y_dst_fin = 300 - round((300 - $y_src));

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src;
                }
                if ($xcoef >= 1 && $ycoef < 1) {

                    $img_big = $img_src;
                    $x_dst_st = round((300 - $x_src) / 2);
                    $y_dst_st = 0;
                    $x_dst_fin = 300 - round((300 - $x_src));
                    $y_dst_fin = 300;

                    $x_src_st = 0;
                    $y_src_st = round(($y_src - 300) / 2);
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src - round(($y_src - 300));
                    // длинный по вертикали рисунок идет в попап и вырезается из него 300 на 300 посередине	
                    //echo "2";
                }
                if ($xcoef < 1 && $ycoef >= 1) {

                    $img_big = $img_src;
                    $x_dst_st = 0;
                    $y_dst_st = round((300 - $y_src) / 2);
                    $x_dst_fin = 300;
                    $y_dst_fin = 300 - round((300 - $y_src));

                    $x_src_st = round(($x_src - 300) / 2);
                    $y_src_st = 0;
                    $x_src_fin = $x_src - round(($x_src - 300));
                    $y_src_fin = $y_src;

                    // длинный по горизонтали рисунок идет в попап и вырезается из него 300 на 300 посередине	
                    //echo "2.5";
                }
                if (($xcoef < 1 && $ycoef < 1)) {

                    $img_big = $img_src;
                    if ($xcoef <= $ycoef)
                        $max = $x_src;
                    else
                        $max = $y_src;
                    $img_big_square = imagecreatetruecolor($max, $max);
                    imagecopyresized($img_big_square, $img_scr_white, 0, 0, 0, 0, $max, $max, 1, 1);


                    $x_dst_st = round(($max - $x_src) / 2);
                    $y_dst_st = round(($max - $y_src) / 2);
                    $x_dst_fin = $max - round(($max - $x_src));
                    $y_dst_fin = $max - round(($max - $y_src));

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src;

                    imagecopyresampled($img_big_square, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                    $img_src = $img_big_square;
                    $x_dst_st = 0;
                    $y_dst_st = 0;
                    $x_dst_fin = 300;
                    $y_dst_fin = 300;

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src - round(($x_src - $max));
                    $y_src_fin = $y_src - round(($y_src - $max));
                    // рисунок идет в попап и сжимается до 300[+] на 300[+] и вырезается из него 300 на 300 посередине	
                    //echo "3";
                }

                imagecopyresampled($img_main, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                if ($fin_resize)
                    imagecopyresampled($img_th, $img_main, 0, 0, 0, 0, 90, 90, 300, 300);
            }
            else {
                $img_big = '';

                if ($x_src <= 90 && $y_src <= 90) {
                    // без попапа, рисунок становится по центру квадрата 300на300



                    $x_dst_st = round((300 - $x_src) / 2);
                    $y_dst_st = round((300 - $y_src) / 2);
                    $x_dst_fin = $max - round((300 - $x_src));
                    $y_dst_fin = $max - round((300 - $y_src));

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src;


                    imagecopyresampled($img_main, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                    imagecopyresized($img_th, $img_scr_white, 0, 0, 0, 0, 90, 90, 1, 1);

                    $x_dst_st = round((90 - $x_src) / 2);
                    $y_dst_st = round((90 - $y_src) / 2);
                    $x_dst_fin = $max - round((90 - $x_src));
                    $y_dst_fin = $max - round((90 - $y_src));

                    imagecopyresampled($img_th, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                    $fin_resize = false;
                } else {
                    // если (90<`какаянить сторона`<300) а `вторая`<90, т е ресайз только для превью
                    if ($xcoef <= $ycoef)
                        $max = $x_src;
                    else
                        $max = $y_src;

                    $x_dst_st = round((300 - $x_src) / 2);
                    $y_dst_st = round((300 - $y_src) / 2);
                    $x_dst_fin = 300 - round((300 - $x_src));
                    $y_dst_fin = 300 - round((300 - $y_src));

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src;


                    imagecopyresampled($img_main, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                    if ($xcoef <= $ycoef)
                        $max = $x_src;
                    else
                        $max = $y_src;
                    $img_square = imagecreatetruecolor($max, $max);
                    imagecopyresized($img_square, $img_scr_white, 0, 0, 0, 0, $max, $max, 1, 1);

                    $x_dst_st = round(($max - $x_src) / 2);
                    $y_dst_st = round(($max - $y_src) / 2);
                    $x_dst_fin = $max - round(($max - $x_src));
                    $y_dst_fin = $max - round(($max - $y_src));

                    $x_src_st = 0;
                    $y_src_st = 0;
                    $x_src_fin = $x_src;
                    $y_src_fin = $y_src;

                    imagecopyresampled($img_square, $img_src, $x_dst_st, $y_dst_st, $x_src_st, $y_src_st, $x_dst_fin, $y_dst_fin, $x_src_fin, $y_src_fin);

                    imagecopyresampled($img_th, $img_square, 0, 0, 0, 0, 90, 90, $max, $max);
                }
            }
            $th_name = substr_replace($pictfor, '_th.', -4, 1);
            $name = $pictfor;
            $pu_name = substr_replace($pictfor, '_pu.', -4, 1);

            if ($picsize[2] == 2) {
                //header("Content-type: image/jpeg");
                if ($img_big)
                    if (!$this->ImgMode)
                        imagejpeg($img_big, PATH_ROOT . $pu_name);
                    else
                        $img_main = $img_big;
                imagejpeg($img_main, PATH_ROOT . $name, 75);
                //$imgg = imagecreatetruecolor(300,300); 
                imagejpeg($img_th, PATH_ROOT . $th_name, 75);
            }

            if ($picsize[2] == 1) {
                //header("Content-type: image/gif");
                if ($img_big)
                    if (!$this->ImgMode)
                        imagegif($img_big, PATH_ROOT . $pu_name);
                    else
                        $img_main = $img_big;
                imagegif($img_main, PATH_ROOT . $name);
                imagegif($img_th, PATH_ROOT . $th_name);
            }
            $content = $th_name . "','" . $name;
            if (!$this->ImgMode)
                $content.="','" . $pu_name;
            //echo  $content;
            //exit;
            return $content;
        }

        /** Функция для запрета кэширования страницы браузером.
         *
         * @version 1.0.4
         * @charset ANSI
         */
        static function noCache()
        {
            ini_set('session.cache_limiter', 'nocache'); #добавляем HTTP заголовок Expires
            ini_set('session.cache_expire', 0);          #добавляем HTTP заголовок Cache-Control
            #header('Expires: Thu, 01 Jan 1998 00:00:00 GMT');
            #header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
            #динамическая генерация даты, возможно, позволит не "отпугнуть" роботов-индексаторов поисковых систем.
            header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');
            header('Last-Modified: ' . gmdate('D, d M Y H:i:s', strtotime('-1 day')) . ' GMT');

            # HTTP/1.1
            header('Cache-Control: no-store, no-cache, must-revalidate');
            header('Cache-Control: post-check=0, pre-check=0', false);
            header('Cache-Control: max-age=0', false);
            # HTTP/1.0
            header('Pragma: no-cache');
        }

        /**
         * Return associative key by number.
         *
         * @param Array &$array
         * @param Int $num
         * @return String
         */
        static function getArrayKey(&$array, $num)
        {
            for ($i = 0; $i <= $num; $i++) {
                next($array);
            }
            $key = key($array);
            reset($array);
            return $key;
        }

        static function php2js($php = array(), $name = 'foo', $useVar = TRUE)
        {
            $str = '';
            if (!is_array($php)) {
                trigger_error('The frist parameter has to be an array', E_USER_ERROR);
                die();
            }

            static $first = TRUE;
            if ($first) {
                if ($useVar) {
                    $str.= 'var ';
                }
                $str.= $name . ' = ';
                $first = FALSE;
            }

            $str.= "new Array();\n";
            foreach ($php as $key => $value) {
                $OName = $name . '[';
                if (is_numeric($key)) {
                    $OName .= $key;
                } else {
                    $OName .= '"' . $key . '"';
                }
                $OName .= ']';

                $str.= $OName . ' = ';

                if (is_array($value)) {
                    $str.=self::php2js($value, $OName, FALSE);
                } else {
                    if (is_numeric($value)) {
                        $str.= $value;
                    } else {
                        $str.= '"' . $value . '"';
                    }
                    $str.= ";\n";
                }
            }
            return $str;
        }

        static function pre($object)
        {
            echo '<pre>';
            print_r($object);
            echo '</pre>';
        }

    }

}
?>
