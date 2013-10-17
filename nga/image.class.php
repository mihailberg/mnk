<?php
class Image
{

/* resizeToFile resizes a picture and writes it to the harddisk
 * 
 * $sourcefile	= the filename of the picture that is going to be resized
 * $resize_q	= ����������� �����������.
 * $targetfile = The name under which the resized picture will be stored
 * $jpegqual  = The Compression-Rate that is to be used
 */
 function resizeToFile ($sourcefile, $resize_width, $targetfile, $jpegqual, $resize_height=0)
 {
	$picsize = getimagesize($sourcefile);
	$source_x  = $picsize[0];
	$source_y  = $picsize[1];

	
	
	//$source_x / $width
	
	$dest_x = $resize_width;
	if($resize_height==0) $dest_y = round($source_y * ($resize_width / $source_x));
	else $dest_y=$resize_height;
	//
	//echo $dest_x."---".$dest_y;
	//die();

	if($picsize[2] == IMAGETYPE_JPEG) {	//JPG
		$source_id = imageCreateFromJPEG($sourcefile);
		$target_id = imageCreateTrueColor($dest_x, $dest_y);
		$target_pic = imageCopyResampled($target_id, $source_id, 0,0,0,0, $dest_x, $dest_y, $source_x, $source_y);
		ImageJpeg ($target_id, $targetfile, $jpegqual);
	}elseif($picsize[2] == IMAGETYPE_GIF) {	//GIF
		$source_id = ImageCreateFromGif($sourcefile);
		$target_id = imageCreateTrueColor($dest_x, $dest_y);
		$target_pic = imageCopyResampled($target_id, $source_id, 0,0,0,0, $dest_x, $dest_y, $source_x, $source_y);
		ImageGif($target_id, $targetfile);
	}
	if(isset($target_id)) {
		ImageDestroy($source_id);
		ImageDestroy($target_id);
		return true;
	}
	return false;
 }
}
?>