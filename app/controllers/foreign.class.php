<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ng
 * Date: 11/30/12
 * Time: 1:42 AM
 * To change this template use File | Settings | File Templates.
 */

class foreign extends ngaController

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
        //require_once('nga/tables/country.php');
        $this->layout = 'layout_search';
        $this->tpl = 'foreignSearch';
        $this->assignCountry();
        //$this->tplData['country'] = $country_table->getData();
        $this->tplData['foreign'] = false;

        require_once('nga/tables/foreign.php');

        $this->tplData['foreignType'] = $foreign_table_block[0]->getValues();
        $this->tplData['foreignType'][0]= 'любой';

        $res = $this->search();
        if (!$res) {
            return false;
        }
        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }
        $this->layoutData['mapResult'] = $result;
        $this->layoutData['title'] = 'Зарубежная недвижимость > Поиск';
        $this->layoutData['h1'] = 'Поиск зарубежной недвижимости';
    }

    public function actionAll()
    {
        $this->layout = 'layout_white';
        $this->tpl = '_common_list_plate';
        require_once('nga/tables/foreign.php');

        $foreign_table->OverrideQuerySelect = "SELECT
          `foreign`.`foreignID` AS `tid`,
          `foreign`.`type`, `foreign`.`countryID`, `foreign`.`cityID`, `foreign`.`object_view`, `foreign`.`square`, `foreign`.`square_land`, `foreign`.`price`, `foreign`.`latitude`, `foreign`.`longitude`, `foreign`.`floor`, `foreign`.`floors`, `foreign`.`section`, `foreign`.`planing`, `foreign`.`best`, `foreign`.`live_count`, `foreign`.`bath_count`, `foreign`.`square_kitchen`, `foreign`.`square_guest`, `foreign`.`year`, `foreign`.`additional_building`, `foreign`.`otdelka`, `foreign`.`mebel`, `foreign`.`phone`, `foreign`.`internet`, `foreign`.`house_type`, `foreign`.`lift`, `foreign`.`guard`, `foreign`.`parking`, `foreign`.`month_costs`, `foreign`.`gk_build_count`, `foreign`.`gk_pool`, `foreign`.`gk_kind_area`, `foreign`.`gk_sea`, `foreign`.`gk_center_remoteness`, `foreign`.`gk_conditions`, `foreign`.`place_description`, `foreign`.`additional_price`,
          `foreign`.`currency`,
        `foreign`.`additional_tax`,
        photo.THUMB, photo.MID
        FROM `foreign`
         LEFT JOIN `photo` ON (`foreign`.`foreignID` = photo.R_ID AND photo.R_TYPE = 7)
         JOIN `settings` ON (`settingsID` = foreign.currency)
         GROUP BY  `foreign`.`foreignID`
         ORDER BY (`settings`.`value` * foreign.price) ASC
         ";
        $foreign_table->OverrideQuerySelect .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;


        $this->assignCity();
        $this->assignCountry();


        $this->tplData['searchResult'] = $foreign_table->getData();
        $this->tplData['rowCount'] = $foreign_table->foundRows;
        $this->tplData['foreignType'] = $foreign_table_block[0]->getValues();
        //$this->tplData['country'] = $foreign_table_block[1]->getValues();
        //$this->tplData['city'] = $foreign_table_block[2]->getValues();
        $this->tplData['foreignObject'] = $foreign_table_block[3]->getValues();
        $this->layoutData['title'] = 'Зарубежная недвижимость > все предложения';
        $this->layoutData['h1'] = 'Зарубежная недвижимость';
    }

    public function actionForeign($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        $this->layout = 'layout_one';
        $this->tpl = 'foreign_one';

        include('nga/tables/foreign.php');
        $foreign_table->addWhere('foreignID', $id);
        $data = $foreign_table->getData();
        //Wrong id
        if (!is_array($data))
            return false;

        $this->layoutData['similarObjects'] = $this->getSimilarObjects(__CLASS__, $id, $data[$id]['price'], 7, ' AND countryID ='.$data[$id]['countryID']);
        $this->layoutData['photos'] = $this->getPhoto(7, $id);


        $this->tplData['type'] = $foreign_table_block[0]->getValues();

        $this->assignCity();
        $this->assignCountry();

        $this->tplData['object'] = $foreign_table_block[3]->getValues();
        $this->tplData['foreign'] = $data[$id];
        $this->tplData['id'] = $id;
        if(isset($this->tplData['country'][$this->tplData['foreign']['countryID']]['title'])
            &&isset($this->tplData['city'][$this->tplData['foreign']['cityID']]['title'])){
            $this->tplData['coords'] = array('title' => $this->tplData['country'][$this->tplData['foreign']['countryID']]['title'] . " / " . $this->tplData['city'][$this->tplData['foreign']['cityID']]['title'], 'latitude' => $this->tplData['foreign']['latitude'], 'longitude' => $this->tplData['foreign']['longitude']);
            $this->layoutData['h1'] = $this->tplData['country'][$this->tplData['foreign']['countryID']]['title'] . " / " . $this->tplData['city'][$this->tplData['foreign']['cityID']]['title']. " ". $this->tplData['foreign']['title'];
        } else {
            $this->tplData['coords'] = array();
            $this->layoutData['h1'] = $this->tplData['foreign']['title'];
        }
        $this->layoutData['id'] = $id;
        $this->layoutData['title'] = $this->layoutData['h1'];
        $this->layoutData['description'] = nl2br($data[$id]['place_description']);

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
            $result[] = $row;
        }
        $this->assignMetro();
        $this->assignCountry();
        $this->assignCity();

        include('nga/tables/foreign.php');
        $this->tplData['foreignType'] = $foreign_table_block[0]->getValues();
        $this->tplData['foreignObject'] = $foreign_table_block[3]->getValues();
        $this->tplData['searchResult'] = $foreign_table->getData();


        $this->tplData['searchResult'] = $result;
        $this->tplData['rowCount'] = $this->rowCount;

        $this->layoutData['h1'] = 'Зарубежная недвижимость результаты поиска';
        $this->layoutData['title'] = 'Зарубежная недвижимость > найдено (' . $this->rowCount . ')';

    }

    // ПОИСК
    protected function search()
    {
        $sql = $Hsql = "
                SELECT
                SQL_CALC_FOUND_ROWS
                t.`foreignID` AS `tid`,
                t.*,
                (`settings`.`value` * t.price) AS `rub_price`,

                photo.THUMB, photo.MID,
                photo.SRC as `SRC`

                FROM `foreign` t
                LEFT JOIN `photo` ON (t.`foreignID` = photo.R_ID AND photo.R_TYPE = 7)
                JOIN `settings` ON (`settingsID` = t.currency)
                WHERE 1";

        $glue = ' AND ';

        //Страна
        if (!empty($_GET['country']) && is_array($_GET['country'])) {
            $country = array();
            foreach ($_GET['country'] as $r) {

                if ((int)$r > 0) {
                    $country[] = (int)$r;
                }
            }
            if(count($country)){
                $sql .= $glue . '`countryID` IN (' . implode(",", $country) . ')';
                $glue = ' AND ';
            }
        }

        //кол-во спален
        //live_count
        if (!empty($_GET['live_count']) && is_array($_GET['live_count'])) {
            $me = array();
            $me6 = false;
            foreach ($_GET['live_count'] as $r) {
                if ((int)$r > 0 && (int)$r<6) {
                    $me[] = $r;
                }
                if( (int)$r == 6){
                    $me6 = true;
                }
            }
            if(count($me)&&!$me6){
                $sql .= $glue . '`live_count` IN (' . implode(",", $me) . ')';
            } elseif(count($me)&&$me6){
                $sql .= $glue . '(`live_count` IN (' . implode(",", $me) . ') OR `live_count` >5)';
            }
        }

        //площадь (содержит окошки для заполнения вручную от __до__ м2),
        //newflat square
        if (!empty($_GET['square'])) {
            //от
            if ((int)$_GET['square']['from'] != 0) {
                $sql .= $glue . "  `square` >= " . (int)$_GET['square']['from'];
            }
            //до
            if ((int)$_GET['square']['to'] != 0) {
                $sql .= $glue . "  `square` <= " . (int)$_GET['square']['to'];
            }
        }
        //цена (содержит окошки для заполнения вручную: от __ до___,  валюта постоянная – рубли, можно выбрать доллары и евро через стрелочку в окошке),
        //Цена newflat price
        if (!empty($_GET['price'])) {

//            $this->currSettings[]['value'];
            //от
            if ((int)$_GET['price']['from'] != 0) {

                $sql .= $glue . " (`settings`.`value` * t.price) >= " . ($this->currencyValue * (int)$_GET['price']['from']) ." ";
            }
            //до
            if ((int)$_GET['price']['to'] != 0) {
                $sql .= $glue . "   (`settings`.`value` * t.price) <= ". ($this->currencyValue * (int)$_GET['price']['to'] )."  ";
            }
        }
        

        //type
        //Тип объекта
        if (!empty($_GET['type'])&&(int)$_GET['type']>0){
            $sql .= $glue . '`type` = '.(int)$_GET['type'];
            $glue = ' AND ';
        }


        $Fsql = "
            GROUP BY t.`foreignID`
            ORDER BY t.`foreignID` DESC
            ";
        $Fsql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;


        $sql .= $Fsql;
        $res = nga_config::db()->query($sql);



        if (!$res) {
            echo nga_config::db()->error;
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
                	 t.`" . $idField . "` as `tid`,
                	 t." . $squareColumn . " as `square`,

                	 (`settings`.`value` * `t`.price) AS `rub_price`,
                         `t`.price AS `price`,
                         t.`currency`,


                	 photo.THUMB, photo.MID

                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	JOIN `settings` ON (`settingsID` = t.currency)

                	WHERE

                	    ( (`settings`.`value` * `t`.price)  <= " .   $this->currencyValue * $price ." )
                	    AND ( (`settings`.`value` * `t`.price)  >= " .   $this->currencyValue * $price ." * 0.5 )

                	AND t.`" . $idField . "` != " . (int)$id . " " . $addWhere . "
                	ORDER BY `rub_price` DESC,  `photo`. `photoID` ASC
                	LIMIT 1) a UNION

                SELECT * FROM (
                	SELECT t .`" . $idField . "` as `tid`,
                	t." . $squareColumn . " as `square`,

                    (`settings`.`value` * `t`.price) AS `rub_price`,
                	 `t`.price AS `price`,
                	 t.`currency`,

                	 photo.THUMB, photo.MID

                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	JOIN `settings` ON (`settingsID` = t.currency)
                	WHERE

                    ( (`settings`.`value` * `t`.price)  >= " .   $this->currencyValue * $price ." )
                    AND ( (`settings`.`value` * `t`.price)  <= " .   $this->currencyValue * $price ." * 1.5)

                	AND t.`" . $idField . "` != " . (int)$id . " " . $addWhere . "
                	ORDER BY `rub_price` ASC, `photo`. `photoID` ASC
                	LIMIT 2
                ) b
                GROUP BY `tid`
                ORDER BY `rub_price` ASC
                ";

//                	(SELECT `value`* t." . $priceColumn . " FROM `settings` WHERE `settingsID` = t.currency) as `price`,
        $res = nga_config::db()->query($sql);
        echo '<!--'.$sql.'-->';
        if (!$res){
            echo nga_config::db()->error; // return false;
            //echo $sql;
            //debug_print_backtrace();

        }

        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['tid']] = $row;
        }
        return $data;
    }

}