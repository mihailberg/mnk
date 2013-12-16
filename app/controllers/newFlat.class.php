<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ng
 * Date: 11/30/12
 * Time: 1:42 AM
 * To change this template use File | Settings | File Templates.
 */
class newFlat extends ngaController
{

    public function __construct($url)
    {
        $this->entityName = 'newflat';
        $this->tableName = 'newflat_gk';
        //Default template(common list)
        $this->tpl = '_common_list_plate';
        return parent::__construct($url);
    }

    public function actionIndex()
    {
        if (!empty($_POST)) {
            return $this->search();
        }
        $this->layout = 'layout_search';
        $this->tpl = 'newFlatSearch';
        $this->tplData['new_flat'] = false;
        $this->layoutData['title'] = 'Новостройки > Поиск';
        $this->layoutData['h1'] = 'Поиск новостроек';
        include('nga/tables/newflat_gk.php');

        $result = array();
        $res = $this->search();
        if ($res) {
            while ($row = $res->fetch_assoc()) {
                $result[] = $row;
            }
            //return false;
        }

        $this->layoutData['mapResult'] = $result;
        $this->layoutData['searchResult'] = $newflat_gk->getData();
        $this->tplData['city'] = $coordinates[0]->getValues(); // $city->getData();
        $this->tplData['city'][0] = '';
    }

    public function actionAll()
    {
        $this->layout = 'layout_white';
        //For lists values
        include('nga/tables/newflat_gk.php');

        $this->assignMetro();
        $this->assignDistrict();
        $mo = 0;
        if(isset($_GET['mo'])) $mo = (int)$_GET['mo'];

        $sql= "SELECT SQL_CALC_FOUND_ROWS
                `newflat_gk`.`newflat_gkID` AS `tid`,
                 `newflat_gk`.`title`,
                  `newflat_gk`.`type`,
                  `newflat_gk`.`complete_year`,`newflat_gk`.`kvartal`,  MIN( `newflat`.`price`) as `price`, MIN( `newflat`.`price_m`) as `price_m`, MIN( `newflat`.`square`) as `square`,
                   `newflat_gk`.`banks`, `newflat_gk`.`description`, `newflat_gk`.`cityID`, `newflat_gk`.`latitude`, `newflat_gk`.`longitude`, `newflat_gk`.`address`,
                    `newflat_gk`.`district`, `newflat_gk`.`stationID`, `newflat_gk`.`howget`, `newflat_gk`.`best`,
                `newflat_gk`.`elite`,
                `newflat`.`currency` as `currency`,
                photo.THUMB, photo.MID,
                photo.SRC as `SRC`
            FROM `newflat_gk`
            LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID)
            LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
            WHERE (`elite`=0 OR `elite_check` = 1) AND `newflat_gk`.`cityID` ";
        if($mo == 0){
            $sql .= " = 1 ";
        } else {
            $sql .= " !=1 ";
        }

        $sql .= "
            GROUP BY  `newflat_gk`.`newflat_gkID`
            ORDER BY `newflat`.`price_m` ASC
            ";
        //print_r($_GET);
        //print_r($newflat_gk->OverrideQuerySelect);
        $sql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;

        $this->assignCity();


        $res = nga_config::db()->query($sql);
        if(!$res) return false;
//        echo nga_config::db()->error;
        $data = array();
        while($row = $res->fetch_assoc()){
            $data[$row['tid']] = $row;
        }

        $foundRows = $this->getFoundRows();


        $this->tplData['searchResult'] = $data;
        $this->tplData['rowCount'] = $foundRows;
        //print_r($this->tplData);

