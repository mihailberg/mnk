<?php

if(!function_exists('mime_content_type')) {

    function mime_content_type($filename) {

        $mime_types = array(

            'txt' => 'text/plain',
            'htm' => 'text/html',
            'html' => 'text/html',
            'php' => 'text/html',
            'css' => 'text/css',
            'js' => 'application/javascript',
            'json' => 'application/json',
            'xml' => 'application/xml',
            'swf' => 'application/x-shockwave-flash',
            'flv' => 'video/x-flv',

            // images
            'png' => 'image/png',
            'jpe' => 'image/jpeg',
            'jpeg' => 'image/jpeg',
            'jpg' => 'image/jpeg',
            'gif' => 'image/gif',
            'bmp' => 'image/bmp',
            'ico' => 'image/vnd.microsoft.icon',
            'tiff' => 'image/tiff',
            'tif' => 'image/tiff',
            'svg' => 'image/svg+xml',
            'svgz' => 'image/svg+xml',

            // archives
            'zip' => 'application/zip',
            'rar' => 'application/x-rar-compressed',
            'exe' => 'application/x-msdownload',
            'msi' => 'application/x-msdownload',
            'cab' => 'application/vnd.ms-cab-compressed',

            // audio/video
            'mp3' => 'audio/mpeg',
            'qt' => 'video/quicktime',
            'mov' => 'video/quicktime',

            // adobe
            'pdf' => 'application/pdf',
            'psd' => 'image/vnd.adobe.photoshop',
            'ai' => 'application/postscript',
            'eps' => 'application/postscript',
            'ps' => 'application/postscript',

            // ms office
            'doc' => 'application/msword',
            'rtf' => 'application/rtf',
            'xls' => 'application/vnd.ms-excel',
            'ppt' => 'application/vnd.ms-powerpoint',

            // open office
            'odt' => 'application/vnd.oasis.opendocument.text',
            'ods' => 'application/vnd.oasis.opendocument.spreadsheet',
        );

        $ext = strtolower(array_pop(explode('.',$filename)));
        if (array_key_exists($ext, $mime_types)) {
            return $mime_types[$ext];
        }
        elseif (function_exists('finfo_open')) {
            $finfo = finfo_open(FILEINFO_MIME);
            $mimetype = finfo_file($finfo, $filename);
            finfo_close($finfo);
            return $mimetype;
        }
        else {
            return 'application/octet-stream';
        }
    }
}

require_once("field.class.php");
require_once("nga_config.class.php");
require_once("nga_table.class.php");
require_once("nga_block.class.php");
require_once("lib.class.php");

require_once 'user.class.php';

/**
 *
 * @author Maisuradze NG Andrey
 */
class nga
{

    /**
     * if !empty - stop loading
     * @var string
     */
    public $userError = '';

    public $title;
    /**
     *
     * @var nga_table
     */
    public $table;
    public $page = 1;

    /**
     * Output string
     */
    private $html = '';
    /**
     * показ кнопки
     * @var bool
     */
    public $actionAdd = true;

    /**
     *
     * @var array $path
     */
    private $path = array();
    private $template = "/index.tpl.php";
    public $User;

    public function __construct()
    {
        $this->User = User::i();
    }

    public function setTable($table)
    {
        $this->table = $table;
        $this->path[$table->name . ".php"] = $table->title;
        $this->path['current'] = $table->title;
        $this->title = $table->title;
    }

    private $action;

    public $safeGetVars = array();

    protected function safeGetUrl()
    {
        if (!count($this->safeGetVars)) return '';
        $return = '';
        foreach ($this->safeGetVars as $var => $value) {
            $return .= "&" . $var . "=" . $value;
        }
        return $return;
        //return "&".implode('&',$this->safeGetVars);
    }

    public function addSafeVar($key)
    {
        $this->safeGetVars[$key] = $_GET[$key];
    }

    public function checkAction()
    {
        if (!$this->User->isAuth())
            return "not_auth";

        if (!$this->User->isAdmin() && $this->table->name == 'user')
            return "deny";

        $action = isset($_GET['action']) ? $_GET['action'] : false;

        if (isset($_GET['gid'])) {
            $this->safeGetVars['gid'] = (int)$_GET['gid'];
        }
        $safeGetUrl = $this->safeGetUrl();

        switch ($action) {
            case 'add':
                $this->action = 'getForm';
                $this->path['current'] = 'Добавление записи';
//                $this->table->setIdValue((int)$_GET['id']);

                //Сначала вставляем запись потом редирект на редактирование
                if ($this->table->preInsert) {
                    $newid = $this->table->emptyInsert();
                    if (!$newid) {
                        $this->userError = 'Ошибка добавления записи';
                        return 'userError';
                    }

                    header('Location: ' . $_SERVER['SCRIPT_NAME'] . '?action=edit&id=' . $newid . '&page=' . $this->page . $safeGetUrl);
                }

                $this->template = "/edit.tpl.php";
                break;

            case 'edit':
                $this->action = 'getForm';
                $this->path['current'] = 'Редактирование записи';
                $this->table->setIdValue((int)$_GET['id']);
                $this->template = "/edit.tpl.php";
                break;

            case 'delete':
                $this->table->setIdValue((int)$_GET['id']);
//                print_r($this->table);
                $this->table->DeleteRow();
                header('Location: ' . $_SERVER['SCRIPT_NAME'] . '?action=list&from=delete&rnd=' . mt_rand() . '&page=' . $this->page . $safeGetUrl);
                break;

            case 'update':
                $this->table->Save();
                header('Location: ' . $_SERVER['SCRIPT_NAME'] . '?action=list&from=update&rnd=' . mt_rand() . '&page=' . $this->page . $safeGetUrl);
                break;

            case 'insert':
                $this->table->Save();
                header('Location: ' . $_SERVER['SCRIPT_NAME'] . '?action=list&from=insert&rnd=' . mt_rand() . '&page=' . $this->page . $safeGetUrl);
                break;

            case 'savelist':
                $this->table->SaveList();
                header('Location: ' . $_SERVER['SCRIPT_NAME'] . '?action=list&from=SaveList&rnd=' . mt_rand() . '&page=' . $this->page . $safeGetUrl);
                break;

            case 'search':
                $this->action = 'search';
                $this->path['current'] = 'Поиск объекта';
                $this->template = "/search.tpl.php";
                break;

            case 'view':
                $this->action = 'view';
                $this->table->setIdValue((int)$_GET['id']);
                $this->path['current'] = 'Просмотр объекта';
                $this->template = "/view.tpl.php";
                break;

            case 'dump':
                require_once("nga_system.class.php");
                $nga_system = new nga_system();
                $nga_system->SaveDb2File();

//            	print_r(nga_config::i());
//            	print_r($nga_system);
//            	header('Location: '.$_SERVER['SCRIPT_NAME'].'?action=list&from=dump&rnd='.mt_rand().'&page='.$this->page);            	
                break;

            case 'pdf':
                $this->action = 'pdf';
                $this->table->setIdValue((int)$_GET['id']);
                $this->template = "/pdf.tpl.php";
                break;
            case 'list':
            default:
                $this->action = 'getList';
                $this->template = "/list.tpl.php";
                break;
        }
        return true;
    }

