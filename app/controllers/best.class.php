<?php

/**
 * luchshiye-predlozheniya
 */
class best extends ngaController
{

//    public function __construct($url){
//        var_dump($url);
//        parent::__construct($url);
//    }

    public function actionIndex()
    {
        $routes = array(
             'newflat'=>1,
             'flat'=>1,
             'commercial'=>1,
            'land'=>1,
           'foreign'=>1,
            'elite'=>1,
            'invest'=>1,
        );
        $order = false;
        $orderUrl = func_get_args();
        if(isset($orderUrl[0][0])){
            if(isset($routes[$orderUrl[0][0]])){
                $order  = $orderUrl[0][0];
            } else {
                return false;
            }
        }

        if (!empty($_POST)) {
            return $this->search();
        }

        $this->assignCity();
        $this->assignCountry();
        $this->assignMetro();
        $this->assignHighway();
        $this->assignRegion();

        include('nga/tables/land.php');
        $this->tplData['landTypes'] = $land_table_block[0]->getValues();
        $this->tplData['landTypes'][0] = '';

        $this->tplData['train_wayTypes'] = $land_table_block[6]->getValues();
        $this->tplData['train_wayTypes'][0] = '';

        include('nga/tables/foreign.php');
        $this->tplData['foreignType'] = $foreign_table_block[0]->getValues();
        $this->tplData['foreignObject'] = $foreign_table_block[3]->getValues();

        //print_r($this->tplData);
        //INVEST
        include('nga/tables/invest.php');
        $this->tplData['investType'] = $invest_table_block[0]->getValues();


        $this->layout = 'layout_white';
        $this->tpl = 'best';

        $bestResult = array();

        $bestPack = array(
            'newflat' => "SELECT 'newflat' as `globalType`, 'Новостройки' as `section_title`, `newflat_gk`.`newflat_gkID` as `tid`,  newflat_gk.`title`,      `address`,  `stationID`,
                                          photo.THUMB as `THUMB`,photo.`MID`,
                                          min(`newflat`.`price_m`) as `price_m`,
                                          min(`newflat`.`price`) as `price`,
                                          min(`newflat`.`square`) as `square`
                                          FROM `newflat_gk`
                                          LEFT JOIN `newflat`  on (newflat.newflat_gkID = `newflat_gk`.newflat_gkID)
                                          LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                                          WHERE `best`=1 AND `elite` = 0
                        				  GROUP BY  `newflat_gk`.`newflat_gkID`",
            'flat' => "SELECT  `flat`.`flatID` AS `tid`, `flat`.`address`, `flat`.`cityID`, `flat`.`regionID`, `flat`.`stationID`, `flat`.`price`, `flat`.`price_m`, `flat`.`isroom`, `flat`.`room`, `flat`.`floor`, `flat`.`floors`, `flat`.`square`, `flat`.`square_live`, `flat`.`square_rooms`, `flat`.`square_kitchen`, `flat`.`bath_count`, `flat`.`status`, `flat`.`balcony`, `flat`.`window`, `flat`.`phone`, `flat`.`type`, `flat`.`lift`, `flat`.`metro_remoteness`, `flat`.`banks`, `flat`.`best`, `flat`.`latitude`, `flat`.`longitude`, `flat`.`incity`, `flat`.`district`,                                            `flat`.`elite`,
                                            flat.title as `title`,
                                            flat.square as `square`,
                                               'flat' as `globalType`,
                                               'Городская недвижимость' as `section_title`,
                                              `photo`.`THUMB` as `THUMB`,photo.`MID`

                                                FROM `flat`
                                                LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                                                WHERE `elite` = 0 AND `best`=1
                                                GROUP BY  `flat`.`flatID`
                                                ORDER BY `flat`.`flatID` DESC",
            'land' => "SELECT
                  'land' as `globalType`, 'Загородная недвижимость' as `section_title`,
                  `land`.`landID` AS `tid`,
                  `land`.`type`, `land`.`cityID`, `land`.`highwayID`, `land`.`cottage_setID`, `land`.`regionID`, `land`.`settlement`, `land`.`train_way`, `land`.`square_house`, `land`.`square_land`, `land`.`price`, `land`.`mkad_remoteness`, `land`.`floors`, `land`.`year`, `land`.`otdelka`, `land`.`mebel`, `land`.`foundation`, `land`.`roof`, `land`.`ceilings`, `land`.`layout`, `land`.`form`, `land`.`fence`, `land`.`gate`, `land`.`landscape_design`, `land`.`parking`, `land`.`communication_electricity`, `land`.`communication_water`, `land`.`heating`, `land`.`internet`, `land`.`phone`, `land`.`ecology`, `land`.`probka`, `land`.`metro_access`, `land`.`infrastructure`, `land`.`latitude`, `land`.`longitude`, `land`.`elite`,
                    `land`.`best`,photo.THUMB as `THUMB`,photo.`MID`
                    FROM `land`
                    LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
                    WHERE `best`=1 AND `elite` = 0
                    GROUP BY `land`.`landID`",

            'commercial' => "SELECT `commercial`.`commercialID` AS `tid`, `commercial`.`cityID`, `commercial`.`address`, `commercial`.`stationID`, `commercial`.`title`, `commercial`.`assign`, `commercial`.`parent`, `commercial`.`type`, `commercial`.`square`, `commercial`.`rent`, `commercial`.`price`, `commercial`.`price_m`, `commercial`.`floor`, `commercial`.`floors`, `commercial`.`otdelka`, `commercial`.`security`, `commercial`.`furniture`, `commercial`.`provider`, `commercial`.`tele`, `commercial`.`conditioning`, `commercial`.`planing`, `commercial`.`parking`, `commercial`.`class`, `commercial`.`square_full`, `commercial`.`overlap`, `commercial`.`desc_place`, `commercial`.`desc_bc`, `commercial`.`district`, `commercial`.`best`, `commercial`.`nds`, `commercial`.`operating_costs`, `commercial`.`utility_payments`, `commercial`.`rent_contract`, `commercial`.`lease`, `commercial`.`electricity`,
                    `commercial`.`communication`,
                    photo.THUMB as `THUMB`,photo.`MID`,
                   'commercial' as `globalType`,
                   'Коммерческая недвижимость' as `section_title`
                    FROM `commercial`
                    LEFT JOIN `photo` ON (`commercial`.`commercialID` = photo.R_ID AND photo.R_TYPE = 4)
                    WHERE `best` = 1 AND `parent`=0
                    GROUP BY `commercial`.`commercialID`
                    ORDER BY `commercial`.`commercialID`     DESC",
            'foreign' => "
                    SELECT  `foreign`.`foreignID` AS `tid`, `foreign`.`type`, `foreign`.`countryID`, `foreign`.`cityID`, `foreign`.`object_view`, `foreign`.`square`, `foreign`.`square_land`, `foreign`.`price`, `foreign`.`latitude`, `foreign`.`longitude`, `foreign`.`floor`, `foreign`.`floors`, `foreign`.`section`, `foreign`.`planing`, `foreign`.`best`, `foreign`.`live_count`, `foreign`.`bath_count`, `foreign`.`square_kitchen`, `foreign`.`square_guest`, `foreign`.`year`, `foreign`.`additional_building`, `foreign`.`otdelka`, `foreign`.`mebel`, `foreign`.`phone`, `foreign`.`internet`, `foreign`.`house_type`, `foreign`.`lift`, `foreign`.`guard`, `foreign`.`parking`, `foreign`.`month_costs`, `foreign`.`gk_build_count`, `foreign`.`gk_pool`, `foreign`.`gk_kind_area`, `foreign`.`gk_sea`, `foreign`.`gk_center_remoteness`, `foreign`.`gk_conditions`, `foreign`.`place_description`, `foreign`.`additional_price`,
                    `foreign`.`additional_tax`,
                    photo.THUMB as `THUMB`,photo.`MID`,
                   'foreign' as `globalType`,
                   'Зарубежная недвижимость' as `section_title`,
                       `foreignID` as `tid`,
                        `foreign`.`title` as `title`,
                        NULL as `address`,
                        NULL as `price_m`,
                        NULL as`stationID`
                    FROM `foreign`
                     LEFT JOIN `photo` ON (`foreign`.`foreignID` = photo.R_ID AND photo.R_TYPE = 7)
                     WHERE `best` = 1
                     GROUP BY  `foreign`.`foreignID`",
            'elite' => "SELECT
                                       'elite' as `globalType`,                                       'newflat' as `eliteType`,                                       'Элитная недвижимость' as `section_title`,
                                       `newflat_gkID` as `tid`,                                        `newflat_gk`.`title`,        `address`,

                                        `stationID`,
                                        0 as `square`,
                                        0 as `price`,      0 as `price_m`,photo.THUMB as `THUMB`,photo.`MID`,
                                        null as `type`,
                                        null as `highwayID`,
                                        null as `regionID`,
                                        null as `settlement`,
                                        null as `train_way`,
                                        `newflat_gk`.`elite`


                                      FROM `newflat_gk`
                                      LEFT JOIN `photo` ON (`newflat_gk`.`newflat_gkID` = photo.R_ID AND photo.R_TYPE = 2)
                                      WHERE
                    					`best`=1 AND `elite` = 1
                    					GROUP BY  `newflat_gk`.`newflat_gkID`
                    					UNION
                    SELECT
                                       'elite' as `globalType`,                                       'flat' as `eliteType`,                                       'Элитная недвижимость' as `section_title`,
                                       `flatID` as `tid`,                                       flat.title as `title`,                    					`address`,
                                        `stationID`,
                    					`square`,
                                        `price`,
                    					`price_m`,
                    					photo.THUMB as `THUMB`,photo.`MID`,
                                        null as `highwayID`,
                                        flat.`regionID`,
                    					null as `type`,null as `settlement`,
                    					null as `train_way`,
                    					`flat`.`elite`


                                      FROM `flat`
                                      LEFT JOIN `photo` ON (`flat`.`flatID` = photo.R_ID AND photo.R_TYPE = 3)
                                      WHERE `best`=1 AND `elite` = 1
                                      GROUP BY  `flat`.`flatID`
                    					UNION
                  SELECT
                                       'elite' as `type`,                                       'land' as `eliteType`,                                       'Элитная недвижимость' as `section_title`,
                                       `landID` as `tid`,                                        land.title as `title`,                    					`landID` as `address`,

                                        NULL as `stationID`,
                                        `square_land` as `square`,
                                        `price` as `price`,
                    					NULL as `price_m`,
                    					photo.THUMB as `THUMB`,photo.`MID`,
                    					land.`type`,
                                        land.`highwayID`,
                                        null as `regionID`,
                    					land.`settlement`,
                    					land.`train_way`,
                    					`land`.`elite`
                                      FROM `land`
                                      LEFT JOIN `photo` ON (`land`.`landID` = photo.R_ID AND photo.R_TYPE = 5)
                                      WHERE `best`=1 AND `elite` = 1
                                        GROUP BY  `land`.`landID`",


            'invest' => "SELECT 'invest' as `globalType`,
                                      'Проекты для инвестирования' as `section_title`, `invest`.`investID` AS `tid`, `invest`.`type`, `invest`.`direction`, `invest`.`highwayID`, `invest`.`regionID`, `invest`.`mkad_remoteness`, `invest`.`square`, `invest`.`land_category`, `invest`.`use_type`, `invest`.`buildings`, `invest`.`rights_type`, `invest`.`price`, `invest`.`best`, `invest`.`build_change`, `invest`.`ird`, `invest`.`akt`, `invest`.`desc_gen`, `invest`.`desc_sol`, `invest`.`conditions`,
                    `invest`.`file`,
                    photo.THUMB as `THUMB`, photo.`MID`
                    FROM `invest`
                    LEFT JOIN `photo` ON (`invest`.`investID` = photo.R_ID AND photo.R_TYPE = 6)
                                GROUP BY  `invest`.`investID`
                                  "
        );

        if($order){
            $newPack[$order] = $bestPack[$order];
            unset($bestPack[$order]);
            $bestPack = array_merge($newPack,$bestPack);

        }

        foreach ($bestPack as $type => $sql) {
            $res = nga_config::db()->query($sql);
            //echo $sql;
            if (!$res) {
                echo $type;echo $sql;echo "\n <br />";
                die(nga_config::db()->error);
                continue;
            }
            while ($row = $res->fetch_assoc()) {
                $bestResult[$type][$row['tid']] = $row;
            }
        }

        $this->tplData['bestResult'] = $bestResult;
        $this->tplData['new_flat'] = false;
        $this->layoutData['title'] = 'Лучшие предложения недвижимости';
        $this->layoutData['h1'] = 'Лучшие предложения недвижимости';
        //print_r($this->tplData);
    }
}