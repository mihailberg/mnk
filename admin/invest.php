<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/invest.php');

$invest_table->order = array();
$invest_table->addOrderBy('investID','desc');

$nga = new nga();
$nga->setTable($invest_table);
$nga->Show();
?>