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


require('uploadServer.php');
//require('imageThumb.php');

$uploader = new qqFileUploader();

// Call handleUpload() with the name of the folder, relative to PHP's getcwd()
$result = $uploader->handleUpload($_SERVER['DOCUMENT_ROOT'] . MY_UPLOAD_FILE_DIR);


//Картинка залилась
if (isset($result['success']) && $result['success'] == true) {


    //Real file name from uploaddir path
    $filename = $uploader->getUploadName();

    $fullFilename = MY_UPLOAD_FILE_DIR . $filename;

    //trueThumb
    $originalFileName = $_SERVER['DOCUMENT_ROOT'] . $fullFilename;


    $res = nga_config::db()->query("insert into `file` ( `R_TYPE`,`R_ID`, `SRC`) values (
    " . (int)$_POST['R_TYPE'] . ",
    " . (int)$_POST['R_ID'] . ",
    '/_files/files/" . $filename . "'
    )"
    );
    //'".nga_config::db()->real_escape_string($_POST['title])."',

}


// to pass data through iframe you will need to encode all html tags
//header("Content-Type: text/plain");
header("Content-Type: text/plain; charset=utf-8");
echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);
