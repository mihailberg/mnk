<?php
$plan = new nga_table('plan', 'Планировки');
$ID = $plan->addID('ID', 'planID', 'num');


//ПРИМЕЧАНИЕ
$plan_block = $plan->addBlock('Общее');

//ЖК
$plan_block[0] = $plan->add('ЖК', 'newflat_gkID', 'static');
$plan_block[0]->FormShow = false;

if(!empty($_GET['gid'])){
    $plan_block[0]->setValue((int)$_GET['gid']);
    $plan->addWhere('newflat_gkID',(int)$_GET['gid']);
}



$plan_block[1] = $plan->add('Корпус', 'korpus', 'string');
$plan_block[2] = $plan->add('Секция', 'section', 'string');
$plan_block[3] = $plan->add('Картинка корпуса', 'image_korpus', 'image');
$plan_block[4] = $plan->add('Картинка секции', 'image_section', 'image');
$plan->addOrderBy('planID', 'DESC');


$plan->setListShow($plan_block[0], $plan_block[1], $plan_block[2],$plan_block[3],$plan_block[4]);
?>