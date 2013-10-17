<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of land
 *
 * @author ng
 */
class land
{
    
    private $units = array(0,
        1,          //Курс рубля
        30,         //Курс доллара
        40          //Курс евро
        );
    
    public function getDollar($price){
        return round($price/$this->units[2]);
    }
    public function getEuro($price){
        return round($price/$this->units[3]);
    }

    function getSpecOffer()
    {
        $sql = 'SELECT * FROM `land` WHERE `special_offer` = 1';
        $res = nga_config::i()->db()->query($sql);
        $data = array();
        if ($res !== false) {

            while ($row = $res->fetch_object()) {
                $data[$row->landID] = $row;
            }
            //echo '<div style="background:#fff;">';
        }
        return $data;
    }

    /**
     *
     * @return Array
     */
    function getMainSearchFormValue()
    {
        $searchFormValues['location_mkad_remoteness']['from'] = '';
        $searchFormValues['location_mkad_remoteness']['to'] = '';
        $searchFormValues['btype'] = 0;
        $searchFormValues['highway'] = 1;
        $searchFormValues['lid'] = '';
        $searchFormValues['owner_price']['from'] = '';
        $searchFormValues['owner_price']['to'] = '';
        $searchFormValues['owner_price']['unit'] = '';

        if (!empty($_GET['location_mkad_remoteness']['from'])) {
            $searchFormValues['location_mkad_remoteness']['from'] = (int) $_GET['location_mkad_remoteness']['from'];
        }
        if (!empty($_GET['location_mkad_remoteness']['to'])) {
            $searchFormValues['location_mkad_remoteness']['to'] = (int) $_GET['location_mkad_remoteness']['to'];
        }

        if (!empty($_GET['btype'])) {
            $searchFormValues['btype'] = (int) $_GET['btype'];
        }

        if (!empty($_GET['highway'])) {
            $searchFormValues['highway'] = (int) $_GET['highway'];
        }
        if (!empty($_GET['lid'])) {
            $searchFormValues['lid'] = (int) $_GET['lid'];
        }
        if (!empty($_GET['owner_price']['from'])) {
            $searchFormValues['owner_price']['from'] = (int) $_GET['owner_price']['from'];
        }
        if (!empty($_GET['owner_price']['to'])) {
            $searchFormValues['owner_price']['to'] = (int) $_GET['owner_price']['to'];
        }
        if (!empty($_GET['owner_price']['unit'])) {
            $searchFormValues['owner_price']['unit'] = (int) $_GET['owner_price']['unit'];
        }
//if(isset($_GET))

        return $searchFormValues;
    }

    function mainSearchForm()
    {
        $sql = 'SELECT SQL_CALC_FOUND_ROWS * FROM `land`';
        $glue = " WHERE";

        if (!empty($_GET['location_mkad_remoteness']['to']) || !empty($_GET['location_mkad_remoteness']['from'])) {
            $from = (int) $_GET['location_mkad_remoteness']['from'];
            $to = (int) $_GET['location_mkad_remoteness']['to'];
            if ($from != 0) {
                $sql.=$glue . " `land`.`location_mkad_remoteness` >= " . $from;
                $glue = " AND";
            }
            if ($to != 0) {
                $sql.=$glue . " `land`.`location_mkad_remoteness` <= " . $to;
                $glue = " AND";
            }
        }

        if (!empty($_GET['btype'])) {
            
            if($_GET['btype'] == '3'){
                $sql.=$glue . " `land`.`location_view` in(3,4)";
            } else{
                $sql.=$glue . " `land`.`location_view` = " . (int) $_GET['btype'];
            }
            $glue = " AND";
        }

        if (!empty($_GET['highway'])&&$_GET['highway']!=1) {
            $sql.=$glue . " `land`.`location_direction` = " . (int) $_GET['highway'];
            $glue = " AND";
        }



        if (!empty($_GET['owner_price']['to']) || !empty($_GET['owner_price']['from'])) {
            $from = (int) $_GET['owner_price']['from'];
            $to = (int) $_GET['owner_price']['to'];

            $from = $from * $this->units[(int) $_GET['owner_price']['unit']];
            $to = $to * $this->units[(int) $_GET['owner_price']['unit']];

            if ($from != 0) {
                $sql.=$glue . " `land`.`owner_price` >= " . $from;
                $glue = " AND";
            }
            if ($to != 0) {
                $sql.=$glue . " `land`.`owner_price` <= " . $to;
                $glue = " AND";
            }
        }
                          //    0       1                   2                           3               4                   5
        $orderList = array('landID','location_direction','location_mkad_remoteness','region_centerID','location_square','owner_price');
        $order = 0;
        
        if(!empty($_GET['order'])&&isset($orderList[(int)$order])){
            $order = (int)$_GET['order'];
        }
        
        $sql.=" ORDER BY `".$orderList[$order]."` DESC";


        $per_page = 30;
        $page = 1;
        

        if(!empty($_GET['page'])){
            $page = (int)$_GET['page'];
        }
        $offset = ($page-1)*$per_page;
        $sql.= " LIMIT ".$offset.", ".$per_page;
        
        //ID
        if (!empty($_GET['lid'])) {
            $sql='SELECT SQL_CALC_FOUND_ROWS * FROM `land` WHERE `land`.`landID` = ' . (int) $_GET['lid'];
        }
        
        $res = nga_config::i()->db()->query($sql);
        
        $count = end(nga_config::i()->db()->query("SELECT FOUND_ROWS()")->fetch_assoc());
        //echo $sql;
        //print_r($count);
        
        $data = array();
        if ($res !== false) {
            while ($row = $res->fetch_object()) {
                $data[$row->landID] = $row;
            }
        }
        //echo count($data);
        return array($data,$count,$per_page,$page,$order);
    }

}

?>