        //$this->layoutData['title'] = 'Новостройки > все предложения';
        //$this->layoutData['h1'] = 'Новостройки';
        if($mo == 0){
            $this->layoutData['title'] = 'Новостройки в Москве / все предложения';
            $this->layoutData['h1'] = 'Новостройки в Москве';
        } else {
            $this->layoutData['title'] = 'Новостройки в подмосковье / все предложения';
            $this->layoutData['h1'] = 'Новостройки в подмосковье';
        }

    }

    public function actionGk($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)array_shift($url);

        if ($id == 0) return false;
        //print_r($id);


        $this->layout = 'layout_one';
        $this->tpl = 'newflat_gk_one';

        //Data
        include('nga/tables/newflat_gk.php');
        //$newflat_gk->addWhere('newflat_gkID', $id);
        $newflat_gk->OverrideQuerySelect = "SELECT
                        `newflat_gk`.`newflat_gkID` AS `tid`,
                         `newflat_gk`.`title`,
                          `newflat_gk`.`type`,
                          `newflat_gk`.`complete_year`,
                          `newflat_gk`.`kvartal`,
                          `newflat`.`currency`,
                          `newflat`.`room`,
                            MIN( `newflat`.`price`) as `price`, MIN( `newflat`.`price_m`) as `price_m`, MIN( `newflat`.`square`) as `square`,
                           `newflat_gk`.`banks`, `newflat_gk`.`description`, `newflat_gk`.`cityID`, `newflat_gk`.`latitude`, `newflat_gk`.`longitude`, `newflat_gk`.`address`,
                            `newflat_gk`.`district`, `newflat_gk`.`stationID`, `newflat_gk`.`howget`, `newflat_gk`.`best`,
                        `newflat_gk`.`elite`,
                        photo.THUMB, photo.MID,
                        photo.SRC as `SRC`
                    FROM `newflat_gk`
                    LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID)
                    LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                    WHERE `newflat_gk`.newflat_gkID = ".$id."
                    GROUP BY  `newflat_gk`.`newflat_gkID`";
        $data = $newflat_gk->getData();


        //Wrong id
        if (!is_array($data))
            return false;


        $this->tplData['newflat'] = $data[$id];

        $this->layoutData['description'] = $data[$id]['description'];

        $this->tplData['house_types'] = $newflat_gk_block[1]->getValues();
        $this->tplData['house_types'][0] = '';


        $this->assignCity();

        $this->tplData['district'] = $coordinates[4]->getValues(); // $city->getData();
        $this->tplData['district'][0] = '';
        $this->tplData['coords'] = array('title' => $data[$id]['title'], 'latitude' => $this->tplData['newflat']['latitude'], 'longitude' => $this->tplData['newflat']['longitude']);

        $this->layoutData['id'] = $id;
        $this->layoutData['title'] = "Новостройки > " . $data[$id]['title'];
        $this->layoutData['h1'] = $data[$id]['title'];
		
		$city = ($data[$id]['cityID'] == 1) ? ' AND cityID = 1' : ' AND cityID != 1';
		/* все поля должны быть заполнены, иначе валится MySQL-запрос */
		if ($data[$id]['room'] == null) $data[$id]['room'] = "'Не установлено'";
		/* */

        $this->layoutData['similarObjects'] = $this->getSimilarObjects('newflat', $id, $data[$id]['price'], 2,$data[$id]['currency'], $city);
        if(!count($this->layoutData['similarObjects'])) unset($this->layoutData['similarObjects']);
        if (count($url)) {
            //print_r($url);
            $subUrl = array_shift($url);
            if ($subUrl == 'planirovki') {
                // Планировки

                $this->tplData['city'] = $coordinates[0]->getValues(); // $city->getData();
                $this->tplData['city'][0] = '';

                include('nga/tables/plan.php');
                $plan->addWhere('newflat_gkID', $id);
                $plan->order = false;

                $plan->addOrderBy('korpus', 'ASC');
                $plan->addOrderBy('section', 'ASC');

                $currentPlan = clone $plan;
                $allPlansData = $plan->getData();

                if (count($url)) {
                    if ($url[0] == 'korpus' && !empty($url[1])) {
                        $currentPlan->addWhere('korpus', "'" . nga_config::db()->real_escape_string(urldecode($url[1])) . "'");

                        if (isset($url[2]) && $url[2] == 'section' && !empty($url[3])) {
                            $currentPlan->addWhere('section', "'" . nga_config::db()->real_escape_string($url[3]) . "'");
                        }
                    }
                }

                $planData = $currentPlan->getData();
                $korpus = array();
                if (is_array($allPlansData)) {
                    foreach ($allPlansData as $k => $p) {
                        if (!isset($korpus[$p['korpus']])) $korpus[$p['korpus']] = $p;
                        $korpus[$p['korpus']]['sections'][$p['section']] = $p;
                    }
                }
                if (!is_array($planData)) {
                    $planData = array();
                }
                $this->tplData['currentPlan'] = array_shift($planData);
                $this->tplData['korpus'] = $korpus;
                $this->tpl = 'newflat_gk_plan';
                return;
            }

            if ($subUrl == 'svobodnye') {
                // Подъобъекты жк newflat
                include('nga/tables/newflat.php');
//                $newflat->addWhere('newflat_gkID', $id);
//                $this->tplData['searchResult'] = $newflat->getData();

                $sql = "SELECT
                    n.newflatID as tid,
                    n.*,
                    (`settings`.`value` * `n`.price) AS `rub_price`,
                    (`settings`.`value` * `n`.price_m) AS `rub_price_m`

                    FROM `newflat` n
                    JOIN `settings` ON (`settingsID` = n.currency)
                    WHERE n .newflat_gkID = ".$id;
                $res = nga_config::db()->query($sql);
                if (!$res){
                    echo nga_config::db()->error; // return false;
                    echo $sql;
                    debug_print_backtrace();
                }

                $data = array();
                while ($row = $res->fetch_assoc()) {
                    $data[$row['tid']] = $row;
                }

//                echo '<!--        '.        print_r($data,1). ' -->';


                $this->tplData['searchResult'] = $data;
                //include('nga/tables/newflat.php');

                $this->tpl = 'newflat_list';
                return;
            }

            //Строительная готовность
            if ($subUrl == 'stroitelnaya-gotovnost') {
                $this->tpl = 'newflat_gk_gallery';
                $res = nga_config::db()->query("SELECT * FROM `photo` WHERE `R_TYPE` = 1 AND `R_ID` =" . (int)$id . " ");
                if (!$res) return array();

                $phdata = array();

                while ($row = $res->fetch_assoc()) {
                    $phdata[$row['photoID']] = $row;
                }

                $this->tplData['photos'] = $phdata;
                //print_r($this->tplData);
            }

            //расположение
            if ($subUrl == 'raspologenie') {
                $this->tpl = 'newflat_gk_raspologenie';
//                return;
            }

        } else {
            $this->layoutData['photos'] = $this->getPhoto(2, $id);
            $this->layoutData['newflat_minimal'] = self::getMinimalGkCosts($id);
        }

        //$this->layoutData['apartments'] = $data[$id]['apartments']
        $this->tplData['newFlat'] = $data[$id];

        $this->layoutData['description'] = $data[$id]['description'];

        $this->assignMetro();
        //$this->tplData['metro'] = $coordinates[5]->getValues();
        //$this->tplData['metro'][0] = '';
    }


    public static function getMinimalGkCosts($newflat_gkID)
    {
        $return = array();
        $sql = "

select

	zz.newflat_gkID,
	zz.room as `room`,

	#p.rub_price as `price`,
	p.price as `price`,
	p.currency as `price_currency`,

	#p1.rub_price_m as `price_m`,
	p1.price_m as `price_m`,
	p1.currency as `price_m_currency`,

	p2.square as `square`
	from (
		#MIN PRICE
		select
			nf1.newflat_gkID,
			nf1.room,
			min(nf1.rub_price) as rub_price_mix,
			min(nf1.rub_price_m) as rub_price_m_mix,
			min(nf1.square) as square_mix
		from (
				select
					`t`.`newflat_gkID` AS `newflat_gkID`,
					`t`.`room` AS `room`,

					(`t`.`price` * `settings`.`value`) AS `rub_price`,
					(`t`.`price_m` * `settings`.`value`) AS `rub_price_m`,
					`t`.`price` AS `price`,
					`t`.`price_m` AS `price_m`,
					`t`.`newflatID` AS `newflatID`,
					`t`.`currency` AS `currency`,
					`t`.`square` AS `square`

				from `newflat` `t`
				join `settings` on(`t`.`currency` = `settings`.`settingsID`)
				where (`t`.`room` > 0)
			) nf1
			group by nf1.newflat_gkID, nf1.room
			ORDER BY nf1.newflat_gkID, nf1.room
		) zz
		join (
					select
						`t`.`newflat_gkID` AS `newflat_gkID`,
						`t`.`room` AS `room`,

						(`t`.`price` * `settings`.`value`) AS `rub_price`,
						(`t`.`price_m` * `settings`.`value`) AS `rub_price_m`,
						`t`.`price` AS `price`,
						`t`.`price_m` AS `price_m`,
						`t`.`newflatID` AS `newflatID`,
						`t`.`currency` AS `currency`,
						`t`.`square` AS `square`

					from `newflat` `t`
					join `settings` on(`t`.`currency` = `settings`.`settingsID`)
					where (`t`.`room` > 0)
                ) p ON (zz.rub_price_mix=p.rub_price)
		join (
					select
						`t`.`newflat_gkID` AS `newflat_gkID`,
						`t`.`room` AS `room`,

						(`t`.`price` * `settings`.`value`) AS `rub_price`,
						(`t`.`price_m` * `settings`.`value`) AS `rub_price_m`,
						`t`.`price` AS `price`,
						`t`.`price_m` AS `price_m`,
						`t`.`newflatID` AS `newflatID`,
						`t`.`currency` AS `currency`,
						`t`.`square` AS `square`

					from `newflat` `t`
					join `settings` on(`t`.`currency` = `settings`.`settingsID`)
					where (`t`.`room` > 0)
                ) p1 ON (zz.rub_price_m_mix=p1.rub_price_m)
		join (
					select
						`t`.`newflat_gkID` AS `newflat_gkID`,
						`t`.`room` AS `room`,

						(`t`.`price` * `settings`.`value`) AS `rub_price`,
						(`t`.`price_m` * `settings`.`value`) AS `rub_price_m`,
						`t`.`price` AS `price`,
						`t`.`price_m` AS `price_m`,
						`t`.`newflatID` AS `newflatID`,
						`t`.`currency` AS `currency`,
						`t`.`square` AS `square`

					from `newflat` `t`
					join `settings` on(`t`.`currency` = `settings`.`settingsID`)
					where (`t`.`room` > 0)
                ) p2 ON (zz.square_mix=p2.square)
        WHERE zz.newflat_gkID = " . (int)$newflat_gkID . "
        GROUP BY zz.room
        ORDER BY zz.room
                ";
        //echo $sql;
        $res = nga_config::db()->query($sql);
        if (!$res) return $return;


        while ($row = $res->fetch_assoc()) {
            $return[$row['room']] = $row;
        }
        return $return;
    }


    public function actionSearch(){
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

        $this->tplData['searchResult'] = $result;
        //print_r($this->tplData);
        $this->tplData['rowCount'] = $this->rowCount;
        $this->layoutData['h1'] = 'Новостройки';
        $this->layoutData['title'] = 'Новостройки > Результаты поиска';
    }
    
    // ПОИСК
    protected function search()
    {
        //$newflat_gk = new nga_table();
        include 'nga/tables/newflat_gk.php';
        $glue = ' AND ';
        $sql = "SELECT
                                    `newflat_gk`.`newflat_gkID` AS `tid`,
                 `newflat_gk`.`title`,
                  `newflat_gk`.`type`,
                  `newflat`.`currency` as `currency`,

                  `newflat_gk`.`complete_year`,`newflat_gk`.`kvartal`,  MIN( `newflat`.`price`) as `price`, MIN( `newflat`.`price_m`) as `price_m`, MIN( `newflat`.`square`) as `square`,
                   `newflat_gk`.`banks`, `newflat_gk`.`description`, `newflat_gk`.`cityID`, `newflat_gk`.`latitude`, `newflat_gk`.`longitude`, `newflat_gk`.`address`,
                    `newflat_gk`.`district`, `newflat_gk`.`stationID`, `newflat_gk`.`howget`, `newflat_gk`.`best`,
                `newflat_gk`.`elite`,
                photo.THUMB, photo.MID,
                photo.SRC as `SRC`
            FROM `newflat_gk`
            LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID";

        //NewFlat
        //количество комнат (1,2,3,4 и более),
        //newflat room isroom
        if (!empty($_GET['room'])) {
            $sql .= $glue . $this->makeRoomSql(); //newflat room isroom
        }

        //площадь (содержит окошки для заполнения вручную от __до__ м2),
        //newflat square
        if (!empty($_GET['square'])) {
            //от
            if ((int)$_GET['square']['from'] != 0) {
                $sql .= $glue . "  `newflat`.`square` >= " . (int)$_GET['square']['from'];
            }
            //до
            if ((int)$_GET['square']['to'] != 0) {
                $sql .= $glue . "  `newflat`.`square` <= " . (int)$_GET['square']['to'];
            }
        }

        //цена (содержит окошки для заполнения вручную: от __ до___,  валюта постоянная – рубли, можно выбрать доллары и евро через стрелочку в окошке),
        //Цена newflat price
        if (!empty($_GET['price'])) {
            //от
            if ((int)$_GET['price']['from'] != 0) {
                $sql .= $glue . "  `newflat`.`price` >= " . $this->currencyValue * (int)$_GET['price']['from'];
            }
            //до
            if ((int)$_GET['price']['to'] != 0) {
                $sql .= $glue . "  `newflat`.`price` <= " . $this->currencyValue * (int)$_GET['price']['to'];
            }
        }
        $sql .= " )
        LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
        ";


        //NEWFLAT-GK
        $sql .= " WHERE 1 ";
        $glue = " AND ";

        //округ (при открытии страницы загружается, как любой, далее можно выбрать по стрелочке),
        if (!empty($_GET['district']) && !isset($_GET['districtall'])) {
            $in = array();
            foreach ($_GET['district'] as $r) {
                if ((int)$r > 9 || (int)$r < 1) {
                    die("Incorrect search data");
                }
                $in[] = (int)$r;
            }
            if(count($in)){
                $sql .= $glue . " `newflat_gk`.`district` IN (" . implode(",", $in) . ")";
                $glue = ' AND ';
            }
        }

        $sql .= '';

        //тип дома (панель, кирпич, кирпич-монолит, иное, все),
        //newflat_gk type
        if (!empty($_GET['type']) && !isset($_GET['typeall'])) {
            $in = array();
            foreach ($_GET['type'] as $r) {
                if ((int)$r > 9 || (int)$r < 1) {
                    die("Incorrect search data");
                }
                $in[] = (int)$r;
            }
            if(count($in)){
                $sql .= $glue . " `newflat_gk`.`type` IN (" . implode(",", $in) . ")";
                $glue = ' AND ';
            }
        }


        //срок сдачи (указывается текущий год, далее можно выбрать),
        //newflat_gk complete_year
        if (!empty($_GET['complete_year'])) {
            $sql .= $glue . "`newflat_gk`.`complete_year` = " . $_GET['complete_year'];
        }


        //ипотека (выборка отмечается галочкой).
        //newflat_gk banks
        if (!empty($_GET['banks'])) {
            $sql .= $glue . "`newflat_gk`.`banks` != ''";
        }

        //NoMsk
        if (isset($_GET['noMsk'])) {
            if($_GET['noMsk'] == 1)     $sql .= $glue . '`newflat_gk`.`cityID` != 1';
            if($_GET['noMsk'] == 0)     $sql .= $glue . '`newflat_gk`.`cityID` = 1';
        }

        //ГОРОД
        if (!empty($_GET['city']) && is_array($_GET['city'])) //Это если галочка "все типы дома" тогда условия не добавляем
         {
             $city = array();
            foreach ($_GET['city'] as $r) {

                if ((int)$r > 0) {
                    $city[] = (int)$r;
                }
            }
             if(count($city)){
                 $sql .= $glue . '`newflat_gk`.`cityID` IN (' . implode(",", $city) . ')';
                 $glue = ' AND ';
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
                $sql .= $glue . '`newflat_gk`.`stationID` IN (' . implode(",", $me) . ')';
            }
        }



        $sql .= " GROUP BY `newflat_gk`.`newflat_gkID`";

        $sql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;
        //echo $sql;
        //print_r($_GET);

        $res = nga_config::db()->query($sql);

        if (!$res) {
            return false;
        }

        $this->rowCount = $this->getFoundRows();
        return $res;
    }



