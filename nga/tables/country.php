<?php
$country_table = new nga_table('country','Страны');
$country_block = $country_table->addBlock('Общее');
$countryID = $country_table->addID('ID','countryID','num');
$country_block[0] = $country_table->add('Название','title','string');

$country_table->setListShow($country_block[0]);
$country_table->setFormNoShow($countryID);
?>