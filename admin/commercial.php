<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/commercial.php');
$commercial->order = array();
$commercial->addOrderBy('commercialID','desc');
$nga = new nga();
$nga->setTable($commercial);
$nga->Show();
?>