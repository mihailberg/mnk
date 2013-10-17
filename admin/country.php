<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/country.php');


$country_table->order = array();
$country_table->addOrderBy('countryID','desc');

$nga = new nga();
$nga->setTable($country_table);
$nga->Show();
?>