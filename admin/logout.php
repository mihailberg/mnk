<?php
require_once('../nga/lib/nga.php');

$nga = new nga();
$nga->User->logout();
header('Location: /admin/');
?>
