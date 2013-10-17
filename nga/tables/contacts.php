<?php
$tableContacts = new nga_table('contacts','Контакты');
$b = $tableContacts->addBlock('');
$ID = $tableContacts->addID('ID','contactsID','num');
$b[0] = $tableContacts->add('Поле','name','string');
$b[1] = $tableContacts->add('Значение','value','string');
$tableContacts->setListShow($b[0],$b[1]);
$tableContacts->setFormNoShow($ID);
?>
