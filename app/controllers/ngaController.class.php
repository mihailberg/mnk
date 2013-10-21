<?php
/**
 * Description of ngaController
 *
 * @author ng
 */
abstract class ngaController
{
    const TPL_EXT = '.tpl.php';
    protected $action = 'index';
    protected $model;
    protected $pathViews = 'app/views';
    protected $layout = 'layout';
    protected $noLayout = false;
    protected $tpl = '';
    protected $content;

    protected $layoutData = array('title' => 'Страница не найдена. 404', 'content' => 'Страница не найдена. Ошибка 404.', 'h1' => 'Ошибка, страница не найдена. 404 ', 'searchurl' => '/all');
    protected $tplData = array();
    protected $fullUrl;
    public $page = 1;
    public $perPage = 10;


    public $districts = array('', 'ЦАО', 'САО', 'ЗАО', 'ВАО', 'ЮАО', 'СВАО', 'СЗАО', 'ЮЗАО', 'ЮВАО');
    /**
     * Название текщего раздела/сущности. Например land
     * @var
     */
    public $entityName;
    /**
     * реальное имя основной таблицы
     * @var
     */
    public $tableName;

    public function __construct($url)
    {
        $this->fullUrl = $url;
        $firstUrl = array_shift($url);
        if (count($url) != 0) {
            $this->action = ucfirst(strtolower($url[0]));
        }
        if (isset($_GET['ajax'])) {
            $this->noLayout = true;
        }

        $this->checkCurrency();
        $this->varsPrepare();

        //Make method name
        $method = 'action' . $this->action;
        if(count($url)){
            $page_match = array();
            if(preg_match('/page([0-9]{1,9})/', $url[count($url)-1], $page_match)){
                $this->page = (int)$page_match[1];
            }
        }

        //Try to execute method
//        echo $method;
//        print_r($this);
//        print_r($_GET);
        if (method_exists($this, $method)) {
            $firstUrl = array_shift($url);
            if ($this->$method($url) === false) {
                $this->page404();
            }
        } else {
            $this->page404();
            //die("Page ".$this->action." Doesn't exist.");
        }
        $this->show();
    }

    public function page404()
    {
        $this->layout = 'layout_white';
        $this->tpl = 'page';


        $this->tplData['h1'] = '404. Страница не найдена';
        $this->layoutData['title'] = '404. Страница не найдена';
        $this->tplData['content'] = "Страница не найдена.";
        $this->show();
        die();
    }

    public function getAction()
    {
        return $this->action;
    }

    abstract function actionIndex();

    protected function parseTpl($tpl, $data)
    {
        ob_start();
        extract($data);
        require_once $_SERVER['DOCUMENT_ROOT'] . '/' . $this->pathViews . '/' . $tpl . self::TPL_EXT;
        return ob_get_clean();
    }

    protected function show()
    {
        $content = '';

        if ($this->tpl != '') {
            $this->layoutData['content'] = $this->parseTpl($this->tpl, $this->tplData);
        }

        //Common layout
        if ($this->noLayout) {
            echo $this->layoutData['content'];
        } else {
            echo $this->parseTpl($this->layout, $this->layoutData);
        }
    }


    public $currencyList = array(
        1 => 'руб.',
        2 => '$ ',
        3 => 'евро'
    );

    public $currencyValue = 1;

    public $currSettings = array();
    public $exchange = array();

    public function checkCurrency()
    {
        if (!isset($_SESSION['currency'])) $_SESSION['currency'] = 1;
        if (!empty($_GET['currency']) && array_key_exists((int)$_GET['currency'], $this->currencyList)) {
            $_SESSION['currency'] = (int)$_GET['currency'];
        }

        include('nga/tables/settings.php');
        $this->currSettings = $settings = $tableSettings->getData();

        //for calculates
        foreach($this->currSettings as $row){
			$this->exchange[$row['tid']] = $row['value'];
		}

        //For save search currency
        if ($_SESSION['currency'] > 1) {
            $this->currencyValue = $settings[$_SESSION['currency']]['value'];
        }
    }

