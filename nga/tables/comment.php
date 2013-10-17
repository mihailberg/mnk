<?php
$comm = new nga_table('comment','Отзывы');
$commB = $comm->addBlock('Направление');
$ID = $comm->addID('ID','commentID','num');
$commB[0] = $comm->add('Автор','title','string');


$commB[1] = $comm->add('Участок','landID','num');

//require_once(nga_config::i()->pathServer['nga'].'/tables/land.php');
//$commB[1]->constructFromTable($land);

$commB[2] = $comm->add('Отзыв','comment','textarea');
$commB[3] = $comm->add('Одобрен','approved','checkbox');
$comm->setListShow($commB[0],$commB[1],$commB[2],$commB[3]);
?>