<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/settings.php');

$tableSettings->order = array();
$tableSettings->addOrderBy('settingsID','desc');

$nga = new nga ();
$nga->setTable ( $tableSettings );
$nga->Show ();
?>