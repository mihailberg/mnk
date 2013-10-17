<?php
$subway_stations = new nga_table('subway_stations','Метро');
$b = $subway_stations->addBlock('');
$ID = $subway_stations->addID('ID','id','num');
$b[0] = $subway_stations->add('Название','name','string');
$b[1] = $subway_stations->add('Элитное','elite','checkbox');
$subway_stations->setListShow($b[0],$b[1]);
$subway_stations->setFormNoShow($ID);
$subway_stations->addOrderBy('name','ASC');
?>