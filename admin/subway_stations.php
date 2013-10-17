<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/subway_stations.php');

$subway_stations->order = array();
$subway_stations->addOrderBy('ID','desc');

$nga = new nga();
$nga->setTable($subway_stations);
$nga->Show();
?>