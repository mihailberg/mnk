<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/foreign.php');

$foreign_table->order = array();
$foreign_table->addOrderBy('foreignID','desc');

$nga = new nga();
$nga->setTable($foreign_table);
$nga->Show();
?>