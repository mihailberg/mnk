<?php
include_once(nga_config::i()->pathServer['nga'].'/tables/highway.php');
$region_center = new nga_table('region_center','Районный центр');
$b = $region_center->addBlock('Районный центр');
$ID = $region_center->addID('ID','region_centerID','num');
$b[0] = $region_center->add('Название','title','string');

$b[1] = $region_center->add('Шоссе','highwayID','select');

$b[1]->constructFromTable($highway);

$region_center->setListShow($b[0],$b[1]);
$region_center->setFormNoShow($ID);
?>