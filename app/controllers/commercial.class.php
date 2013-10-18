<?php

/**
 * Назначение и тип объекта работаю по принципу добавленимя в корзину
При выборе с резльтатами поиска - ноль, выводить объекты подходящие по назначению если было выбрано назначение или по типу если был выбран тип, Если и то и то то по назначению.


У объекта справа кнопка ПОКАЗАТЬ ВСЕ ПРЕДЛОЖЕНИЯ, которая ведет на список как во вторичке, пункты по ТЗ)
 */
class commercial extends ngaController
{
    /**
     * Количество найденных строк(FOUND_ROWS)
     * @var
     */
    public $rowCount;

    public $districts = array('', 'ЦАО', 'САО', 'ЗАО', 'ВАО', 'ЮАО', 'СВАО', 'СЗАО', 'ЮЗАО', 'ЮВАО');

    public function __construct($url)
    {
        $this->entityName = __CLASS__;
        $this->tableName = __CLASS__;
        //Default template(common list)
        $this->tpl = '_common_list_plate';
        return parent::__construct($url);
    }

    public function actionIndex()
    {
        include ('nga/tables/city.php');
        include ('nga/tables/commercial.php');
        $this->tplData['city'] = $city->getData();
        $this->layout = 'layout_search';
        $this->tpl = 'commercialSearch';
        $this->tplData['new_commercial'] = false;
        $this->tplData['metro'] = $commercial_block[2]->getValues();
        unset($this->tplData['metro'][0]);
        $this->tplData['type'] = $commercial_block[5]->getValues();
        $this->tplData['assign'] = $commercial_block[4]->getValues();
        unset($this->tplData['assign'][0]);
        unset($this->tplData['type'][0]);
        $res = $this->search();
        if (!$res) {
            return false;
        }
        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }
        $this->layoutData['mapResult'] = $result;
        $this->layoutData['title'] = 'Коммерческая недвижимость > Поиск';
        $this->layoutData['h1'] = 'Поиск коммерческой недвижимости';
    }

    public function actionAll()
    {
        $this->layout = 'layout_white';
        require_once('nga/tables/commercial.php');

        $this->assignMetro();

        $commercial->OverrideQuerySelect = "
        SELECT `commercial`.`commercialID` AS `tid`, `commercial`.`cityID`, `commercial`.`address`, `commercial`.`stationID`,
         `commercial`.`title`, `commercial`.`assign`, `commercial`.`parent`, `commercial`.`type`, `commercial`.`square`, `commercial`.`rent`, `commercial`.`price`, `commercial`.`price_m`, `commercial`.`floor`, `commercial`.`floors`, `commercial`.`otdelka`, `commercial`.`security`, `commercial`.`furniture`, `commercial`.`provider`, `commercial`.`tele`, `commercial`.`conditioning`, `commercial`.`planing`, `commercial`.`parking`, `commercial`.`class`, `commercial`.`square_full`, `commercial`.`overlap`, `commercial`.`desc_place`, `commercial`.`desc_bc`, `commercial`.`district`, `commercial`.`best`, `commercial`.`nds`, `commercial`.`operating_costs`, `commercial`.`utility_payments`, `commercial`.`rent_contract`, `commercial`.`lease`, `commercial`.`electricity`,
        `commercial`.`communication`,
        `commercial`.`kwt`,
        photo.THUMB, photo.MID


        FROM `commercial`
        LEFT JOIN `photo` ON (`commercial`.`commercialID` = photo.R_ID AND photo.R_TYPE = 4)
        WHERE `parent`=0 AND `cityID` ";


       $mo = 0;
       if(isset($_GET['mo'])&&$_GET['mo']==1)$mo =1;
       if($mo == 0){
           $commercial->OverrideQuerySelect .= " = 1 ";
       } else {
           $commercial->OverrideQuerySelect .= " !=1 ";
       }

       if(isset($_GET['rent']) && in_array($_GET['rent'],array(0,1))){
            $commercial->OverrideQuerySelect .= " AND `rent`=".(int)$_GET['rent']." ";
        }

        $commercial->OverrideQuerySelect .= " GROUP BY `commercial`.`commercialID`
        ORDER BY `commercial`.`price_m` ASC
        ";

        $commercial->OverrideQuerySelect .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;
        //$commercial->addWhere('rent',1,'!=');

        $this->assignMetro();
        $this->tplData['searchResult'] = $commercial->getData();
        $this->tplData['rowCount'] = $commercial->foundRows;
        $this->layoutData['title'] = 'Продажа коммерческой недвижимости';
        $this->layoutData['h1'] = 'Коммерческая недвижимость';


        //print_r($commercial);
    }

    protected function getSubObjects($id)
    {
        //if($sub = getSubObjects($id))
        $sql = "SELECT * FROM `commercial` WHERE `parent` = " . (int)$id;
        $res = nga_config::db()->query($sql);
        if (!$res) return false;
        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['commercialID']] = $row;
        }
        $rows = $this->getFoundRows();
        if ($rows > 0) {
            return array('data' => $data, 'rowCount' => $rows);
        } else {
            return false;
        }
    }

    protected function showSubAll($id)
    {
        $this->layout = 'layout_one';
        $this->tpl = 'commercial_list_sub';
        include('nga/tables/commercial.php');

        $commercial->OverrideQuerySelect = "
        SELECT `commercial`.`commercialID` AS `tid`, `commercial`.`cityID`, `commercial`.`address`, `commercial`.`stationID`, `commercial`.`title`, `commercial`.`assign`, `commercial`.`parent`, `commercial`.`type`, `commercial`.`square`, `commercial`.`rent`, `commercial`.`price`, `commercial`.`price_m`, `commercial`.`floor`, `commercial`.`floors`, `commercial`.`otdelka`, `commercial`.`security`, `commercial`.`furniture`, `commercial`.`provider`, `commercial`.`tele`, `commercial`.`conditioning`, `commercial`.`planing`, `commercial`.`parking`, `commercial`.`class`, `commercial`.`square_full`, `commercial`.`overlap`, `commercial`.`desc_place`, `commercial`.`desc_bc`, `commercial`.`district`, `commercial`.`best`, `commercial`.`nds`, `commercial`.`operating_costs`, `commercial`.`utility_payments`, `commercial`.`rent_contract`, `commercial`.`lease`, `commercial`.`electricity`,
        `commercial`.`communication`,
        photo.THUMB, photo.MID


        FROM `commercial`
        LEFT JOIN `photo` ON (`commercial`.`commercialID` = photo.R_ID AND photo.R_TYPE = 4)
        WHERE `parent`=" . $id . "
        GROUP BY `commercial`.`commercialID`
        ORDER BY `commercial`.`price` ASC
        ";

        //$commercial->addWhere('rent',1,'!=');


        $this->tplData['searchResult'] = $commercial->getData();
        $this->tplData['rowCount'] = $commercial->foundRows;
        $this->tplData['id'] = $this->layoutData['id']  = $id;
        $this->layoutData['title'] = 'Продажа и аренда коммерческой недвижимости';
        $this->layoutData['h1'] = htmlspecialchars($this->tplData['commercialData'] ['title']);
        return true;
    }


    public function actionCommercial($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        $this->layout = 'layout_one';
        $this->tpl = 'commercial_one';
        include('nga/tables/commercial.php');
        $commercial->addWhere('commercialID', $id);
        $data = $commercial->getData();


        //Wrong id
        if (!is_array($data))
            return false;

        if ($sub = $this->getSubObjects($id)) {
            if ($sub['rowCount'] > 0) {
                $this->tplData['subObjects'] = true;
                $this->layoutData['subObjects'] = true;
            }
        }
        $this->tplData['commercialData'] = $data[$id];

        $this->tplData['assign'] = $commercial_block[4]->getValues();
        $this->tplData['assign'][0] = '';
        $this->tplData['cityid'] = $commercial_block[0]->getValues();
        $this->tplData['cityid'][0] = '';

        if (isset($url[1]) && $url[1] == 'all') {
            return $this->showSubAll($id);
        }


        $this->layoutData['photos'] = $this->getPhoto(4, $id);
		$rent = ($data[$id]['rent'] == 1) ? ' AND rent = 1' : ' AND rent = 0';
        $this->tplData['coords'] = array('title' => $id, 'latitude' => $data[$id]['latitude'], 'longitude' => $data[$id]['longitude']);
        $this->layoutData['similarObjects'] = $this->getSimilarObjects(__CLASS__, $id, $data[$id]['price'], 4, $data[$id]['currency'], ' AND `parent`=0 AND `type` = '.$data[$id]['type'].$rent);

        $this->tplData['id'] = $id;
        $m = $subway_stations->getData('id', $data[$id]['stationID']);
        if (!empty($data[$id]['district'])) {
            $this->tplData['commercialData']['district'] = $this->districts[$data[$id]['district']];
        } else {
            $this->tplData['commercialData']['district'] = '';
        }


        $this->tplData['coords'] = array('title' => $id, 'latitude' => $this->tplData['commercialData']['latitude'], 'longitude' => $this->tplData['commercialData']['longitude']);
        $this->assignMetro();


        $this->tplData['bc0'] = $commercial_block_bc[0]->getValues();
        $this->tplData['bc0'][0] = '';

        $this->tplData['bc1'] = $commercial_block_bc[1]->getValues();
        $this->tplData['bc1'][0] = '';

        $this->tplData['bc2'] = $commercial_block_bc[2]->getValues();
        $this->tplData['bc2'][0] = '';

        $this->tplData['bc3'] = $commercial_block_bc[3]->getValues();
        $this->tplData['bc3'][0] = '';

        $this->tplData['bc4'] = $commercial_block_bc[4]->getValues();
        $this->tplData['bc4'][0] = '';

        $this->tplData['bc5'] = $commercial_block_bc[5]->getValues();
        $this->tplData['bc5'][0] = '';

        $this->tplData['bc6'] = $commercial_block_bc[6]->getValues();
        $this->tplData['bc6'][0] = '';






        $this->layoutData['description'] = $data[$id]['desc_bc'];
        $this->layoutData['title'] = 'Коммерческая недвижимость > Все предложения';
        $this->layoutData['h1'] = $data[$id]['address'];
        $this->layoutData['id'] = $id;
    }


    public function actionSearch()
    {

        $this->layout = 'layout_white';
        $res = $this->search();


        if (!$res) {
            return false;
        }

        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }


        $this->tplData['searchResult'] = $result;
        $this->tplData['rowCount'] = $this->rowCount;
        $this->assignMetro();
        require_once('nga/tables/commercial.php');
        $this->layoutData['h1'] = 'Коммерческая недвижимость результаты поиска';
        $this->layoutData['title'] = 'Коммерческая недвижимость > найдено (' . $this->rowCount . ')';

    }

    // ПОИСК
    protected function search()
    {
        $sql = $Hsql = "
                SELECT SQL_CALC_FOUND_ROWS `commercial`.`commercialID` AS `tid`, `commercial`.*,
                photo.THUMB, photo.MID,
                photo.SRC as `SRC`

                FROM `commercial`
                LEFT JOIN `photo` ON (`commercial`.`commercialID` = photo.R_ID AND photo.R_TYPE = 4)
                WHERE `parent`=0";

        $glue = ' AND ';
        //  `rent` != 1 AND


        //rent
        if (isset($_GET['rent'])) {
            if($_GET['rent'] == 1)     $sql .= $glue . '`rent` = 1';
            if($_GET['rent'] == 0)     $sql .= $glue . '`rent` = 0';
        }

        //NoMsk
        if (isset($_GET['noMsk'])) {
            if($_GET['noMsk'] == 1)     $sql .= $glue . '`cityID` != 1';
            if($_GET['noMsk'] == 0)     $sql .= $glue . '`cityID` = 1';
        }

        //округ (при открытии страницы загружается, как любой, далее можно выбрать по стрелочке),
        if (!empty($_GET['district']) && !isset($_GET['districtall'])) {
            $district = array();
            foreach ($_GET['district'] as $r) {
                if ((int)$r < 9 && (int)$r >= 1) {
                    $district[] = (int)$r;
                }
            }
            if (count($district)) {
                $sql .= $glue . '`district` IN (' . implode(",", $district) . ')';
            }
        }

        //Цена        
        if (!empty($_GET['price'])) {
            //от
            if ((int)$_GET['price']['from'] > 0) {
                $sql .= $glue . '`price` >= ' . $this->currencyValue * (int)$_GET['price']['from'] . '';
            }
            //до
            if ((int)$_GET['price']['to'] > 0 && (int)$_GET['price']['to'] > (int)$_GET['price']['from']) {
                $sql .= $glue . '`price` <=' . $this->currencyValue * (int)$_GET['price']['to'];
            }
        }

        //Цена за метр
        if (!empty($_GET['price_m'])) {
            //от
            if ((int)$_GET['price_m']['from'] > 0) {
                $sql .= $glue . '`price_m` >= ' . $this->currencyValue * (int)$_GET['price_m']['from'] . '';
            }
            //до
            if ((int)$_GET['price_m']['to'] > 0 && (int)$_GET['price_m']['to'] > (int)$_GET['price_m']['from']) {
                $sql .= $glue . '`price_m` <=' . $this->currencyValue * (int)$_GET['price_m']['to'];
            }
        }
        //Площадь
        if (!empty($_GET['square'])) {

            //от
            if ((int)$_GET['square']['from'] > 0) {
                $sql .= $glue . '`square` >= ' . (int)$_GET['square']['from'];
            }
            //до
            if ((int)$_GET['square']['to'] != 0) {
                $sql .= $glue . '`square` <= ' . (int)$_GET['square']['to'];
            }
        }

        //METRO
        if (!empty($_GET['m']) && is_array($_GET['m'])) {
            foreach ($_GET['m'] as $r) {
                if ((int)$r <= 300 || $r > 0) {
                    $me[] = $r;
                }
            }
            $sql .= $glue . '`stationID` IN (' . implode(",", $me) . ')';
        }

        //ГОРОД
        if (!empty($_GET['city']) && is_array($_GET['city']) &&
            !isset($_GET['cityall']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $city = array();
            foreach ($_GET['city'] as $r) {

                if ((int)$r > 0) {
                    $city[] = (int)$r;
                }
            }
            if(count($city)){
                $sql .= $glue . '`cityID` IN (' . implode(",", $city) . ')';
                $glue = ' AND ';
            }
        }

        //Тип объекта
        if (!empty($_GET['type']) && is_array($_GET['type']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $type = array();
            foreach ($_GET['type'] as $r) {

                if ((int)$r > 0) {
                    $type[] = (int)$r;
                }
            }
            if(count($type)){
                $sql .= $glue . '`type` IN (' . implode(",", $type) . ')';
                $glue = ' AND ';
            }
        }

        //Тип объекта
        if (!empty($_GET['assign']) && is_array($_GET['assign']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $assign = array();
            foreach ($_GET['assign'] as $r) {

                if ((int)$r > 0) {
                    $assign[] = (int)$r;
                }
            }
            if(count($assign)){
                $sql .= $glue . '`assign` IN (' . implode(",", $assign) . ')';
                $glue = ' AND ';
            }
        }





        $Fsql = "
            GROUP BY `commercial`.`commercialID`
            ORDER BY `commercial`.`price_m` ASC
            ";
        $Fsql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;

        $sql .= $Fsql;
        $res = nga_config::db()->query($sql);


        //echo nga_config::db()->error;

        if (!$res) {
            return false;
        }

        $this->rowCount = $this->getFoundRows();

        if ($this->rowCount == 0) {
            $sql = $Hsql;

            //Тип объекта
            if (!empty($_GET['assign']) && is_array($_GET['assign'])) {
                $assign = array();
                foreach ($_GET['assign'] as $r) {

                    if ((int)$r > 0) {
                        $assign[] = (int)$r;
                    }
                }
                $sql .= $glue . '`assign` IN (' . implode(",", $assign) . ')';
                $glue = ' AND ';
            } elseif (!empty($_GET['type']) && is_array($_GET['type']) && (empty($_GET['assign']))) {
                $type = array();
                foreach ($_GET['type'] as $r) {

                    if ((int)$r > 0) {
                        $type[] = (int)$r;
                    }
                }
                $sql .= $glue . '`type` IN (' . implode(",", $type) . ')';
            }
            if (!empty($_GET['assign']) || !empty($_GET['type'])) {
                $sql .= $Fsql;
                $res = nga_config::db()->query($sql);
                $this->rowCount = $this->getFoundRows();
            }
        }

        return $res;
    }

    protected function getSimilarObjects($table, $id, $price, $photoType, $currency = 1, $addWhere = '', $priceColumn = 'price', $squareColumn = 'square', $idField = false)
    {
        if (empty($price)) $price = 0;
        if (!$idField) $idField = $table . "ID";
        
		$curquery = "SELECT settingsID, value FROM settings WHERE 1";
		$curres = nga_config::db()->query($curquery);
		$exchange = array();
        while ($row = $curres->fetch_assoc()) {
			$exchange[$row['settingsID']] = $row['value'];
		}

        $sql = "
                SELECT * FROM (
                	SELECT
                	 t .`" . $idField . "` as `tid`,
                	 t." . $squareColumn . " as `square`,
                	 t." . $priceColumn . " as `price`,
                	 photo.THUMB, photo.MID,
                	 t.currency as `currency`

                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE " . $priceColumn . "<= " . $price  . " * (SELECT value FROM settings WHERE settingsID = $currency)" . " AND t.`" . $idField . "` != " . (int)$id . "
                	" . $addWhere . "
                	ORDER BY `price` DESC,  `photo`. `photoID` ASC
                	LIMIT 1) a UNION
                SELECT * FROM (
                	SELECT t .`" . $idField . "` as `tid`,
                	t." . $squareColumn . " as `square`,
                	t." . $priceColumn . " as `price`,
                	 photo.THUMB, photo.MID,
                	 t.currency as `currency`
                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE " . $priceColumn . ">= " . $price . " * (SELECT value FROM settings WHERE settingsID = $currency)" . " AND t.`" . $idField . "` != " . (int)$id . "
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
			// $data[$row['tid']]['price'] = $data[$row['tid']]['price'] * $exchange[$data[$row['tid']]['currency']]; 
        }
        return $data;
    }
   
}