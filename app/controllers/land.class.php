<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ng
 * Date: 11/30/12
 * Time: 1:42 AM
 * To change this template use File | Settings | File Templates.
 */

class land extends ngaController

{

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
        include('nga/tables/cottage_set.php');
        $this->layout = 'layout_search';
        $this->tpl = 'LandSearch';
        $this->tplData['new_flat'] = false;


        $this->assignCity('noMsk');
        $this->assignHighway();
        $this->assignRegion('noMsk');
        $cottage_set->perPage = 1000;
        $this->tplData['cottage_set'] = $cottage_set->getData();
        $res = $this->search();
        if (!$res) {
            return false;
        }
        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }
        $this->layoutData['mapResult'] = $result;
        $this->layoutData['title'] = 'Загородная недвижимость > Поиск';
        $this->layoutData['h1'] = 'Поиск загородной недвижимости';
    }

    public function actionAll()
    {
        $this->layout = 'layout_white';
        include('nga/tables/land.php');
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->tplData['landTypes'][0] = '';

        $this->assignHighway();

        $this->tplData['train_wayTypes'] = $land_table_block[6]->getValues();
        $this->tplData['train_wayTypes'][0] = '';

        $this->tplData['region'] = $outmsk->getData();
        //print_R($this->tplData['region']);
        //Тип объекта
        $sql = '';
        if (!empty($_GET['type'])){
            $t = (int)($_GET['type']);
            if($t>0){
                $sql = ' AND `type` = '.(int)$_GET['type'];
            }
        }
        $land_table->OverrideQuerySelect = "SELECT
         `land`.`landID` AS `tid`, `land`.`type`, `land`.`cityID`,
`land`.`highwayID`, `land`.`cottage_setID`, `land`.`regionID`, `land`.`settlement`, `land`.`train_way`, `land`.`square_house`, `land`.`square_land`, `land`.`price`, `land`.`mkad_remoteness`, `land`.`floors`, `land`.`year`, `land`.`otdelka`, `land`.`mebel`, `land`.`foundation`, `land`.`roof`, `land`.`ceilings`, `land`.`layout`, `land`.`form`, `land`.`fence`, `land`.`gate`, `land`.`landscape_design`, `land`.`parking`, `land`.`communication_electricity`, `land`.`communication_water`, `land`.`heating`, `land`.`internet`, `land`.`phone`, `land`.`ecology`, `land`.`probka`, `land`.`metro_access`, `land`.`infrastructure`, `land`.`latitude`, `land`.`longitude`, `land`.`elite`,
`land`.`currency`,
`land`.`title`,
`land`.`best`,photo.THUMB, photo.MID,
`highway`.`title` as `highway`
FROM `land`
LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
JOIN `highway` ON (land.highwayID = highway.highwayID)
JOIN `settings` ON (`settingsID` = land.currency)
WHERE (`land`.`elite`=0 OR `land`.`elite_check`=1) ".$sql."
GROUP BY `land`.`landID`
ORDER BY (`settings`.`value` * land.price) ASC
";
        $land_table->OverrideQuerySelect .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;

        $this->tplData['searchResult'] = $land_table->getData();
        // $this->tplData['searchResult']['type'] = explode(',',$this->tplData['searchResult']['type']);
        // т.к. searchResult - массив объектов недвижимости, вместо единичного explode сделал foreach. Но нужен ли вообще explode типа в этом экшне?  
        foreach ($this->tplData['searchResult'] as $key => $item) {
        	$this->tplData['searchResult'][$key]['item'] = explode(',',$item['type']);
        }
        $this->tplData['rowCount'] = $land_table->foundRows;

        $this->layoutData['title'] = 'Загородная недвижимость > все предложения';
        $this->layoutData['h1'] = 'Загородная недвижимость';
    }

    public function actionLand($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        include('nga/tables/land.php');
        $cottage_set->perPage = 1000;
        
        $sql = "SELECT `land`.`landID` as `tid`,
                `land`.*,
                (`settings`.`value` * `land`.price) AS `rub_price`
                FROM `land`
                JOIN `settings` ON (`settingsID` = `land`.currency)
                WHERE `landID` = ".$id;

        $res = nga_config::db()->query($sql);

        if(!$res){
            //echo nga_config::db()->error;
            return false;
        }

        $data[$id] = $res->fetch_assoc();
        $this->layoutData['similarObjects'] = $this->getSimilarObjects(__CLASS__, $id, $data[$id]['price'], 5, 'AND (`elite`=0 OR `elite_check`=1) AND type = '.$data[$id]['type'], 'price', 'square_house');
        $data[$id]['type'] = explode(',',$data[$id]['type']);
        
        
        $this->layoutData['photos'] = $this->getPhoto(5, $id);
        $this->layout = 'layout_one';
        $this->tpl = 'land_one';
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->tplData['landTypes'][0] = '';



        $this->layoutData['title'] = $data[$id]['title'];
        $this->layoutData['h1'] = $data[$id]['title'];
        $this->layoutData['id'] = $id;
        $this->layoutData['land'] = $this->tplData['land'] = $data[$id];
        $this->layoutData['cottage_set'] = $cottage_set->getData();

        $this->tplData['coords'] = array('title' => $data[$id]['settlement'], 'latitude' => $this->tplData['land']['latitude'], 'longitude' => $this->tplData['land']['longitude']);
        $this->tplData['id'] = $id;


        $this->assignHighway();
        $this->assignRegion();
        $this->assignCity();
        $this->assignTrainway();

        $this->layoutData['description'] = $data[$id]['description'];
    }
    
    public function actionSearch()
    {

        $this->layout = 'layout_white';
        //print_r($_GET);
        $res = $this->search();


        if (!$res) {
            return false;
        }

        $result = array();
        while ($row = $res->fetch_assoc()) {
            $row['type'] = explode(',',$row['type']);
            $result[] = $row;
        }
        $this->assignMetro();
        $this->assignCountry();
        $this->assignCity();
        $this->assignHighway();

        include('nga/tables/land.php');
        $this->tplData['train_wayTypes'] = $land_table_block[6]->getValues();
        $this->tplData['train_wayTypes'][0] = '';
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->tplData['landTypes'][0] = '';

        $this->tplData['landObject'] = $land_table_block[3]->getValues();
        //$this->tplData['searchResult'] = $land_table->getData();


        $this->tplData['searchResult'] = $result;
        $this->tplData['rowCount'] = $this->rowCount;

        $this->layoutData['h1'] = 'Загородная недвижимость результаты поиска';
        $this->layoutData['title'] = 'Загородная недвижимость > найдено (' . $this->rowCount . ')';

    }

    // ПОИСК
    protected function search()
    {
        $sql = $Hsql = "
                SELECT SQL_CALC_FOUND_ROWS `land`.`landID` AS `tid`, `land`.*,
                photo.THUMB, photo.MID,
                photo.SRC as `SRC`

                FROM `land`
                LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
                WHERE (`elite`=0 OR `elite_check`=1)";

        $glue = ' AND ';

        //type
        //Тип объекта
        if (!empty($_GET['type'])&&(int)$_GET['type']>0){
            $sql .= $glue . '`type` = '.(int)$_GET['type'];
            $glue = ' AND ';
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

        //square_select
        if (!empty($_GET['square_house'])) {
            if ((int)$_GET['square_house']['from'] > 0) {
                $sql .= $glue . '`square_house` >= ' . $this->currencyValue * (int)$_GET['square_house']['from'] . '';
            }
            //до
            if ((int)$_GET['square_house']['to'] > 0 && (int)$_GET['square_house']['to'] > (int)$_GET['square_house']['from']) {
                $sql .= $glue . '`square_house` <=' . $this->currencyValue * (int)$_GET['square_house']['to'];
            }
        }
            /*
            switch((int)$_GET['square_house']){
                case 1: {$sql .= $glue . '`square_house` =< 50';} break;
                case 2: {$sql .= $glue . '`square_house` >= 50 AND `square_house` <= 100';} break;
                case 3: {$sql .= $glue . '`square_house` >= 100 AND `square_house` <= 150';} break;
                case 4: {$sql .= $glue . '`square_house` >= 150 AND `square_house` <= 200';} break;
                case 5: {$sql .= $glue . '`square_house` >= 200 AND `square_house` <= 300';} break;
                case 6: {$sql .= $glue . '`square_house` >= 300 AND `square_house` <= 500';} break;
                case 7: {$sql .= $glue . '`square_house` >= 500 AND `square_house` <= 1000';} break;
                case 8: {$sql .= $glue . '`square_house` >= 1000';} break;
            }*/
            

        //square_select
        if (!empty($_GET['square_land'])) {
            if ((int)$_GET['square_land']['from'] > 0) {
                $sql .= $glue . '`square_land` >= ' . $this->currencyValue * (int)$_GET['square_land']['from'] . '';
            }
            //до
            if ((int)$_GET['square_land']['to'] > 0 && (int)$_GET['square_land']['to'] > (int)$_GET['square_land']['from']) {
                $sql .= $glue . '`square_land` <=' . $this->currencyValue * (int)$_GET['square_land']['to'];
            }
        }
    /*
            switch((int)$_GET['square_land']){
                case 1: {$sql .= $glue . '`square_land` =< 6';} break;
                case 2: {$sql .= $glue . '`square_land` >= 6 AND `square_land` <= 10';} break;
                case 3: {$sql .= $glue . '`square_land` >= 10 AND `square_land` <= 15';} break;
                case 4: {$sql .= $glue . '`square_land` >= 15 AND `square_land` <= 20';} break;
                case 5: {$sql .= $glue . '`square_land` >= 20 AND `square_land` <= 25';} break;
                case 6: {$sql .= $glue . '`square_land` >= 25 AND `square_land` <= 50';} break;
                case 7: {$sql .= $glue . '`square_land` >= 50';} break;
            }
    */


        //MKAD
        if (!empty($_GET['mkad_remoteness'])) {
            switch((int)$_GET['mkad_remoteness']){
                case 1: {$sql .= $glue . '`mkad_remoteness` =< 10';} break;
                case 2: {$sql .= $glue . '`mkad_remoteness` >= 10 AND `mkad_remoteness` <= 20';} break;
                case 3: {$sql .= $glue . '`mkad_remoteness` >= 20 AND `mkad_remoteness` <= 30';} break;
                case 4: {$sql .= $glue . '`mkad_remoteness` >= 30 AND `mkad_remoteness` <= 50';} break;
                case 5: {$sql .= $glue . '`mkad_remoteness` >= 50 AND `mkad_remoteness` <= 75';} break;
                case 6: {$sql .= $glue . '`mkad_remoteness` >= 75 AND `mkad_remoteness` <= 100';} break;
                case 7: {$sql .= $glue . '`mkad_remoteness` >= 100';} break;
            }
        }
        
        //HIGHWAY
        if (!empty($_GET['highway']) && !isset($_GET['highwayall'])) {
            $highway = array();
            foreach ($_GET['highway'] as $r) {
                if ((int)$r >= 0) {
                    $highway[] = (int)$r;
                }
            }
            if (count($highway)) {
                $sql .= $glue . '`highwayID` IN (' . implode(",", $highway) . ')';
            }
        }

        //ГОРОД
        if (!empty($_GET['city']) && is_array($_GET['city']) //Это если галочка "все типы дома" тогда условия не добавляем
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
        
        //район
        if (!empty($_GET['region']) && is_array($_GET['region']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $region = array();
            foreach ($_GET['region'] as $r) {

                if ((int)$r > 0) {
                    $region[] = (int)$r;
                }
            }
            if(count($region)){
                $sql .= $glue . '`regionID` IN (' . implode(",", $region) . ')';
                $glue = ' AND ';
            }
        }
        
        //поселок
        if (!empty($_GET['cottage_set']) && is_array($_GET['cottage_set']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $cottage_set = array();
            foreach ($_GET['cottage_set'] as $r) {

                if ((int)$r > 0) {
                    $cottage_set[] = (int)$r;
                }
            }
            if(count($cottage_set)){
                $sql .= $glue . '`cottage_setID` IN (' . implode(",", $cottage_set) . ')';
                $glue = ' AND ';
            }
        }
        
        //ЖД
        if (!empty($_GET['train_way']) && is_array($_GET['train_way']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $train_way = array();
            foreach ($_GET['train_way'] as $r) {

                if ((int)$r > 0) {
                    $train_way[] = (int)$r;
                }
            }
            if(count($train_way)){
                $sql .= $glue . '`train_way` IN (' . implode(",", $train_way) . ')';
                $glue = ' AND ';
            }
        }

        $Fsql = "
            GROUP BY `land`.`landID`
            ORDER BY `land`.`landID` DESC
            ";
        $Fsql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;


        $sql .= $Fsql;
        $res = nga_config::db()->query($sql);


        //echo nga_config::db()->error;

        if (!$res) {
            return false;
        }

        $this->rowCount = $this->getFoundRows();
        return $res;
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
                	WHERE 
                	  " . $priceColumn . "<= " . $price . " 
                	  AND " . $priceColumn . ">= " . $price . " * 0.5 
                	  AND t.`" . $idField . "` != " . (int)$id . "
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
}