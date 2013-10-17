<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/application.php');

$application->order = array();
$application->addOrderBy('applicationID','desc');

$nga = new nga ();
$nga->setTable ( $application );
$nga->Show ();
?>