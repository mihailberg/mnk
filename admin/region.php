<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/region.php');

$region->order = array();
$region->addOrderBy('regionID','desc');

$nga = new nga ();
$nga->setTable ( $region );
$nga->Show ();
?>