<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/newflat.php');

$newflat->order = array();
$newflat->addOrderBy('newflatID','desc');

$nga = new nga();
$nga->setTable($newflat);
$nga->Show();
?>