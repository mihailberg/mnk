<?php
$tableSettings = new nga_table('settings','Курсы валют');
$b = $tableSettings->addBlock('');
$ID = $tableSettings->addID('ID','settingsID','num');
$b[0] = $tableSettings->add('Валюта','name','string');
$b[1] = $tableSettings->add('Значение','value','string');
$tableSettings->setListShow($b[0],$b[1]);
$tableSettings->setFormNoShow($ID);
?>