<?php
class field_image extends fieldGeneral implements fieldI{
	
	public function getForm(){
		$html = '';
		if($_GET['action']=='edit'){
			if(!empty($this->value)) {
				$html.='';
				$html.='<tr><td colspan="2">
                    <img width="140" src="'.$this->value.'" style="margin: 2px;" alt="image" /><br /><label><input style="float:left;" type="checkbox" name="'.$this->sqlField.'_delete_" value="1" />&nbsp;удалить</label>
                        
                    </td></tr>';
				$html.='<tr><td>Загрузить новую картинку: </td>';
			} else {
				$html.='<tr><td>'.$this->name.':</td>';
			}
			$html.= '<td><input type="hidden" name="'.$this->sqlField.'" value="'.$this->value.'" /><input type="file" class="field form file_new" name="'.$this->sqlField.'_new_" /></td></tr>';
		} else {
			$html.= '<tr><td>'.$this->name.':</td><td><input type="file" class="field form file" name="'.$this->sqlField.'_new_" /></td></tr>';
		}
		return $html;
	}
	public function getView(){
		if(!empty($this->value)){
            $html='<tr><td colspan="2">'.$this->name.'<br /><img src="'.$this->value.'" style="margin: 2px;" alt="'.$this->name.'" /><br /></td></tr>';
			return $html;
		}
	}
    public function getPdf(){
        if(!empty($this->value)){
            $html='<tr><td colspan="2">'.$this->name.'<br /><img src="'.$_SERVER['DOCUMENT_ROOT'].$this->value.'" style="margin: 2px;" alt="'.$this->name.'" /><br /></td></tr>';
            return $html;
        }        
    }
	
	public function getListEdit(){
		if(!empty($this->value)){
			$html='<img src="'.$this->value.'" style="margin: 2px;" width="100" alt="image" />';	
		} else {
			$html = '&nbsp;-&nbsp;';
		}
		return $html;
	}
	public function getList(){
		if(!empty($this->value)){
			$html='<img src="'.$this->value.'" style="margin: 2px;" width="100" alt="image" />';	
		} else {
			$html = '&nbsp;-&nbsp;';
		}
		return $html;
	}
	
	public function getValue(){
		return $this->value;
	}
	
	public function Delete(){
		if(!empty($this->value)){
			unlink(nga_config::i()->pathServer['htdocs'].$this->value);
		}
	}
	
	public function Save($type){
		$delImage = false;
		$thumbImgIndex = false;
		$img=false;
		
		if(!empty($_FILES[$this->sqlField.'_new_']['tmp_name'])&&!$_FILES[$this->sqlField.'_new_']['error']){	//Есть новая картинка
				$img=$_FILES[$this->sqlField.'_new_'];
		}
		if(!empty($_POST[$this->sqlField])){ //Картинка есть
			if(isset($_POST[$this->sqlField.'_delete_'])||$img){	//Галочка удалить поставлена или есть новая картинка
				$delImage=$_POST[$this->sqlField];
			} else {
				return;
			}
		} else {	//старой картинки нет
			if(!$img){
				//и новой не предвидиться
				return;
			}
		}
        		
		/*
			//Проверяем нужен ли превью.
			$a = array_keys($this->DataType,'imagethumb');
			if(!empty($a)){
			$thumbImgIndex=$a[0];
		*/
		//Удаляем если надо
		if($delImage){
			unlink(nga_config::i()->pathServer['htdocs'].$_POST[$this->sqlField]);
			$this->value = '';
			/*
			if($thumbImgIndex){
				//echo "Preview ".$this->root_path.$_POST[$this->DataFormName[$thumbImgIndex]];
				@unlink($this->root_path.$_POST[$this->DataFormName[$thumbImgIndex]]);
			}
			*/
		}
		//var_dump($img);
		if($img){
			$newfname = '';
			$newfname.= time();
			mt_srand ((float) microtime() * 1000000);	//если вдруг 2 админа копировали картинки и имена
			$rndnum1 = mt_rand(0, 9);	//совпали... снизим эту вероятность
			$rndnum2 = mt_rand(0, 9);
			$newfname.= $rndnum1.$rndnum2;
			$newfname = str_replace(" ", "_", $newfname);
			$newfname = strtolower($newfname);
			
			$ext = strrchr($img['name'], '.');
			$value = $newfname.$ext;
			//print_r(nga_config::i()->pathClient['files']."/".$value);
			$this->value = nga_config::i()->pathClient['files']."/".$value;
			
			if(!move_uploaded_file($img['tmp_name'], nga_config::i()->pathServer['files']."/".$value)){
				echo "<span class=\"msg\">NGA_Save() Невозможно принять файл</span><br>";
				exit();
			}
			/*
			if(!isset($this->ImgThumbWidth[$i])){
				$this->ImgThumbWidth[$i]="130";
			}
			
			if($thumbImgIndex){
			
				$newfname .="_th";
				$imgctrl->resizeToFile(
							$this->root_path.${$this->sqlField},
							$this->ImgThumbWidth[$i],
							$this->root_path.$newfname.$ext,
							$this->ImgThumbQuality,
							$this->ImgThumbHeight[$i]
							);
							${$this->DataFormName[$thumbImgIndex]} = $newfname.$ext;
						}
			*/
		}
    //    die();
	}
	
	
	
	
	
	/* resizeToFile resizes a picture and writes it to the harddisk
 * 
 * $sourcefile	= the filename of the picture that is going to be resized
 * $resize_q	= ����������� �����������.
 * $targetfile = The name under which the resized picture will be stored
 * $jpegqual  = The Compression-Rate that is to be used
 */
	function resizeToFile ($sourcefile, $resize_width, $targetfile, $jpegqual, $resize_height=0){
		$picsize = getimagesize($sourcefile);
		$source_x  = $picsize[0];
		$source_y  = $picsize[1];
		//$source_x / $width
	
		$dest_x = $resize_width;
		if($resize_height==0) $dest_y = round($source_y * ($resize_width / $source_x));
		else $dest_y=$resize_height;
	
		//echo $dest_x."---".$dest_y;
		//die();
		if($picsize[2] == 2) {	//���� ��� JPG
			$source_id = imageCreateFromJPEG($sourcefile);
			$target_id = imageCreateTrueColor($dest_x, $dest_y);
			$target_pic = imageCopyResampled($target_id, $source_id, 0,0,0,0, $dest_x, $dest_y, $source_x, $source_y);
			ImageJpeg ($target_id, $targetfile, $jpegqual);
		}elseif($picsize[2] == 1) {	//���� ��� GIF
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