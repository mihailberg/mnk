<?php
require_once('./lib/nga.php');

if(!file_exists('./tables/'.$_GET['table'].'.php')) die("Die");
$t=$_GET['table'];
require_once('./tables/'.$t.'.php');

foreach($_GET['field'] as $k=>$v){
	$$t->addWhere($k,$v);
}

$select = field::get('select');

$select->constructFromTable($$t);
echo $select->getOptions();