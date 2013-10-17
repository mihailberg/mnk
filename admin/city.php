<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/city.php');
$city->order = array();
$city->addOrderBy('cityID','desc');

$nga = new nga();
$nga->setTable($city);
$nga->Show();
?>