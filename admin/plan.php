<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/plan.php');

$plan->order = array();
$plan->addOrderBy('planID','desc');


$nga = new nga();
$nga->setTable($plan);
$nga->Show();
?>