<?php
/****************************************
Example of how to use this uploader class...
You can uncomment the following lines (minus the require) to use these as your defaults.

// list of valid extensions, ex. array("jpeg", "xml", "bmp")
$allowedExtensions = array();
// max file size in bytes
$sizeLimit = 10 * 1024 * 1024;
//the input name set in the javascript
$inputName = 'qqfile'

require('valums-file-uploader/server/php.php');
$uploader = new qqFileUploader($allowedExtensions, $sizeLimit, $inputName);

// Call handleUpload() with the name of the folder, relative to PHP's getcwd()
$result = $uploader->handleUpload('uploads/');

// to pass data through iframe you will need to encode all html tags
header("Content-Type: text/plain");
echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);

/******************************************/

set_include_path($_SERVER['DOCUMENT_ROOT']);
require_once('nga/lib/nga.php');

// list of valid extensions, ex.
$allowedExtensions = array("jpeg", "jpg", "gif", "png");
// max file size in bytes
$sizeLimit = 8 * 1024 * 1024;
//the input name set in the javascript
$inputName = 'qqfile';


//session_start();
//print_r($_POST);
//print_r($_SERVER);
//print_r($_SESSION);
//die();

//Light Security
/*
$fail = false;
if(empty($_SERVER['CONTENT_LENGTH'])) $fail = true;

header("Content-Type: text/plain; charset=utf-8");
echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);

if($fail) die(json_encode())
*/
require('uploadServer.php');
require('imageThumb.php');

$uploader = new qqFileUploader($allowedExtensions, $sizeLimit, $inputName);

// Call handleUpload() with the name of the folder, relative to PHP's getcwd()
$result = $uploader->handleUpload($_SERVER['DOCUMENT_ROOT'] . MY_UPLOAD_DIR);


//Картинка залилась
if (isset($result['success']) && $result['success'] == true) {


    //Real file name from uploaddir path
    $filename = $uploader->getUploadName();

    $fullFilename = MY_UPLOAD_DIR . $filename;

    //$image->writeimage(MY_UPLOAD_DIR.'thumb/'.$filename);


    //trueThumb
    $thumbName = MY_THUMB_UPLOAD_DIR . $filename;
    $midName =  MY_MID_UPLOAD_DIR . $filename;
    $originalFileName = $_SERVER['DOCUMENT_ROOT'] . $fullFilename;

    $preview = array(
        array('width'=>160,'height'=>180, 'originalFileName'=>$originalFileName, "targetFileName"=>$_SERVER['DOCUMENT_ROOT'] .$thumbName),
        array('width'=>360,'height'=>400, 'originalFileName'=>$originalFileName,"targetFileName"=> $_SERVER['DOCUMENT_ROOT'] .$midName),
    );

    foreach($preview as $t){
        trueThumb($t['originalFileName'], $t['targetFileName'],$t['width'],$t['height']);
    }

    $res = nga_config::db()->query("insert into `photo` ( `R_TYPE`,`R_ID`, `SRC`, `THUMB`,`MID`) values (
    " . (int)$_POST['R_TYPE'] . ",
    " . (int)$_POST['R_ID'] . ",
    '/_files/gallery/" . $filename . "',
    '/_files/gallery/thumb/" . $filename . "',
    '/_files/gallery/mid/" . $filename ."'
    )"
    );
    //'".nga_config::db()->real_escape_string($_POST['title])."',

}


// to pass data through iframe you will need to encode all html tags
//header("Content-Type: text/plain");
header("Content-Type: text/plain; charset=utf-8");
echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);
