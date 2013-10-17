<?php
header('Content-type: text/html; charset=utf-8');
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/photo.php');


$table_photo->order = array();
$table_photo->addOrderBy('photoID','desc');


$nga = new nga();
$nga->addSafeVar('R_TYPE');
$nga->actionAdd = false;
$nga->setTable($table_photo);
$nga->Show();
?>