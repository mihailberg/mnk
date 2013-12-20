<?php
class field_image_preview extends fieldGeneral implements fieldI
{

    public $src = '';

    public function getForm()
    {
        $html = '';
        if ($_GET['action'] == 'edit') {
            if (!empty($this->value)) {
                $html .= '';
                $html .= '<tr><td colspan="2"><img src="' . $this->value . '" style="margin: 2px;" alt="image" /><br /><label><input type="checkbox" name="' . $this->sqlField . '_delete_" value="1" />удалить</label></td></tr>';
                $html .= '<tr><td>Загрузить новую картинку: </td>';
            } else {
                $html .= '<tr><td>' . $this->name . ':</td>';
            }
            $html .= '<td><input type="hidden" name="' . $this->sqlField . '" value="' . $this->value . '" /><input type="file" class="field form file_new" name="' . $this->sqlField . '_new_" /></td></tr>';
        } else {
            $html .= '<tr><td>' . $this->name . ':</td><td><input type="file" class="field form file" name="' . $this->sqlField . '_new_" /></td></tr>';
        }
        return $html;
    }

    public function getView()
    {
        if (!empty($this->value)) {
            $html = '<tr><td colspan="2">' . $this->name . '<br /><img src="' . $this->value . '" style="margin: 2px;" alt="' . $this->name . '" /><br /></td></tr>';
            return $html;
        }
    }

    public function getPdf()
    {
        if (!empty($this->value)) {
            $html = '<tr><td colspan="2">' . $this->name . '<br /><img src="' . $_SERVER['DOCUMENT_ROOT'] . $this->value . '" style="margin: 2px;" alt="' . $this->name . '" /><br /></td></tr>';
            return $html;
        }
    }

    public function getListEdit()
    {
        if (!empty($this->value)) {
            $html = '<img src="' . $this->value . '" style="margin: 2px;" width="100" alt="image" />';
        } else {
            $html = '&nbsp;-&nbsp;';
        }
        return $html;
    }

    public function getList()
    {
        if (!empty($this->value)) {
            $html = '<img src="' . $this->value . '" style="margin: 2px;" width="100" alt="image" />';
        } else {
            $html = '&nbsp;-&nbsp;';
        }
        return $html;
    }

    public function getValue()
    {
        return $this->value;
    }

    public function Delete()
    {
        if (!empty($this->value)) {
            unlink(nga_config::i()->pathServer['htdocs'] . $this->value);
        }
    }

    public function Save($type)
    {
        $delImage = false;
        $thumbImgIndex = false;
        $img = false;

        if (!empty($_FILES[$this->sqlField . '_new_']['tmp_name']) && !$_FILES[$this->sqlField . '_new_']['error']) { //Есть новая картинка
            $img = $_FILES[$this->sqlField . '_new_'];
        }
        if (!empty($_POST[$this->sqlField])) { //Картинка есть
            if (isset($_POST[$this->sqlField . '_delete_']) || $img) { //Галочка удалить поставлена или есть новая картинка
                $delImage = $_POST[$this->sqlField];
            } else {
                return;
            }
        } else { //старой картинки нет
            if (!$img) {
                //и новой не предвидиться
                return;
            }
        }

        //Удаляем если надо
        if ($delImage) {

            //Original
            @unlink($_SERVER['DOCUMENT_ROOT'] . $_POST[$this->sqlField]);
            //Thumb
            @unlink($_SERVER['DOCUMENT_ROOT'] . str_replace(MY_UPLOAD_DIR, MY_THUMB_UPLOAD_DIR, $_POST[$this->sqlField]));
            //Middle
            @unlink($_SERVER['DOCUMENT_ROOT'] . str_replace(MY_UPLOAD_DIR, MY_MID_UPLOAD_DIR, $_POST[$this->sqlField]));
            $this->value = '';
        }

        if ($img) {
            $newfname = '';
            $newfname .= time();
            mt_srand((float)microtime() * 1000000); //если вдруг 2 админа копировали картинки и имена ахахааха прекрати
            $rndnum1 = mt_rand(0, 9); //совпали... снизим эту вероятность
            $rndnum2 = mt_rand(0, 9);
            $newfname .= $rndnum1 . $rndnum2;
            $newfname = str_replace(" ", "_", $newfname);
            $newfname = strtolower($newfname);

            $ext = strrchr($img['name'], '.');
            $value = $newfname . $ext;


            $filename = MY_UPLOAD_DIR . $value;

            //try to load
            if (!move_uploaded_file($img['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . $filename)) {
                 echo "<span class=\"msg\">Невозможно принять файл</span><br>";
                 exit();
             }

            //Все ок, файл уже у нас

            //FileNames
            $this->multifield = true;
            $this->multifieldData = array(
                'SRC' => MY_UPLOAD_DIR . $value,
                'MID' => MY_MID_UPLOAD_DIR . $value,
                'THUMB' => MY_THUMB_UPLOAD_DIR . $value
            );

            require_once('services/imageThumb.php');


            $preview = array(
                array('width'=>160,'height'=>180, 'originalFileName'=>$_SERVER['DOCUMENT_ROOT'].$this->multifieldData['SRC'],  "targetFileName"=> $_SERVER['DOCUMENT_ROOT'].$this->multifieldData['THUMB']),
                array('width'=>360,'height'=>400, 'originalFileName'=>$_SERVER['DOCUMENT_ROOT'].$this->multifieldData['SRC'],  "targetFileName"=> $_SERVER['DOCUMENT_ROOT'].$this->multifieldData['MID']),
            );

            foreach($preview as $t){
                trueThumb($t['originalFileName'], $t['targetFileName'],$t['width'],$t['height']);
            }
        }
    }
}

?>