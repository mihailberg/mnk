<?php

define('MY_UPLOAD_FILE_DIR', '/_files/files/');
define('MY_UPLOAD_DIR', '/_files/gallery/');
define('MY_MID_UPLOAD_DIR', '/_files/gallery/mid/');
define('MY_THUMB_UPLOAD_DIR', '/_files/gallery/thumb/');

class nga_config{

    static $o;
    private function __construct(){

    	//$this->developMode();
        $this->makePath();
        //magic_quotes_runtime(0);
        
        set_include_path($_SERVER['DOCUMENT_ROOT']);
        
//        $this->dbConnect();
    }
    private function __clone(){
    	die("Clone config");
    }

    static function i(){
        if(!self::$o){self::$o = new nga_config();}
        return self::$o;
    }

    /**
     * @return mysqli
     */
    static function db(){
	    if(!self::$o){self::$o = new nga_config();}
	    if(!self::$o->db) {
    		self::$o->dbConnect();
	    }
    	return self::$o->db;
    
    }
    public function pathServer(){return $this->pathServer;}
    public function pathClient(){return $this->pathClient;}

    private $db = false;
    public $pathServer = array();
    public $pathClient = array();


	public function getDbName(){
		return $this->cfg_db['base'];
	}

    public $cfg = array(
        'template' => 'default',
        'charset'     => 'utf8',
        'charset-meta'      => 'utf-8',
        'language'  => 'ru',
        'language-meta'  => 'ru_RU',
    );
    
     private $cfg_path = array(
        //For links
        'protocol'  =>  'http://',
        //Domain
        'domain'   => 'elitka.local',
        //Document_root
        'base'      => false,
        
        
        //nga folder name
        'nga'       => '/nga',
        //Path where is nga
        'path'   => '',
        //Templates folder
        'tpl' => '/templates',
        'img' => '/images',
        'css' => '/css',
        'js' => '/js',
        'lib' => '/lib',
        'table' => '/tables',
        
        
        
        
        //Folders for managable files
        'files'     => '/_files',
        //Backups e t.c.
        'service'     => '/_service',

    );

    private $cfg_db = array(
      'host'=> 'localhost',
      'base'=> 'mnk-estate',
      'user'=> 'root',
      'pass'=> '',
      'port'=> 3306,
    );
    
    private function makePath(){
        if(empty($this->cfg_path['path'])|| $this->cfg_path['path'] == '/') $this->cfg_path['path'] = '';

        if(!$this->cfg_path['base']){
            $this->cfg_path['base'] = rtrim($_SERVER['DOCUMENT_ROOT'], '/');
        }
        //Path
        $tmp['htdocs'] = '';
        $tmp['_'] = $this->cfg_path['path'];
        $tmp['nga'] = $this->cfg_path['path'].$this->cfg_path['nga'];
        $tmp['lib'] = $this->cfg_path['path'].$this->cfg_path['nga'].$this->cfg_path['lib'];
        $tmp['table'] = $this->cfg_path['path'].$this->cfg_path['nga'].$this->cfg_path['table'];
        $tmp['tpl'] = $tmp['nga'].$this->cfg_path['tpl']."/".$this->cfg['template'];
        $tmp['img'] = $tmp['tpl'].$this->cfg_path['img'];
        $tmp['css'] = $tmp['tpl'].$this->cfg_path['css'];
        $tmp['js'] = $tmp['tpl'].$this->cfg_path['js'];
        $tmp['files'] = $this->cfg_path['path'].$this->cfg_path['files'];
        $tmp['service'] = $this->cfg_path['path'].$this->cfg_path['service'];

        function sp(&$item, $key, $prefix){$item = $prefix.$item;}
        $this->pathServer = $this->pathClient = $tmp;

        $cl = $this->cfg_path['protocol'] . $this->cfg_path['domain'];

        array_walk($this->pathServer, 'sp',$this->cfg_path['base']);
        //array_walk($this->pathClient, 'sp',$cl);
    }

    private function dbConnect(){
        if($_SERVER['HTTP_HOST'] == 'mnk-estate.ru'||$_SERVER['HTTP_HOST'] == 'www.mnk-estate.ru'){
            $this->cfg_db = array(
              'host'=> 'advseo.mysql',
              'base'=> 'advseo_estate',
              'user'=> 'advseo_andrey',
              'pass'=> 'dq1tloi5',
              'port'=> 3306,
            );
        }

        if($_SERVER['HTTP_HOST'] == 'mnk.local'||$_SERVER['HTTP_HOST'] == 'www.mnk.local'){
            $this->cfg_db = array(
              'host'=> 'localhost',
              'base'=> 'advseo_estate',
              'user'=> 'root',
              'pass'=> 'root',
              'port'=> 3306,
            );
        }

        $this->db = new mysqliLayer($this->cfg_db['host'],$this->cfg_db['user'],$this->cfg_db['pass'],$this->cfg_db['base'],$this->cfg_db['port']);
        
        $this->db->query("SET NAMES ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET CHARACTER SET ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET character_set_client = ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET character_set_database = ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET character_set_server = ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET character_set_results = ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET character_set_connection = ".$this->cfg['charset']) or die("check mysql version!");
        $this->db->query("SET character_set_results=".$this->cfg['charset']) or die("check mysql version!");
        
    }

	private function developMode(){
		ini_set('display_errors', true);
		ini_set('html_errors', true);
		ini_set('error_reporting', E_ALL);
		error_reporting(E_ALL);
	}
}

class mysqliLayer extends mysqli{

	function query($sql){
//		echo $sql."<br />\n\n\n<br />";
//        if(mb_strpos($sql,'UPDATE')!==false){
//            print_r($_POST);
//            die();
//        }
//		debug_print_backtrace();
		return parent::query($sql);
	}

}
?>