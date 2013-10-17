<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/flat.php');


$flat->order = array();
$flat->addOrderBy('flatID','desc');

$nga = new nga();
$nga->setTable($flat);
$nga->Show();
?>