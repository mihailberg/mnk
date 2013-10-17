<?php
header('Content-type: text/html; charset=utf-8');
require_once('../nga/lib/nga.php');
include_once('../nga/tables/newflat_gk.php');



$newflat_gk->order = array();
$newflat_gk->addOrderBy('newflat_gkID','desc');



$nga = new nga();
//print_r(nga_config::i());
$nga->setTable($newflat_gk);
$nga->Show();
?>