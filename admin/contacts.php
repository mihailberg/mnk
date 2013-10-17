<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../nga/lib/nga.php');
include_once ('../nga/tables/contacts.php');
$tableContacts->order = array();
$tableContacts->addOrderBy('contactsID','desc');

$nga = new nga ();
$nga->setTable ( $tableContacts );
$nga->Show ();
?>