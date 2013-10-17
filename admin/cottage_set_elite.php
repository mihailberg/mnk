<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/cottage_set_elite.php');


$cottage_set->order = array();
$cottage_set->addOrderBy('cottage_setID','desc');

$nga = new nga();
$nga->setTable($cottage_set);
$nga->Show();
?>