    public function varsPrepare()
    {
        if(!isset($_SESSION['currency']))       $this->checkCurrency();

        include 'nga/tables/contacts.php';
        $this->layoutData['contacts'] = $this->tplData['contacts'] = $tableContacts->getData();

        $this->layoutData['currencyList'] = $this->tplData['currencyList'] = $this->currencyList;
        $this->layoutData['currency'] = $this->tplData['currency'] = $_SESSION['currency'];
        $this->layoutData['currencyValue'] = $this->tplData['currencyValue'] = $this->currencyValue;

        $this->layoutData['currSettings'] = $this->tplData['currSettings'] = $this->currSettings;

        $this->layoutData['urlArray'] = $this->fullUrl;
        $this->tplData['urlArray'] = $this->fullUrl;
    }

    public function makeRoomSql()
    {
        $isRoom = 0;
        $more = 0;
        $in = array();
        foreach ($_GET['room'] as $r) {
            if ((int)$r > 5 || (int)$r < 1) {
                die("Don't hack this");
            }

            switch ($r) {
                case 1:
                    $isRoom = 1;
                    break;
                case 2:
                case 3:
                case 4:
                    $in[] = $r - 1;
                    break;
                case 5:
                    $more = 1;
                    break;
            }
        }
        if ($isRoom)
            $glue = ' || ';
        else $glue = ' AND ';

        $sql = "(
         `isroom` = " . $isRoom . " ";

        if (count($in) && $more) {
            $sql .= $glue . ' ( `room` in(' . implode(",", $in) . ') || `room` >= 4 )';
        } elseif (count($in) && !$more){
            $sql .= $glue . ' `room` in(' . implode(",", $in) . ')';
        } elseif ($more && !count($in)) {
            $sql .= $glue . '`room` >= 4';
        }
        //Close All
        $sql .= " )";
        return $sql;
    }

