<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/land.php');

$land_table->order = array();
$land_table->addOrderBy('landID','desc');

$nga = new nga();
$nga->setTable($land_table);
$nga->Show();
?>