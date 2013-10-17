<?php
$application = new nga_table('application','Заявки');
$a = $application->addBlock('');
$ID = $application->addID('ID','applicationID','num');
$a[0] = $application->add('Дата','date','datetime');
$a[1] = $application->add('Содержание','content','textarea');
$a[2] = $application->add('Имя','name','string');
$a[3] = $application->add('Телефон','phone','string');
$a[4] = $application->add('E-mail', 'email', 'string');

$application->setListShow($a[0],$a[2],$a[2],$a[4]);
//$application->setFormNoShow($ID);
$application->addOrderBy('date', 'DESC');
?>