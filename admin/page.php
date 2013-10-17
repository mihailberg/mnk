<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/page.php');

$page_table->order = array();
$page_table->addOrderBy('pageID','desc');

$nga = new nga();
$nga->setTable($page_table);
$nga->Show();
?>