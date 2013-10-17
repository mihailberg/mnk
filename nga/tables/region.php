<?php
$region = new nga_table('region','Районы');
$b = $region->addBlock('');
$ID = $region->addID('ID','regionID','num');
$b[0] = $region->add('Название','title','string');
$b[1] = $region->add('В москве','moscow','checkbox');
$region->setListShow($b[0],$b[1]);
$region->setFormNoShow($ID);
?>