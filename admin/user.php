<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/user.php');

$UserTable->order = array();
$UserTable->addOrderBy('userID','desc');

$nga = new nga();
$nga->setTable($UserTable);
$nga->Show();
?>