    public function Show()
    {
        $auth = $this->checkAction();
        $safeGetUrl = $this->safeGetUrl();
//var_dump($auth);die();
        if ($auth === 'not_auth') {
            $this->template = '/login.form.php';
            $this->title = 'Авторизация';
        } elseif ($auth === 'deny') {
            $this->template = '/deny.tpl.php';
        } elseif ($auth === 'userError') {
            $this->template = '/error.tpl.php';
        }

        $Data = $this;

        if ($this->action === 'pdf') {
            include("MPDF54/mpdf.php");
            include_once 'PHPMailer/class.phpmailer.php';


            $ListData = $this->table->getData();
            $LD = current($ListData);

            $mpdf = new mPDF();
            ob_start();
            include_once nga_config::i()->pathServer['tpl'] . $this->template;
            $content = ob_get_contents();
            ob_end_clean();

            $mpdf->WriteHTML($content);


//                $mpdf->Output('../_service/'.$this->table->name.'/'.$this->table->idValue.'.pdf','I');die();
            $mpdf->Output('../_service/' . $this->table->name . '/' . $this->table->idValue . '.pdf', 'F');


            $mail = new PHPMailer(true); //defaults to using php "mail()"; the true param means it will throw exceptions on errors, which we need to catch

            try {
                $mail->IsSendmail();
                $mail->AddAddress($_GET['email'], '');
                $mail->CharSet = 'utf8';
                $mail->SetFrom('info@' . $_SERVER['HTTP_HOST'], '');
                $mail->Subject = 'Предложение №' . $LD['identifier'];
                $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
                $mail->MsgHTML('<html><head> <meta content="text/html; charset=utf-8" http-equiv="Content-Type"> <title>Предложение  №' . $LD['identifier'] . '</title></head><body>
                      <h1>Предложение  №' . $LD['identifier'] . '</h1>');
                $mail->AddAttachment($_SERVER["DOCUMENT_ROOT"] . '/_service/' . $this->table->name . '/' . $this->table->idValue . '.pdf'); // attachment
                $mail->Send();
                //echo "Message Sent OK</p>\n";
            } catch (phpmailerException $e) {
                echo $e->errorMessage(); //Pretty error messages from PHPMailer
            } catch (Exception $e) {
                echo $e->getMessage(); //Boring error messages from anything else!
            }

            //$mpdf->Output($this->table->name.'_'.$this->table->idValue.'.pdf','D');

            header('Location: ' . $_SERVER['SCRIPT_NAME'] . '?' . $_GET['get'] . '&from=pdf&rnd=' . mt_rand());
            exit();

        } else {
            ob_start();
            include_once nga_config::i()->pathServer['tpl'] . $this->template;
            $content = ob_get_contents();
            ob_end_clean();


            if (!isset($_GET['gid'])) {
                include_once nga_config::i()->pathServer['tpl'] . '/layout.php';
            } else {
                include_once nga_config::i()->pathServer['tpl'] . '/layout_blank.php';
            }

        }
    }

}

class nga_Exception extends Exception
{

    public function __construct($message, $code)
    {
        switch ($code) {
            case 'add':
                $error = 'Ошибка добавления данных: ' . $message;
                break;
            case 'edit':
                $error = 'Ошибка редактирования данных: ' . $message;
                break;
            case 'delete':
                $error = 'Ошибка удаления данных: ' . $message;
                break;
            case 'save':
                $error = 'Ошибка сохранения данных: ' . $message;
                break;
            case 'form':
                $error = 'Ошибка отрисовки формы: ' . $message;
                break;
            case 'list':
                $error = 'Ошибка отрисовки списка данных: ' . $message;
                break;

            default:
                break;
        }
        echo '<div class="ui-widget">
				<div class="ui-state-error ui-corner-all" style="padding: 0pt 0.7em;">
					<p>' . $error . '</p>
				</div>
			</div>';
        return $error;
    }

}

?>