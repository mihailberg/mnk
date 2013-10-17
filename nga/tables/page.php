<?php
$page_table = new nga_table('page','Страницы');
$page_block = $page_table->addBlock('');
$ID = $page_table->addID('ID','pageID','num');
$page_block[0] = $page_table->add('Название','title','string');

$parent_pages = clone $page_table;
//$parent_pages->addOrderBy('parentID','DESC');
//$parent_pages->addOrderBy('title','ASC');

$page_block[1] = $page_table->add('Раздел','parentID','select');
$page_block[1]->addValues('_Корень');
$page_block[1]->constructFromTable($parent_pages);

$page_block[2] = $page_table->add('Путь','url','string');
$page_block[3] = $page_table->add('H1','h1','string');
$page_block[4] = $page_table->add('Содержание','content','editor');

$page_block[5] = $page_table->add('Ключевые слова', 'metakeywords', 'string');
$page_block[6] = $page_table->add('Описание', 'metadescription', 'string');

$page_table->setListShow($page_block[0],$page_block[1],$page_block[2],$page_block[3]);
$page_table->setFormNoShow($ID);

?>