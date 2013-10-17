<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/news.php');

$news_table->order = array();
$news_table->addOrderBy('newsID','desc');

$nga = new nga();
$nga->setTable($news_table);
$nga->Show();
?>