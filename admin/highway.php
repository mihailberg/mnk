<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/highway.php');

$highway->order = array();
$highway->addOrderBy('highwayID','desc');

$nga = new nga();
$nga->setTable($highway);
$nga->Show();
?>