//$this->layoutData['similarObjects'] = $this->getSimilarObjects('newflat', $id, $data[$id]['price'], 2,$data[$id]['currency'], $city.' AND newflat.room = '.$data[$id]['room']);


    protected function getSimilarObjects($table, $id, $price, $photoType, $currency = 1, $addWhere = '', $priceColumn = 'price', $squareColumn = 'square', $idField = false)
    {
        if (empty($price)) $price = 0;

        $curquery = "SELECT `settingsID`, `value` FROM `settings`";
        $curres = nga_config::db()->query($curquery);
        $exchange = array();
        while ($row = $curres->fetch_assoc()) {
            $exchange[$row['settingsID']] = $row['value'];
        }

        // Price in rubles
        $rubPrice = $price *  $exchange[$currency];

        $sql = "
SELECT
newflat.newflat_gkID as tid,
newflat_gk.title as `title`,
`newflat`.`currency` as `currency`,
`newflat`.`square` as `square`,
`newflat`.`price` as price,
(`settings`.`value` * `newflat`.`price`) as rub_price,

photo.THUMB, photo.MID
FROM `newflat`
JOIN `settings` ON (`newflat`.currency = settings.`settingsID`)

JOIN `newflat_gk` ON (newflat.`newflat_gkID` = newflat_gk.newflat_gkID)
JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = `photo`.`R_ID` AND `R_TYPE` = 2)


WHERE
#todo city+elite
    `newflat_gk`.`newflat_gkID` != " . (int)$id . "
    ".$addWhere."
    AND (`newflat_gk`.`elite_check` = 1 OR `newflat_gk`.`elite`=0)
    AND `settings`.`value` * `newflat`.`price` IN (	SELECT	MIN(`settings`.`value` * `newflat`.`price`) as rubPrice
	                FROM `newflat`	JOIN `settings` ON `newflat`.currency = settings.`settingsID`	GROUP BY `newflat_gkID`
	)

AND (`settings`.`value` * `newflat`.`price`) >= ".( $rubPrice * 0.5 )."
GROUP BY newflat.`newflat_gkID`
ORDER BY (`settings`.`value` * `newflat`.`price`) ASC, `photo`. `photoID` ASC
LIMIT 4
";

        $res = nga_config::db()->query($sql);
//        echo '<pre>';
//        echo $sql;
        if (!$res){

//            echo nga_config::db()->error;
//            echo $sql;
//            debug_print_backtrace();
            return false;
        }

        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['tid']] = $row;
        }

//        print_r($data);die();
        return $data;
    }






    /************************/



}