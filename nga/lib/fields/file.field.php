<?php
class field_file extends fieldGeneral implements fieldI{
	
	public function getForm(){
		$html = '';
		if($_GET['action']=='edit'){
			if(!empty($this->value)) {
				$html.='';
				$html.='<tr><td colspan="2">
				    <a href = "'.$this->value.'">'.$this->value.'</a>
                    <label>
                    <input style="float:left;" type="checkbox" name="'.$this->sqlField.'_delete_" value="1" />&nbsp;удалить</label>
                    </td></tr>';
				$html.='<tr><td>Загрузить новый файл: </td>';
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
            $html='<tr><td colspan="2">'.$this->name.'<br /><a href = "'.$this->value.'">'.$this->value.'</a><br /></td></tr>';
			return $html;
		}
	}
    public function getPdf(){
        if(!empty($this->value)){
            $html='<tr><td colspan="2">'.$this->name.'<br /><a href = "'.$this->value.'">'.$this->value.'</a><br /></td></tr>';
            return $html;
        }        
    }
	
	public function getListEdit(){
		if(!empty($this->value)){
			$html='<a href = "'.$this->value.'">'.$this->value.'</a>';
		} else {
			$html = '&nbsp;-&nbsp;';
		}
		return $html;
	}
	public function getList(){
        $html = '';
		if(!empty($this->value)){
            $type = mime_content_type($_SERVER['DOCUMENT_ROOT'].$this->value);
            if(mb_strpos($type,'/')!== false){
                $type = substr($type,mb_strpos($type,'/'));
            }
            if(file_exists($_SERVER['DOCUMENT_ROOT'].'/img/crystal/'.$type)){
                $html.='<img src="/img/crystal/'.$type.'" width="30" />';
            }

			$html.='<a href = "'.$this->value.'">'.$this->value.'</a>';
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
		$delfile = false;
		$thumbImgIndex = false;
		$img=false;
		
		if(!empty($_FILES[$this->sqlField.'_new_']['tmp_name'])&&!$_FILES[$this->sqlField.'_new_']['error']){	//Есть новая картинка
				$img=$_FILES[$this->sqlField.'_new_'];
		}
		if(!empty($_POST[$this->sqlField])){ //Картинка есть
			if(isset($_POST[$this->sqlField.'_delete_'])||$img){	//Галочка удалить поставлена или есть новая картинка
				$delfile=$_POST[$this->sqlField];
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
			$a = array_keys($this->DataType,'filethumb');
			if(!empty($a)){
			$thumbImgIndex=$a[0];
		*/
		//Удаляем если надо
		if($delfile){
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
    	}
    }

}
?>