    protected function getPhoto($type, $id)
    {
        $res = nga_config::db()->query("SELECT * FROM `photo` WHERE `R_TYPE` = " . (int)$type . " AND `R_ID` =" . (int)$id . "");
        if (!$res) return array();
        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['photoID']] = $row;
        }
        return $data;
    }
    protected function getFiles($type, $id)
    {
        $res = nga_config::db()->query("SELECT * FROM `file` WHERE `R_TYPE` = " . (int)$type . " AND `R_ID` =" . (int)$id . "");
        if (!$res) return array();
        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['fileID']] = $row;
        }
        return $data;
    }

    protected function pagination($url){
        $page = $this->page;
        $nav_block = '';
        $page_num = 1;
        if ($resultCount > $this->perPage) {
            $page_num = floor($resultCount / $this->perPage);
            if (($resultCount % $this->perPage) != 0)
                $page_num++;
        }else {
            return;
        }


    $start = 1;
    $end = 9;

    $current = $page;
    $start = (($current - 4) > 1) ? ($current - 4) : 1;
    $end = ($page_num < 10) ? $page_num : ($start + 9);


    $disabled = ($page == 1) ? ' class="disabled"' : '';
    $qs = (!empty($_SERVER['QUERY_STRING'])) ? '?'.$_SERVER['QUERY_STRING']:'';


    $url = '/gorodskaja-nedvizhimost/'.mb_strtolower($this->getAction()).'/page';

    $nav_block = '<div class="pagination"><ul>';
    $nav_block.= '<li' . $disabled . '>';
    if(!$disabled)  $nav_block.=  '<a href="' . $url . ($current - 1) .$qs . '">';
        else $nav_block.='<span>';

    $nav_block.=  '&laquo;';
    if(!$disabled)  $nav_block.=  '</a>';
    else $nav_block.='</span>';
    $nav_block.=  '</li>';

    for ($i = $start; $i <= $end; $i++) {
        $a = ($i == $page) ? ' class="active"' : '';
        $nav_block .= '<li' . $a . '><a href="' . $url . $i .$qs .' ">' . $i . "</a></li> ";
    }
    $disabled = ($page == $page_num) ? ' class="disabled"' : '';

    $nav_block.= '<li' . $disabled . '>';
    if(!$disabled)  $nav_block.=  '<a href="' . $url . ($current + 1) . $qs . '">';
        else $nav_block.='<span>';

    $nav_block.=  '&raquo;';
    if(!$disabled)  $nav_block.=  '</a>';
    else $nav_block.='</span>';
    $nav_block.=  '</li>';

    $nav_block .= '</ul></div>';
    return $nav_block;
    }



    protected function getFoundRows()
    {
        $result = nga_config::db()->query("SELECT FOUND_ROWS()");
        if ($r = $result->fetch_row()) {
            $foundRows = $r[0];
        } else {
            $foundRows = 1;
        }
        return $foundRows;
    }

    protected function getSimilarObjects($table, $id, $price, $photoType, $addWhere = '', $priceColumn = 'price', $squareColumn = 'square', $idField = false)
    {
        if (empty($price)) $price = 0;
        if (!$idField) $idField = $table . "ID";

        $sql = "
                SELECT * FROM (
                	SELECT
                	 t .`" . $idField . "` as `tid`,
                	 t." . $squareColumn . " as `square`,
                	 t." . $priceColumn . " as `price`,
                	 photo.THUMB, photo.MID

                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE " . $priceColumn . "<= " . $price . " AND t.`" . $idField . "` != " . (int)$id . "
                	" . $addWhere . "
                	ORDER BY `price` DESC,  `photo`. `photoID` ASC
                	LIMIT 1) a UNION
                SELECT * FROM (
                	SELECT t .`" . $idField . "` as `tid`,
                	t." . $squareColumn . " as `square`,
                	t." . $priceColumn . " as `price`,
                	 photo.THUMB, photo.MID
                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE " . $priceColumn . ">= " . $price . " AND t.`" . $idField . "` != " . (int)$id . "
                    " . $addWhere . "
                	ORDER BY `price` ASC, `photo`. `photoID` ASC
                	LIMIT 2
                ) b
                GROUP BY `tid`
                ";

        $res = nga_config::db()->query($sql);
//        echo $sql;
        if (!$res){
            echo nga_config::db()->error; // return false;
            echo $sql;
            debug_print_backtrace();
        }

        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['tid']] = $row;
        }
        return $data;
    }



    /**
     * Multiselect Values 2 array
     *
     * @param $str
     * @return array
     */
    public function value2Array($str){
//        var_dump(func_get_args());
//        debug_print_backtrace();
        $r = explode('_',$str);
        if(count($r)>1){
            array_pop($r);
            array_shift($r);
        }
        return $r;
    }

    /**
     * Array 2 multiselect values string
     *
     * @param $value
     * @return string
     */
    public function array2Value($value){
        return '_'.implode("_",$value).'_';
    }


    /**
     * Make sql for similar objects FORMAT " (column like %%) "
     *
     * @param $column `type`
     * @param $data
     * @return string
     */
    public static function makeMultiSelectSql($column,$data){
        $SQL = '';
        if(count($data)>0&&(int)$data[0]!=0){
            foreach($data as $k=>$v){
                $SQL .=" ".$column." LIKE '%_".$v."_%' OR";
            }

            $SQL = ' ('.mb_substr($SQL,0,-2).') ';
        }
        return $SQL;
    }

    protected function assignDistrict(){
        $this->tplData['district'] = array('', 'ЦАО', 'САО', 'ЗАО', 'ВАО', 'ЮАО', 'СВАО', 'СЗАО', 'ЮЗАО', 'ЮВАО');
        return $this->tplData['district'];
    }

    protected function assignMetro($elite = false)
    {
        include ('nga/tables/subway_stations.php');
        $subway_stations->perPage = 1000;
        if($elite === 1) $subway_stations->addWhere('elite','1','=');
        if($elite === 0) $subway_stations->addWhere('elite','0','=');
        $this->tplData['metro'] = $subway_stations->getData();
    }

    protected function assignHighway($elite = false)
    {
        include ('nga/tables/highway.php');
        $highway->perPage = 1000;
        if($elite === 1) $highway->addWhere('elite','1','=');
        if($elite === 0) $highway->addWhere('elite','0','=');
        $this->tplData['highway'] = $highway->getData();
    }

    protected function assignCountry()
    {
        include ('nga/tables/country.php');
        $country_table->perPage = 1000;
        $this->tplData['country'] = $country_table->getData();
    }

    protected function assignCity($t = '')
    {
        include ('nga/tables/city.php');
        $city->perPage = 1000;
        if($t == 'noMsk'){
            $city->addWhere('cityID', '1', '!=');
        }
        $this->tplData['city'] = $city->getData();
        //$this->tplData['city'][0] = '';
    }

    protected function assignRegion($t = '')
    {
        include ('nga/tables/region.php');
        $region->perPage = 1000;
        if($t == 'noMsk'){
            $region->addWhere('moscow', '1', '!=');
        }
        $this->tplData['region'] = $region->getData();
    }

    protected function assignTrainway(){
        include ('nga/tables/land.php');
        $this->tplData['trainway'] = $land_table_block[6]->getValues();
    }

}