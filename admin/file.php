<?php
header('Content-type: text/html; charset=utf-8');
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/file.php');


$table_file->order = array();
$table_file->addOrderBy('fileID','desc');

$nga = new nga();
$nga->addSafeVar('R_TYPE');
$nga->actionAdd = false;
$nga->setTable($table_file);
$nga->Show();
?>