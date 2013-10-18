<?php

class elite extends ngaController
{

    public function __construct($url)
    {
        $this->entityName = __CLASS__;
        $this->tableName = __CLASS__;
        //Default template(common list)
        $this->tpl = '_common_list_plate';
        return parent::__construct($url);
    }


    protected function getCoords()
    {
        $bestPack = array(
            'newflat' => "SELECT
                    'elite' as `globalType`,
                    'newflat' as `eliteType`,

                    newflat_gk.`newflat_gkID` as `tid`,`X`,`Y`,
                    newflat_gk.`title`,      `address`,  `stationID`,     MIN( `newflat`.`price`) as `price`, MIN( `newflat`.`price_m`) as `price_m`, MIN( `newflat`.`square`) as `square`,
                                    `newflat_gk`.`banks`, `newflat_gk`.`elite`,
                                                  photo.THUMB, photo.MID
                                                  FROM `newflat_gk`
                                                  LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID)
                                                  LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                                                  WHERE (`elite`=1 OR `elite_check` = 1)
                                				  GROUP BY  `newflat_gk`.`newflat_gkID`",
            'flat' => "SELECT
                        'elite' as `globalType`,
                        'flat' as `eliteType`,
                          `flat`.`flatID` AS `tid`,`X`,`Y`,
                           `flat`.`address`, `flat`.`cityID`, `flat`.`regionID`, `flat`.`stationID`, `flat`.`price`, `flat`.`price_m`, `flat`.`isroom`, `flat`.`room`, `flat`.`floor`, `flat`.`floors`, `flat`.`square`, `flat`.`square_live`, `flat`.`square_rooms`, `flat`.`square_kitchen`, `flat`.`bath_count`, `flat`.`status`, `flat`.`balcony`, `flat`.`window`, `flat`.`phone`, `flat`.`type`, `flat`.`lift`, `flat`.`metro_remoteness`, `flat`.`banks`, `flat`.`best`, `flat`.`latitude`, `flat`.`longitude`, `flat`.`incity`, `flat`.`district`,                                            `flat`.`elite`,
                            flat.title as `title`,
                            flat.square as `square`,
                            'Городская недвижимость' as `section_title`,
                              `photo`.`THUMB` as `THUMB`

                                                        FROM `flat`
                                                        LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                                                        WHERE (`elite`=1 OR `elite_check` = 1)
                                                        GROUP BY  `flat`.`flatID`
                                                        ORDER BY `flat`.`flatID` DESC ",
            'land' => "SELECT
                          'elite' as `globalType`,

                         'land' as `eliteType`,
                          `land`.`landID` AS `tid`,

                          land.*,
                          `square_house` as `square`,
                          `settlement` as `address`,
                            photo.THUMB, photo.MID,
                            `highway`.`title` as `highway`
                            FROM `land`
                            LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
                            JOIN `highway` ON (land.highwayID = highway.highwayID)
                            WHERE (`land`.`elite`=1 OR `elite_check`=1)
                            GROUP BY `land`.`landID`
                            ",
        );
        $searchResult = array();
        foreach ($bestPack as $type => $sql) {
            $res = nga_config::db()->query($sql);
            //echo $sql;
            if (!$res) {
                die(nga_config::db()->error);
                continue;
            }
            while ($row = $res->fetch_assoc()) {
                $searchResult[] = $row;
            }
        }

