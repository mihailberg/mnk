<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ng
 * Date: 11/30/12
 * Time: 1:42 AM
 * To change this template use File | Settings | File Templates.
 */

class flat extends ngaController
{
    public $photoType = 3;

    public function __construct($url)
    {
        $this->entityName = __CLASS__;
        $this->tableName = __CLASS__;
        //Default template(common list)
    //    $this->tpl = '_common_list_plate';
        return parent::__construct($url);
    }

    public function actionIndex()
    {
        $this->assignCity();
        $this->layout = 'layout_search';
        $this->tpl = 'FlatSearch';
        $this->tplData['new_flat'] = false;
        $res = $this->search();
        if (!$res) {
            return false;
        }
        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }
        $this->layoutData['mapResult'] = $result;
        $this->layoutData['title'] = 'Городская недвижимость > Поиск';
        $this->layoutData['h1'] = 'Поиск городской недвижимости';
    }

    public function actionSearch()
    {
        $this->layout = 'layout_white';
        $this->tpl = 'flat_list';
        $res = $this->search();

        if (!$res) {
            return false;
        }
        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }

        $total = $this->getFoundRows();

        $this->tplData['resultCount'] = $total;


        $this->tplData['searchResult'] = $result;
        $this->layoutData['title'] = 'Городская недвижимость > поиск';
        $this->layoutData['h1'] = 'Городская недвижимость';

        $this->assignMetro();
        $this->assignCity();

        include ('nga/tables/flat.php');
        $this->tplData['house_types'] = $comment[21]->getValues();
        $this->tplData['house_types'][0] = '';

    }

    public function search()
    {
        $rub_price_sql = "(`flat`.`price` * `settings`.`value`)";
        $rub_price_m_sql = "(`flat`.`price_m` * `settings`.`value`)";

        $sql = "SELECT SQL_CALC_FOUND_ROWS `flat`.`flatID` AS `tid`, `flat`.*, `photo`.*,
                        ".$rub_price_sql." AS `rub_price`,
                        ".$rub_price_m_sql." AS `rub_price_m`

                    FROM `flat`
                    LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                    JOIN `settings` ON (`settingsID` = `flat`.currency)
                    WHERE (`elite` = 0 OR `elite_check`=1)";
        $glue = ' AND ';

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

        //количество комнат (комната, 1,2,3, 4  и более),
        if (!empty($_GET['room'])) {
            $sql .= $glue . $this->makeRoomSql(); //newflat room isroom
        }

        //Цена
        if (!empty($_GET['price'])) {
            //от
            if ((int)$_GET['price']['from'] > 0) {
                $sql .= $glue . $rub_price_sql . ' >= ' . $this->exchange[(int)$_GET['currency']] * (int)$_GET['price']['from'];
            }
            //до
            if ((int)$_GET['price']['to'] > 0 && (int)$_GET['price']['to'] > (int)$_GET['price']['from']) {
                $sql .= $glue . $rub_price_sql . ' <= ' . $this->exchange[(int)$_GET['currency']] * (int)$_GET['price']['to'];
            }
        }

        //Площадьплощадь (содержит окошки для заполнения вручную от __до__ м2),
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


        //Тип дома  тип дома (панель, кирпич, кирпич-монолит, сталинский, иное, все).
        if (!empty($_GET['btype']) && is_array($_GET['btype']) &&
            !isset($_GET['typeall']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $btype = array();
            foreach ($_GET['btype'] as $r) {

                if ((int)$r > 0) {
                    $btype[] = (int)$r;
                }
            }
            if(count($btype)){
                $sql .= $glue . '`type` IN (' . implode(",", $btype) . ')';
            }
        }

        if (!empty($_GET['m']) && is_array($_GET['m'])) {
            $me = array();
            foreach ($_GET['m'] as $r) {
                if ((int)$r > 0) {
                    $me[] = (int)$r;
                }
            }
            if(count($me)){
                $sql .= $glue . '`stationID` IN (' . implode(",", $me) . ')';
            }
        }


        //Ипотека
        if (isset($_GET['ipoteka'])) {
            $sql .= $glue . "`banks` !=''";
        }

        //NoMsk
        if (isset($_GET['noMsk'])) {
            if($_GET['noMsk'] == 1)     $sql .= $glue . '`cityID` != 1';
            if($_GET['noMsk'] == 0)     $sql .= $glue . '`cityID` = 1';
        }
        //ГОРОД
        if (!empty($_GET['city']) && is_array($_GET['city'])) {
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


        $sql .= "
                            GROUP BY  `flat`.`flatID`
                            ORDER BY (`settings`.`value` * `flat`.price) ASC,  `photo`. `photoID` ASC
                                    ";
        $sql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;

        return nga_config::db()->query($sql);
    }

    public function actionAll()
    {


        $this->layout = 'layout_white';
        $this->tpl = 'flat_list';
        require_once('nga/tables/flat.php');
        /**
         * @var $flat nga_table
         */
        $flat->OverrideQuerySelect = "SELECT
                                `flat`.`flatID` AS `tid`,
                                `flat`.*,
                                (`settings`.`value` * `flat`.price) AS `rub_price`,
                                (`settings`.`value` * `flat`.price_m) AS `rub_price_m`,
                                 `photo`.`photoID` as `photoID`

                                    FROM `flat`
                                    JOIN `settings` ON (`settingsID` = `flat`.currency)
                                    LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                                    WHERE  (`elite` = 0 OR `elite_check`=1) AND `cityID` ";
        $mo = 0;
        if(isset($_GET['mo'])&&$_GET['mo']==1)$mo =1;
        if($mo == 0){
            $flat->OverrideQuerySelect .= " = 1 ";
        } else {
            $flat->OverrideQuerySelect .= " !=1 ";
        }


        $flat->OverrideQuerySelect .="
                                    GROUP BY  `flat`.`flatID`
                                    ORDER BY (`settings`.`value` * `flat`.price) ASC,  `photo`. `photoID` ASC
                            ";
        $flat->OverrideQuerySelect .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;



        $this->tplData['searchResult'] = $flat->getData();
        $this->tplData['resultCount'] = $flat->foundRows;
        $this->tplData['house_types'] = $comment[21]->getValues();
        $this->tplData['house_types'][0] = '';


        include ('nga/tables/subway_stations.php');
        $subway_stations->perPage = 1000;
        $this->tplData['metro'] = $subway_stations->getData();


        //print_r($flat);
        $this->layoutData['title'] = 'Городская недвижимость > Все предложения';
        $this->layoutData['h1'] = 'Городская недвижимость';
    }

    public function actionFlat($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        $this->layout = 'layout_one';
        $this->tpl = 'flat_one';
        include ('nga/tables/flat.php');
        //$flat->addWhere('flatID', $id);

        $sql = "SELECT `flat`.`flatID` as `tid`,
        `flat`.*,
        (`settings`.`value` * `flat`.price) AS `rub_price`,
        (`settings`.`value` * `flat`.price_m) AS `rub_price_m`

        FROM `flat`
        JOIN `settings` ON (`settingsID` = `flat`.currency)
        WHERE `flatID` = ".$id;

        $res = nga_config::db()->query($sql);
        if(!$res) return false;

        $data = $res->fetch_assoc();

        //$data = //$flat->getData();
        //Wrong id
        if (!is_array($data))
            return false;

        $this->tplData['flatData'] = $data;
        $this->tplData['id'] = $id;
        $this->layoutData['id'] = $id;

        //Metro
        $m = $comment[4]->getValues();
        $m[0] = '';

        //Region
        $region = $comment[3]->getValues();
        $region[0] = '';
        $this->tplData['flatData']['regionID'] = $region[$this->tplData['flatData']['regionID']];
        $this->tplData['house_types'] = $comment[21]->getValues();
        $this->tplData['house_types'][0] = '';
        $this->tplData['coords'] = array('title' => $id, 'latitude' => $data['latitude'], 'longitude' => $data['longitude']);
        $this->tplData['districts'] = $comment[2]->getValues();
        $this->layoutData['photos'] = $this->getPhoto(3, $id);


        $this->assignCity();
        $this->assignMetro();
        $rooms = ' AND `room` ='.$data['room'].' ';
		$city = ($data['cityID'] == 1) ? ' AND cityID = 1' : 'AND cityID != 1';
        $this->layoutData['similarObjects'] = $this->getSimilarObjects(__CLASS__, $id, $data['price'], 3, $data['currency'], 'AND (`elite`=0 OR `elite_check`=1)'.$rooms.$city, 'price');




        //print_r($data);

        $this->layoutData['description'] = $data['description'];
        $this->layoutData['title'] = 'Городская недвижимость';
        $this->layoutData['h1'] = $this->tplData['flatData']['title'];
    }

    protected function getSimilarObjects($table, $id, $price, $photoType, $currency = 1, $addWhere = '', $priceColumn = 'price', $squareColumn = 'square', $idField = false)
    {
        if (empty($price)) $price = 0;
        if (!$idField) $idField = $table . "ID";

        // Price in rubles
        $rubPrice = $price *  $this->exchange[$currency];

        $sql = "
                SELECT * FROM (
                	SELECT
                	 t .`" . $idField . "` as `tid`,
                	 t." . $squareColumn . " as `square`,
                	 t." . $priceColumn . " as `price`,
                	 t.title as `title`,
                	 (`settings`.`value` * `t`." . $priceColumn . " ) AS `rub_price`,
                	 photo.THUMB, photo.MID,
                	 t.currency as `currency`
                	FROM `" . $table . "` t
                	JOIN `settings` ON (`settingsID` = t.currency)
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE
                            (   (`settings`.`value` * `t`." . $priceColumn . ")  <= " .   $rubPrice ." )
                	    AND (   (`settings`.`value` * `t`." . $priceColumn . ")  >= " .  ( $rubPrice * 0.5 ) . " )
                        AND t.`" . $idField . "` != " . (int)$id . "
                	    " . $addWhere . "
                	ORDER BY rub_price DESC,  `photo`. `photoID` ASC
                	LIMIT 1) a UNION
                SELECT * FROM (
                	SELECT t .`" . $idField . "` as `tid`,
                	t." . $squareColumn . " as `square`,
                	t." . $priceColumn . " as `price`,
                	t.title as `title`,
                	(`settings`.`value` * `t`." . $priceColumn . " ) AS `rub_price`,
                	 photo.THUMB, photo.MID,
                	 t.currency as `currency`
                	FROM `" . $table . "` t
                	JOIN `settings` ON (`settingsID` = t.currency)
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE
                            (   (`settings`.`value` * `t`." . $priceColumn . ")  >= " .   $rubPrice ." )
                	    AND (   (`settings`.`value` * `t`." . $priceColumn . ")  <= " .  ( $rubPrice  * 1.5 ) . " )
                        AND t.`" . $idField . "` != " . (int)$id . "
                        " . $addWhere . "
                	ORDER BY rub_price ASC, `photo`. `photoID` ASC
                	LIMIT 2
                ) b
                GROUP BY `tid`
                ORDER BY rub_price ASC
                ";

        $res = nga_config::db()->query($sql);
        if (!$res){
            return false;
        }

        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['tid']] = $row;
        }
        return $data;
    }
}