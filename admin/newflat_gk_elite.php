<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include ('../nga/tables/newflat_gk_elite.php');


$newflat_gk->order = array();
$newflat_gk->addOrderBy('newflat_gkID','desc');

$nga = new nga();
$nga->setTable($newflat_gk);
$nga->Show();


?>