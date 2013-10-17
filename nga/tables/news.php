<?php
$news_table = new nga_table('news','Новости');
$news_block = $news_table->addBlock('');
$ID = $news_table->addID('ID','newsID','num');
$news_block[0] = $news_table->add('Название','title','string');
$news_block[1] = $news_table->add('Дата', 'date', 'datetime');
$news_block[2] = $news_table->add('Содержание', 'content', 'editor');

$news_table->setFormNoShow($ID);
$news_table->setListShow($news_block[0],$news_block[1]);
$news_table->addOrderBy('date','DESC');
?>