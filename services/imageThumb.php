<?php
define('MAX_ORIGINAL_FILE_SIZE', 10000000);
define('MAX_ORIGINAL_FILE_WIDTH', 5600);
define('MAX_ORIGINAL_FILE_HEIGHT', 5600);


// The quality of the target filename.
define('TARGET_QUALITY', 90);
/**
 * Новая инструкция)

$preview = array(
    array('width'=>160,'height'=>180, 'originalFileName'=>$originalFileName,"targetFileName"=>$targetFileName),
    array('width'=>360,'height'=>400, 'originalFileName'=>$originalFileName,"targetFileName"=>$targetFileName),
);

foreach($preview as $t){
    trueThumb($t['originalFileName'], $t['targetFileName'],$t['width'],$t['height'])
}
*/
function trueThumb($originalFileName, $targetFileName,$width,$height)
{


    //$originalFileName = 'source.jpg';
    //$targetFileName = 'source_thumbnail.jpg';

    // We begin by defining a few constants which
    // impose some limits.


    // Make sure it's a regular file, and that it's readable:
    if (!(is_file($originalFileName) &&
        is_readable($originalFileName))
    )
        exit(sprintf('Not a readable file: %s',
            $originalFileName) . PHP_EOL);

    // Check for maximum file size
    if (filesize($originalFileName) > MAX_ORIGINAL_FILE_SIZE)
        exit(sprintf('File too large: %s',
            $originalFileName) . PHP_EOL);

    // Extract the file extension
    // Find out the file type depending on the extension:

    $fileExtension = null;

    $info = pathinfo($originalFileName);
    if (isset($info['extension']))
        $fileExtension = $info['extension'];

    if (empty($fileExtension))
        exit(sprintf('Could not determine file extension: %s',
            $originalFileName) . PHP_EOL);

    // Compute the type depending on the extension
    $type = strtolower($fileExtension);
    if ($type == 'jpg') $type = 'jpeg';

    // $func is the gd2 function we will use
    $func = 'imagecreatefrom' . $type;

    // Check if the function exists
    if (!function_exists($func))
        exit(sprintf('Unsuported image type: %s', $type) .
            PHP_EOL);

    // Create a new gd2 resource
    $gd2Original = $func($originalFileName);

    if (empty($gd2Original))
        exit(sprintf('Invalid %s format in %s', $type,
            $originalFileName) . PHP_EOL);

    // Check the width and height
    $originalWidth = imagesx($gd2Original);
    $originalHeight = imagesy($gd2Original);

    if ($originalWidth > MAX_ORIGINAL_FILE_WIDTH ||
        $originalHeight > MAX_ORIGINAL_FILE_HEIGHT
    )
        exit(sprintf('Image dimensions too large: %s width, ' .
                'and %s height. Maximum supported are: ' .
                '%s width, and %s height', $originalWidth,
            $originalHeight, MAX_ORIGINAL_FILE_WIDTH,
            MAX_ORIGINAL_FILE_HEIGHT) . PHP_EOL);

    // Determine the scale ratio, a number between 0 and 1.
    // This is a value by which we will multiply the
    // original width and height to obtain the thumbnail
    // dimensions.

    $scale = null;

    // We define here the width and height we want the
    // thumbnail to have. It's possible to define either
    // the target width, the target height, or both of them.
    // In each case, the thumbnail will conform to the given
    // constraints.

    $boundWidth = $width;
    $boundHeight = $height;

    if (empty($boundWidth) && empty($boundHeight))
        exit('Neither one of the target width or target ' .
            'height values were specified.');

    else if (empty($boundWidth))
        $scale = $boundHeight / $originalHeight;
    else if (empty($boundHeight))
        $scale = $boundWidth / $originalWidth;
    else
        $scale = min($boundWidth / $originalWidth,
            $boundHeight / $originalHeight);

    if ($scale < 1) {
        $targetWidth = floor($scale * $originalWidth);
        $targetHeight = floor($scale * $originalHeight);

        $gd2Thumbnail = imagecreatetruecolor($targetWidth,
            $targetHeight);

        // Copy and resample into the thumbnail.
        imagecopyresampled($gd2Thumbnail, $gd2Original,
            0, 0, 0, 0,
            $targetWidth, $targetHeight,
            $originalWidth, $originalHeight);
    } else {
        // No need to do anything - the image is already
        // within the defined thumbnail size constraints!
        $gd2Thumbnail = $gd2Original;
    }

    // Finally, write the thumbnail to a file.
    $func = 'image' . $type;
    if (function_exists($func)) {
        if ($type == 'png') {
            imagepng($gd2Thumbnail, $targetFileName, TARGET_QUALITY / 10);
        } else {
            $func($gd2Thumbnail, $targetFileName, TARGET_QUALITY);
        }
    }
}