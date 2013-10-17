<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ng
 * Date: 11/30/12
 * Time: 1:42 AM
 * To change this template use File | Settings | File Templates.
 */

class invest extends ngaController

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
        require_once('nga/tables/highway.php');
        require_once('nga/tables/invest.php');
        $this->layout = 'layout_search';
        $this->tpl = 'investSearch';
        $this->tplData['highway'] = $highway->getData();
        $this->tplData['invest'] = $invest_table_block[1]->getValues();
        $this->tplData['new_invest'] = false;
        $res = $this->search();
        if (!$res) {
            return false;
        }
        $result = array();
        while ($row = $res->fetch_assoc()) {
            $result[] = $row;
        }
        $this->layoutData['mapResult'] = $result;
        $this->layoutData['title'] = 'Проекты для инвестирования > Поиск';
        $this->layoutData['h1'] = 'Поиск проектов для инвестирования';
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
        $this->tplData['rowCount'] = $this->getFoundRows();
        include ('nga/tables/highway.php');
        $this->tplData['highway'] = $highway->getData();

        include ('nga/tables/region.php');
        $this->tplData['region'] = $region->getData();

        include('nga/tables/invest.php');
        $this->tplData['investType'] = $invest_table_block[0]->getValues();
        $this->tplData['investType'][0] = '';

        $this->tplData['searchResult'] = $result;
        $this->layoutData['title'] = 'Проекты для инвестирования > поиск';
        $this->layoutData['h1'] = 'Проекты для инвестирования';

        include ('nga/tables/subway_stations.php');
        $subway_stations->perPage = 1000;
        $this->tplData['metro'] = $subway_stations->getData();

        include ('nga/tables/flat.php');
        $this->tplData['house_types'] = $comment[21]->getValues();
        $this->tplData['house_types'][0] = '';
    }

    public function search()
    {
        $sql = "SELECT SQL_CALC_FOUND_ROWS `invest`.`investID` AS `tid`, `invest`.*, `photo`.*
                    FROM `invest`
                    LEFT JOIN `photo` ON (`invest`.`investID` = photo.R_ID AND photo.R_TYPE = 6)
                    ";
        $glue = ' WHERE ';


        //Тип дома  тип дома (панель, кирпич, кирпич-монолит, сталинский, иное, все).
        if (!empty($_GET['type']) && is_array($_GET['type']) &&
            !isset($_GET['typeall']) //Это если галочка "все типы дома" тогда условия не добавляем
        ) {
            $type = array();
            foreach ($_GET['type'] as $r) {

                if ((int)$r < 8 && (int)$r > 0) {
                    $type[] = (int)$r;
                }
            }
            if(count($type)){
                $sql .= $glue . '`type` IN (' . implode(",", $type) . ')';
                $glue = ' AND ';
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
            $glue = ' AND ';
        }

        //MKAD
        if (!empty($_GET['mkad']) && is_array($_GET['mkad'])) {

            //от
            if ((int)$_GET['mkad']['from'] > 0) {
                $sql .= $glue . '`mkad_remoteness` >= ' . (int)$_GET['mkad']['from'];
            }
            //до
            if ((int)$_GET['mkad']['to'] != 0) {
                $sql .= $glue . '`mkad_remoteness` <= ' . (int)$_GET['mkad']['to'];
            }
            $glue = ' AND ';
        }


        if (!empty($_GET['direction']) && is_array($_GET['direction'])) {
            $district = array();
            foreach ($_GET['district'] as $r) {
                if ((int)$r < 9 && (int)$r >= 1) {
                    $district[] = (int)$r;
                }
            }
            if (count($district)) {
                $sql .= $glue . '`district` IN (' . implode(",", $district) . ')';
            }
            $glue = ' AND ';
        }
        if (!empty($_GET['highway']) && is_array($_GET['highway'])) {
            $district = array();
            foreach ($_GET['highway'] as $r) {
                if ((int)$_GET['highway'] > 0) {
                    $district[] = (int)$r;
                }
            }
            if (count($district)) {
                $sql .= $glue . '`highwayID` IN (' . implode(",", $district) . ')';
            }
            $glue = ' AND ';
        }

        $sql .= "
                            GROUP BY  `invest`.`investID`
                            ORDER BY `invest`.`investID` DESC
        ";
        $sql .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;


//        echo $sql;

        return nga_config::db()->query($sql);
    }

    public function actionAll()
    {
        $this->layout = 'layout_white';

        include ('nga/tables/highway.php');
        $this->tplData['highway'] = $highway->getData();

        include ('nga/tables/region.php');
        $this->tplData['region'] = $region->getData();

        require_once('nga/tables/invest.php');
        $this->tplData['investType'] = $invest_table_block[0]->getValues();
        $this->tplData['investType'][0] = '';


        $invest_table->OverrideQuerySelect = "
          SELECT `invest`.`investID` AS `tid`,invest.*,

        photo.THUMB, photo.MID
        FROM `invest`
        LEFT JOIN `photo` ON (`invest`.`investID` = photo.R_ID AND photo.R_TYPE = 6)
                    GROUP BY  `invest`.`investID`";
        $invest_table->OverrideQuerySelect .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;

        $this->tplData['searchResult'] = $invest_table->getData();
        $this->tplData['rowCount'] = $invest_table->foundRows;
        $this->layoutData['title'] = 'Проекты для инвестирования > все предложения';
        $this->layoutData['h1'] = 'Проекты для инвестирования';
    }

    public function actionInvest($url)
    {
        if (!isset($url[0])) return false;
        $id = (int)$url[0];
        if ($id == 0) return false;
        $this->layout = 'layout_one';
        $this->tpl = 'invest_one';
        //include('nga/tables/region.php');
        include('nga/tables/invest.php');

        $regionData = $region->getData();
        $highwayData = $highway->getData();
        //print_r($regionData);
        $invest_table->addWhere('investID', $id);
        $data = $invest_table->getData();

        //Wrong id
        if (!is_array($data))
            return false;

        $this->layoutData['photos'] = $this->getPhoto(6, $id);

        $this->tplData['build_change_files'] = $this->getFiles(1, $id);
        $this->tplData['ird_files'] = $this->getFiles(2, $id);
        $this->tplData['akt_files'] = $this->getFiles(3, $id);

        $this->layoutData['similarObjects'] = $this->getSimilarObjects('invest', $id, $data[$id]['price'], 6, '', 'price');

        $this->tplData['invest'] = $data[$id];
        if(isset($regionData[$data[$id]['regionID']]['title']))    $this->tplData['invest']['regionID'] = $regionData[$data[$id]['regionID']]['title'];
        if(isset($highwayData[$data[$id]['highwayID']]['title']))    $this->tplData['invest']['highwayID'] = $highwayData[$data[$id]['highwayID']]['title'];
        if(isset($regionData[$data[$id]['regionID']]['title']))       $this->tplData['coords'] = array('title' => $regionData[$data[$id]['regionID']]['title'] . " район", 'latitude' => $this->tplData['invest']['latitude'], 'longitude' => $this->tplData['invest']['longitude']);
        $this->tplData['id'] = $id;

        $region = $invest_table_block[3]->getValues();
        $this->layoutData['h1'] = (!empty($region[$data[$id]['regionID']]))?$region[$data[$id]['regionID']] . " район ":"";
        $this->layoutData['id'] = $id;
        $this->layoutData['h1'].=$data[$id]['title'];
        $this->layoutData['title'] = $this->layoutData['h1'];

        $this->layoutData['description'] = "
            <span class='desc_header'>Описание участка по ген.плану:</span>
            <div>".nl2br($data[$id]['desc_gen'])."</div>
            <span class='desc_header'>Описание градостроительных решений:</span>
            <div>".nl2br($data[$id]['desc_sol'])."</div>";


    }
}