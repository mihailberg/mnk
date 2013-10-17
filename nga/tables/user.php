<?php
$UserTable = new nga_table('user','Пользователи');
$u = $UserTable->addBlock('');
$ID = $UserTable->addID('ID','userID','num');
$u[0] = $UserTable->add('Имя','name','string');
$u[1] = $UserTable->add('Логин','login','string');
$u[2] = $UserTable->add('Пароль','password','password');
$u[3] = $UserTable->add('E-mail','email','string');
$u[4] = $UserTable->add('ФИО','fio','string');
$u[5] = $UserTable->add('Телефон','phone','string');
$u[6] = $UserTable->add('Админ','isadmin','checkbox');
$UserTable->setListShow($u[0],$u[1],$u[3]);
$UserTable->setFormNoShow($ID);
?>