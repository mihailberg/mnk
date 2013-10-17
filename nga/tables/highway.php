<?php
$highway = new nga_table('highway','Направление');
$b = $highway->addBlock('Направление');
$ID = $highway->addID('ID','highwayID','num');
$b[0] = $highway->add('Название','title','string');
$b[1] = $highway->add('Элитное','elite','checkbox');
$highway->setListShow($b[0],$b[1]);
$highway->setFormNoShow($ID);


?>