        return $searchResult;
    }


    public function actionIndex()
    {
        $this->layout = 'layout_search';
        $this->tpl = 'eliteSearch';

        $this->assignHighway(1);
        $this->assignMetro(1);
        $this->layoutData['eliteMap'] = $this->getCoords();

        $this->layoutData['title'] = 'Элитная недвижимость > Поиск';
        $this->layoutData['h1'] = 'Элитная недвижимость';
    }


    public function actionLand($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        include('nga/tables/land_elite.php');
        $land_table->where = '';
        $land_table->addWhere('landID', $id);


        $data = $land_table->getData();
		$data[$id]['type'] = explode(',',$data[$id]['type']);
        //
        //$data[$id]
        //Wrong id
        if (!is_array($data))
            return false;

        $this->layoutData['photos'] = $this->getPhoto(5, $id);

        $this->layout = 'layout_one';
        $this->tpl = 'land_one';

        $this->layoutData['title'] = 'Элитная загородная недвижимость > '.$data[$id]['title'];
        $this->layoutData['h1'] = $data[$id]['title'];
        $this->tplData['land'] = $data[$id];
        $this->tplData['coords'] = array('title' => $data[$id]['tid'], 'latitude' => $data[$id]['latitude'], 'longitude' => $data[$id]['longitude']);
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->layoutData['similarObjects'] = $this->getSimilarObjects('land', $id, $data[$id]['price'], 5, $data[$id]['currency'], 'AND (`elite`=1 OR `elite_check`=1)', 'price', 'square_house');
        if(!count($this->layoutData['similarObjects'])) unset($this->layoutData['similarObjects']);
        $this->layoutData['oneObjectUrl'] = 'land';
        $this->tplData['id'] = $this->layoutData['id'] = $id;


        $this->assignHighway();
        $this->assignRegion();
        $this->assignCity();
        $this->assignTrainway();

        $this->layoutData['description'] = $data[$id]['description'];
    }


    public function actionGk($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)array_shift($url);

        if ($id == 0) return false;
        //print_r($id);

        $this->tplData['id'] = $this->layoutData['id'] = $id;



        $this->layout = 'layout_one';
        $this->tpl = 'newflat_gk_one';

        //Data
        include('nga/tables/newflat_gk_elite.php');

        $newflat_gk->OverrideQuerySelect = "SELECT
                               `newflat_gk`.`newflat_gkID` AS `tid`,
                                `newflat_gk`.`title`,
                                 `newflat_gk`.`type`,`newflat_gk`.`apartments`,
                                 `newflat_gk`.`complete_year`,
                                   MIN( `newflat`.`price`) as `price`, MIN( `newflat`.`price_m`) as `price_m`, MIN( `newflat`.`square`) as `square`,
                                  `newflat_gk`.`banks`, `newflat_gk`.`description`, `newflat_gk`.`cityID`, `newflat_gk`.`latitude`, `newflat_gk`.`longitude`, `newflat_gk`.`address`,
                                   `newflat_gk`.`district`, `newflat_gk`.`stationID`, `newflat_gk`.`howget`, `newflat_gk`.`best`,
                                   `newflat`.currency,
                               `newflat_gk`.`elite`,
                               photo.THUMB, photo.MID,
                               photo.SRC as `SRC`
                           FROM `newflat_gk`
                           LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID)
                           LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                           WHERE (`elite`=1 OR `elite_check` = 1) and `newflat_gk`.newflat_gkID = ".$id."
                           GROUP BY  `newflat_gk`.`newflat_gkID`";
        $data = $newflat_gk->getData();
        if (!is_array($data))   //404
            return false;

        $this->layoutData['description'] = $data[$id]['description'];
        $this->layoutData['similarObjects'] = $this->getSimilarObjectsNewflat('newflat_gk', $id, $data[$id]['price'], 2, $data[$id]['currency'], 'AND 1');
        if(!count($this->layoutData['similarObjects'])) unset($this->layoutData['similarObjects']);
        $this->layoutData['oneObjectUrl'] = 'gk';
        $this->layoutData['apartments'] = $data[$id]['apartments'];



        $this->tplData['elite'] = $data[$id];
        $this->tplData['coords'] = array('title' => $data[$id]['title'], 'latitude' => $this->tplData['elite']['latitude'], 'longitude' => $this->tplData['elite']['longitude']);
        $this->tplData['house_types'] = $newflat_gk_block[1]->getValues();
        $this->tplData['house_types'][0] = '';


        $this->assignCity();

        $this->tplData['district'] = $coordinates[4]->getValues(); // $city->getData();
        $this->tplData['district'][0] = '';

        $this->layoutData['title'] = "Элитные новостройки > " . $data[$id]['title'];
        $this->layoutData['h1'] = $data[$id]['title'];


        if (count($url)) {
            //print_r($url);
            $subUrl = array_shift($url);
            if ($subUrl == 'planirovki') {
                // Планировки

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
                return true;
            }

            if ($subUrl == 'svobodnye') {
                // Подъобъекты жк newflat
                include('nga/tables/newflat.php');
                $newflat->addWhere('newflat_gkID', $id);
                $this->tplData['searchResult'] = $newflat->getData();

                //include('nga/tables/newflat.php');

                $this->tpl = 'newflat_list';
                return true;
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
            include 'app/controllers/newFlat.class.php';
            $this->layoutData['photos'] = $this->getPhoto(2, $id);
            $this->layoutData['newflat_minimal'] = newFlat::getMinimalGkCosts($id);
        }

        //$this->layoutData['apartments'] = $data[$id]['apartments']
        $this->tplData['newFlat'] = $data[$id];
        //print_r($data);

        $this->assignMetro();
    }


    public function actionFlat($url)
    {
        $this->layoutData['oneObjectUrl'] = 'flat';
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        $this->layout = 'layout_one';
        $this->tpl = 'flat_one';

        include ('nga/tables/flat_elite.php');

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
        $this->tplData['flatData'] = $data;
        $this->tplData['id'] = $this->layoutData['id'] = $id;

        $this->assignCity();
        $this->assignMetro();
        $this->assignHighway();

        //Region
        $region = $comment[3]->getValues();
        $region[0] = '';
        $this->tplData['flatData']['regionID'] = $region[$this->tplData['flatData']['regionID']];
        $this->tplData['house_types'] = $comment[21]->getValues();
        $this->tplData['house_types'][0] = '';

        $this->layoutData['photos'] = $this->getPhoto(3, $id);
        $this->layoutData['similarObjects'] = $this->getSimilarObjects('flat', $id, $data['price'], 3, $data['currency'], 'AND `elite`=1', 'price');


        $this->layoutData['description'] = $data['description'];


        $this->layoutData['title'] = 'Элитная недвижимость > '.$this->tplData['flatData']['title'];
        $this->layoutData['h1'] = $this->tplData['flatData']['title'];

    }


    public function actionAll()
    {
        include('nga/tables/land.php');
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->tplData['landTypes'][0] = '';

        $this->tplData['train_wayTypes'] = $land_table_block[6]->getValues();
        $this->tplData['train_wayTypes'][0] = '';


        include ('nga/tables/highway.php');
        $this->tplData['highway'] = $highway->getData();



        $this->assignMetro();
        $this->assignDistrict();
        $this->layout = 'layout_white';


        $mo = 0;
        $MOwhere = " AND `cityID`";
        if(isset($_GET['mo'])&&$_GET['mo']==1)$mo =1;
        if($mo == 0){
            $MOwhere .=" = 1 ";
        } else {
            $MOwhere .=  " !=1 ";
        }


        $bestPack = array(
            'newflat' => "SELECT SQL_CALC_FOUND_ROWS
                'elite' as `globalType`,
                'newflat' as `eliteType`,

                `newflat_gk`.`newflat_gkID` as `tid`,
                `newflat_gk`.`title`,
                `newflat`.`currency` as `currency`,

                `address`,  `stationID`,`newflat_gk`.`cityID`,
                `square`,
                `price`,
                `price_m`,
                `currency`,
                            `newflat_gk`.`banks`,`newflat_gk`.`elite`,
                              photo.THUMB, photo.MID
                              FROM `newflat_gk`
                              LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID)
                              LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                              WHERE (`elite`=1 OR `elite_check` = 1) ".$MOwhere."
                              GROUP BY  `newflat_gk`.`newflat_gkID`",

            'flat' => "SELECT SQL_CALC_FOUND_ROWS
                'elite' as `globalType`,
                'flat' as `eliteType`,
                  `flat`.`flatID` AS `tid`,
                  `flat`.`address`, `flat`.`cityID`, `flat`.`regionID`, `flat`.`stationID`, `flat`.`price`, `flat`.`price_m`, `flat`.`isroom`,
                  `flat`.`room`, `flat`.`floor`, `flat`.`floors`, `flat`.`square`, `flat`.`square_live`, `flat`.`square_rooms`, `flat`.`square_kitchen`,
                  `flat`.`bath_count`, `flat`.`status`, `flat`.`balcony`, `flat`.`window`, `flat`.`phone`, `flat`.`type`, `flat`.`lift`, `flat`.`metro_remoteness`,
                  `flat`.`banks`, `flat`.`best`, `flat`.`latitude`, `flat`.`longitude`, `flat`.`incity`, `flat`.`district`,
                  `flat`.`elite`,
                  `currency`,
                                flat.title as `title`,
                                flat.square as `square`,
                      'Городская недвижимость' as `section_title`,
                                  `photo`.`THUMB` as `THUMB`

                                    FROM `flat`
                                    LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                                    WHERE (`elite`=1 OR `elite_check` = 1) ".$MOwhere."
                                    GROUP BY  `flat`.`flatID`
                                    ORDER BY `flat`.`flatID` DESC",
            'land' => "SELECT SQL_CALC_FOUND_ROWS
                  'elite' as `globalType`,

                 'land' as `eliteType`,
                  `land`.`landID` AS `tid`,
                    `land`.`title` as `title`,
                  `land`.`type`,
                  `land`.`cityID`,
                  `land`.`highwayID`,
                   `land`.`cottage_setID`, `land`.`regionID`, `land`.`settlement`, `land`.`train_way`, `land`.`square_house`, `land`.`square_land`, `land`.`price`, `land`.`mkad_remoteness`, `land`.`floors`, `land`.`year`, `land`.`otdelka`, `land`.`mebel`, `land`.`foundation`, `land`.`roof`, `land`.`ceilings`, `land`.`layout`, `land`.`form`, `land`.`fence`, `land`.`gate`, `land`.`landscape_design`, `land`.`parking`, `land`.`communication_electricity`, `land`.`communication_water`, `land`.`heating`, `land`.`internet`, `land`.`phone`, `land`.`ecology`, `land`.`probka`, `land`.`metro_access`, `land`.`infrastructure`, `land`.`latitude`, `land`.`longitude`, `land`.`elite`,
                   `land`.`elite_check`,
                   `currency`,
                    `land`.`best`,photo.THUMB, photo.MID,
                    `highway`.`title` as `highway`
                    FROM `land`
                    LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
                    JOIN `highway` ON (land.highwayID = highway.highwayID)
                    WHERE (`land`.`elite`=1 OR `elite_check`=1) ".$MOwhere."
                    GROUP BY `land`.`landID`
                    ",
        );
        $searchResult = array();
        $rowCount = 0;
        foreach ($bestPack as $type => $sql) {
            $res = nga_config::db()->query($sql);
            $rowCount += $this->getFoundRows();
            //echo $sql;
            if (!$res) {
                die(nga_config::db()->error);
                continue;
            }
            while ($row = $res->fetch_assoc()) {
                $searchResult[] = $row;
            }
        }
        $page_num =1 ;
        $pageResult = array();
        $page_num = floor($rowCount / $this->perPage);
            if (($rowCount % $this->perPage) != 0)
                $page_num++;
        if($page_num!=1){
            $lim_start = ($this->page-1)*$this->perPage;
            $i =0;
            foreach($searchResult as $r){
                if(++$i <=$lim_start){continue;}
                if( $i > ($lim_start+$this->perPage)) continue;
                $pageResult[] = $r;

            }
        }
        if(empty($pageResult))$pageResult = $searchResult;

        $this->tplData['searchResult'] = $pageResult;
        $this->tplData['rowCount'] = $rowCount;

        $this->layoutData['title'] = 'Элитная недвижимость > все предложения';
        $this->layoutData['h1'] = 'Элитная недвижимость';
    }



    public function actionSearch(){
        //print_r($_GET);
        //print_r($_GET);
        include('nga/tables/land.php');
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->tplData['landTypes'][0] = '';

        $this->tplData['train_wayTypes'] = $land_table_block[6]->getValues();
        $this->tplData['train_wayTypes'][0] = '';

        $this->assignHighway();
        $this->assignMetro();
        $this->assignDistrict();

        $this->layout = 'layout_white';

        $searchResult = $this->search();

        $page_num =1 ;
        $pageResult = array();
        $page_num = floor($this->rowCount / $this->perPage);
            if (($this->rowCount % $this->perPage) != 0)
                $page_num++;
        if($page_num!=1){
            $lim_start = ($this->page-1)*$this->perPage;
            $i =0;
            foreach($searchResult as $r){
                if(++$i <=$lim_start){continue;}
                if( $i > ($lim_start+$this->perPage)) continue;
                $pageResult[] = $r;

            }
        }
        if(empty($pageResult))$pageResult = $searchResult;

        $this->tplData['searchResult'] = $pageResult;


        $this->tplData['searchResult'] = $pageResult;
        $this->tplData['rowCount'] = $this->rowCount;

        $this->layoutData['title'] = 'Элитная невижимсть результаты поиска';
        $this->layoutData['h1'] = 'Элитная невижимсть > Результаты поиска';
    }



    protected function search(){
        $glue = ' AND ';
        $eliteSQLHeaders = array();
        $eliteSQLFooter = array();



        $eliteSQLHeaders['newflat'] = "SELECT SQL_CALC_FOUND_ROWS
                'elite' as `globalType`,
                'newflat' as `eliteType`,
              `newflat`.`currency` as `currency`,
                `newflat_gk`.`newflat_gkID` as `tid`,
                newflat_gk.`title`,      `address`,  `stationID`,      min(`newflat`.`square`) as `square`,  min(`newflat`.`price`)as `price`,      min(`newflat`.`price_m`) as `price_m`,
                            `newflat_gk`.`banks`,`newflat_gk`.`elite`,`newflat_gk`.`cityID`,
                              photo.THUMB, photo.MID
                              FROM `newflat_gk`
                              LEFT JOIN `newflat` ON ( `newflat`.`newflat_gkID` = `newflat_gk`.`newflat_gkID` )
                              LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                              WHERE (`elite`=1 OR `elite_check` = 1) ";


        $eliteSQLFooter['newflat'] = "
                              GROUP BY  `newflat_gk`.`newflat_gkID`";
        $eliteSQLHeaders['flat'] = "SELECT SQL_CALC_FOUND_ROWS
                'elite' as `globalType`,
                'flat' as `eliteType`,
                  `flat`.`flatID` AS `tid`, `flat`.`address`, `flat`.`cityID`, `flat`.`regionID`, `flat`.`stationID`, `flat`.`price`, `flat`.`price_m`, `flat`.`isroom`, `flat`.`room`, `flat`.`floor`, `flat`.`floors`, `flat`.`square`, `flat`.`square_live`, `flat`.`square_rooms`, `flat`.`square_kitchen`, `flat`.`bath_count`, `flat`.`status`, `flat`.`balcony`, `flat`.`window`, `flat`.`phone`, `flat`.`type`, `flat`.`lift`, `flat`.`metro_remoteness`, `flat`.`banks`, `flat`.`best`, `flat`.`latitude`, `flat`.`longitude`, `flat`.`incity`, `flat`.`district`,                                            `flat`.`elite`,
                                flat.title as `title`,
                                flat.square as `square`,
                              `flat`.`currency` as `currency`,
                      'Городская недвижимость' as `section_title`,
                                  `photo`.`THUMB` as `THUMB`

                                    FROM `flat`
                                    LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                                    WHERE (`elite`=1 OR `elite_check` = 1)
                                    ";
        $eliteSQLFooter['flat'] = "
                                    GROUP BY  `flat`.`flatID`
                                    ORDER BY `flat`.`flatID` DESC";
        $eliteSQLHeaders['land'] = "SELECT SQL_CALC_FOUND_ROWS
                  'elite' as `globalType`,
                  'land' as `eliteType`,
                  `land`.`landID` AS `tid`,

                  `land`.currency,
                  `land`.`title` as `title`,
                  `land`.`type`,
                  `land`.`cityID`,
                  `land`.`highwayID`,
                   `land`.`cottage_setID`, `land`.`regionID`, `land`.`settlement`, `land`.`train_way`, `land`.`square_house`, `land`.`square_land`, `land`.`price`, `land`.`mkad_remoteness`, `land`.`floors`, `land`.`year`, `land`.`otdelka`, `land`.`mebel`, `land`.`foundation`, `land`.`roof`, `land`.`ceilings`, `land`.`layout`, `land`.`form`, `land`.`fence`, `land`.`gate`, `land`.`landscape_design`, `land`.`parking`, `land`.`communication_electricity`, `land`.`communication_water`, `land`.`heating`, `land`.`internet`, `land`.`phone`, `land`.`ecology`, `land`.`probka`, `land`.`metro_access`, `land`.`infrastructure`, `land`.`latitude`, `land`.`longitude`, `land`.`elite`,
                    `land`.`best`,photo.THUMB, photo.MID
                    FROM `land`
                    LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
                    WHERE (`land`.`elite`=1 OR `elite_check`=1) ";
        $eliteSQLFooter['land'] = "
                    GROUP BY `land`.`landID`
                    ";

        $searchResult = array();
        $rowCount = 0;


        if (isset($_GET['noMsk'])) {
            //moscow
            if($_GET['noMsk'] == 0){

                $newflatSQL = $eliteSQLHeaders['newflat'];
                $flatSQL = $eliteSQLHeaders['flat'];

                $flatSQL.=" AND `cityID` = 1";
                $newflatSQL.=" AND `cityID` =1";
                //Округ
                if (!empty($_GET['district']) && !isset($_GET['districtall'])) {
                    $district = array();
                    foreach ($_GET['district'] as $r) {
                        if ((int)$r < 9 && (int)$r >= 1) {
                            $district[] = (int)$r;
                        }
                    }
                    if (count($district)) {
                        $newflatSQL .= $glue . '`district` IN (' . implode(",", $district) . ')';
                        $flatSQL .= $glue . '`district` IN (' . implode(",", $district) . ')';
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
                        $newflatSQL .= $glue . '`regionID` IN (' . implode(",", $region) . ')';
                        $flatSQL .= $glue . '`regionID` IN (' . implode(",", $region) . ')';
                    }
                }

                //metro
                if (!empty($_GET['mmetro']) && is_array($_GET['mmetro']) //Это если галочка "все типы дома" тогда условия не добавляем
                ) {
                    $mmetro = array();
                    foreach ($_GET['mmetro'] as $r) {

                        if ((int)$r > 0) {
                            $mmetro[] = (int)$r;
                        }
                    }
                    if(count($mmetro)){
                        $newflatSQL .= $glue . '`stationID` IN (' . implode(",", $mmetro) . ')';
                        $flatSQL .= $glue . '`stationID` IN (' . implode(",", $mmetro) . ')';
                    }
                }

                //Количество комнат12345Более 5
                if(!empty($_GET['room'])){
                   $in = array();
                    $more = false;
                   foreach ($_GET['room'] as $r) {
                       if ((int)$r > 6 || (int)$r < 1) {
                           die("Don't hack this");
                       }
                       switch ($r) {
                           case 1:
                           case 2:
                           case 3:
                           case 4:
                           case 5:
                               $in[] = (int)$r;
                               break;
                           case 6:
                               $more = 1;
                               break;
                       }
                   }
                   if (count($in) && $more) {
                       $newflatSQL .= $glue . '( `newflat`.`room` in(' . implode(",", $in) . ') || `newflat`.`room` > 5 )';
                       $flatSQL .= $glue . ' ( `room` in(' . implode(",", $in) . ') || `room` > 5 )';
                   } elseif (count($in) && !$more){
                       $newflatSQL .= $glue . '  `newflat`.`room` in(' . implode(",", $in) . ')';
                       $flatSQL .= $glue . '  `room` in(' . implode(",", $in) . ')';
                   } elseif (!count($in) && $more) {
                        $newflatSQL .= $glue . ' `newflat`.`room` > 5 ';
                        $flatSQL .= $glue . '  `room` > 5 ';
                   }
                }

                //Square
                if (!empty($_GET['square'])) {
                    //от
                    if ((int)$_GET['square']['from'] != 0) {
                        $newflatSQL .= $glue . "  `newflat`.`square` >= " . (int)$_GET['square']['from'];
                        $flatSQL .= $glue . "  `square` >= " . (int)$_GET['square']['from'];
                    }
                    //до
                    if ((int)$_GET['square']['to'] != 0) {
                        $newflatSQL .= $glue . "  `newflat`.`square` <= " . (int)$_GET['square']['to'];
                        $flatSQL .= $glue . "  `square` <= " . (int)$_GET['square']['to'];
                    }
                }
                if (!empty($_GET['price']['from'])||!empty($_GET['price']['to'])) {
                    //от
                    if ((int)$_GET['price']['from'] > 0) {
                        $newflatSQL .= $glue . '`newflat`.`price` >= ' . $this->currencyValue * (int)$_GET['price']['from'] . '';
                        $flatSQL .= $glue . '`price` >= ' . $this->currencyValue * (int)$_GET['price']['from'] . '';
                    }
                    //до
                    if ((int)$_GET['price']['to'] > 0 && (int)$_GET['price']['to'] > (int)$_GET['price']['from']) {
                        $newflatSQL .= $glue . '`newflat`.`price` <=' . $this->currencyValue * (int)$_GET['price']['to'];
                        $flatSQL .= $glue . '`price` <=' . $this->currencyValue * (int)$_GET['price']['to'];
                    }
                }

                $newflatSQL .= $eliteSQLFooter['newflat'];
                $flatSQL .= $eliteSQLFooter['flat'];

                $searchResult=$this->res2array($newflatSQL);
                $fResult=$this->res2array($flatSQL);
                $searchResult = array_merge($searchResult,$fResult);
                //print_r($searchResult);
            } else {
                //NoMsk

                $sql = $eliteSQLHeaders['land'];

                //Площадь
                if (!empty($_GET['squareMO'])) {

                    //от
                    if ((int)$_GET['squareMO']['from'] > 0) {
                        $sql .= $glue . '`squareMO_house` >= ' . (int)$_GET['squareMO']['from'];
                    }
                    //до
                    if ((int)$_GET['squareMO']['to'] != 0) {
                        $sql .= $glue . '`squareMO_house` <= ' . (int)$_GET['squareMO']['to'];
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

                //Цена
                if (!empty($_GET['priceMO'])) {
                    //от
                    if ((int)$_GET['priceMO']['from'] > 0) {
                        $sql .= $glue . '`priceMO` >= ' . $this->currencyValue * (int)$_GET['priceMO']['from'] . '';
                    }
                    //до
                    if ((int)$_GET['priceMO']['to'] > 0 && (int)$_GET['priceMO']['to'] > (int)$_GET['priceMO']['from']) {
                        $sql .= $glue . '`priceMO` <=' . $this->currencyValue * (int)$_GET['priceMO']['to'];
                    }
                }

                if (!empty($_GET['cottage_set_only'])) {
                    $sql .= $glue . '`cottage_setID` != 0';
                }
                $sql.=$eliteSQLFooter['land'];

                $searchResult+=$this->res2array($sql);
            }
        }

        return $searchResult;
    }

    protected function res2array($sql){
        $res = nga_config::db()->query($sql);
        $this->rowCount +=  $this->getFoundRows();

        if (!$res) {
            echo $sql;
            die(nga_config::db()->error);
        }
        $searchResult = array();
        while ($row = $res->fetch_assoc()) {
            //print_r($row);
            $searchResult[] = $row;
        }
//        if($this->rowCount == 2){
            //echo $sql;
//                    print_r($searchResult);
//        }

        return $searchResult;
    }



    public $rowCount = 0;



    protected function getSimilarObjectsNewflat($table, $id, $price, $photoType, $currency, $addWhere = '', $priceColumn = 'price', $squareColumn = 'square', $idField = false)
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
                	 min(" . $squareColumn . ") as `square`,
                	 min(" . $priceColumn . ") as `price`,
                	 photo.THUMB, photo.MID

                	FROM `" . $table . "` t
                	LEFT JOIN `newflat`  on (newflat.newflat_gkID = t .`" . $idField . "`)
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE 
                	  " . $priceColumn . "<= " . $price  . " * ". $exchange[$currency] . " 
                	  AND " . $priceColumn . ">= " . $price  . " * ". $exchange[$currency] . " * 0.5 
                	  AND t.`" . $idField . "` != " . (int)$id . "
                	" . $addWhere . "

                	GROUP BY `tid`
                	ORDER BY `price` DESC,  `photo`. `photoID` ASC
                	LIMIT 1) a UNION

                SELECT * FROM (
                	SELECT t .`" . $idField . "` as `tid`,
                	min(" . $squareColumn . ") as `square`,
                	min(" . $priceColumn . ") as `price`,
                	 photo.THUMB, photo.MID
                	FROM `" . $table . "` t
                	LEFT JOIN `newflat`  on (newflat.newflat_gkID = t .`" . $idField . "`)
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE 
                	  " . $priceColumn . ">= " . $price  . " * ". $exchange[$currency] . " 
                	  AND " . $priceColumn . "<= " . $price  . " * ". $exchange[$currency] . " * 1.5 
                	  AND t.`" . $idField . "` != " . (int)$id . "
                    " . $addWhere . "

                    GROUP BY `tid`
                	ORDER BY `price` ASC, `photo`. `photoID` ASC
                	LIMIT 2
                ) b

                ";

        $res = nga_config::db()->query($sql);
//        echo $sql;
        if (!$res) echo nga_config::db()->error; // return false;
        $data = array();
        while ($row = $res->fetch_assoc()) {
            $data[$row['tid']] = $row;
        }
        return $data;
    }
    
	protected function getSimilarObjects($table, $id, $price, $photoType, $currency, $addWhere = '', $priceColumn = 'price', $squareColumn = 'square', $idField = false)
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
                	 photo.THUMB, photo.MID

                	FROM `" . $table . "` t
                	LEFT JOIN `photo` ON (t .`" . $idField . "` = `photo`.`R_ID` AND `R_TYPE` = " . $photoType . ")
                	WHERE 
                	  " . $priceColumn . "<= " . $price  . " * ". $exchange[$currency] . " 
                	  AND " . $priceColumn . ">= " . $price  . " * ". $exchange[$currency] . " * 0.5
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
                	WHERE 
                	  " . $priceColumn . ">= " . $price  . " * ". $exchange[$currency] . " 
                	  AND " . $priceColumn . "<= " . $price  . " * ". $exchange[$currency] . " * 1.5
                	  AND t.`" . $idField . "` != " . (int)$id . "
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