<?php
class nga_system{

	public function __construct(){
	
	}
		
	
	public function SaveDb2File(){
		$dbName = nga_config::i()->getDbName();
		$backupFile = $dbName."Db.".'.sql';
//		$backupFile = $dbName."Db.".date('Y-m-d').'.sql';
		define('lnbr',"\r\n");
      	$query = '/* '. lnbr;
		$query.= 'Database: `'.$dbName.'`'. lnbr;
		$query.= 'Date: '.date('Y-m-d H:i'). lnbr;		
		$query.= '*/'. lnbr. lnbr. lnbr;	
 		 		
 		$res = nga_config::db()->query("SHOW TABLES");
 		while ($row = $res->fetch_row()){$table_list[] = $row[0];}
 		
		foreach ($table_list as $t) {
	        $results = nga_config::db()->query('DESCRIBE ' . $t);
 
    	    $query .= 'DROP TABLE IF EXISTS `' . $t . '`;' . lnbr;
        	$query .= lnbr . 'CREATE TABLE `' . $t . '` (' . lnbr;
 
         	$tmp = '';
 			while ($row = $results->fetch_assoc()) {
    	        $query .= '`' . $row['Field'] . '` ' . $row['Type'];
 			
    	        if ($row['Null'] != 'YES') { $query .= ' NOT NULL'; }
        	    if ($row['Default'] != '') { $query .= ' DEFAULT \'' . $row['Default'] . '\''; }
            	if ($row['Extra']) { $query .= ' ' . strtoupper($row['Extra']); }
	            if ($row['Key'] == 'PRI') { $tmp = 'primary key(' . $row['Field'] . ')'; }
 			
    	        $query .= ','. lnbr;
        	}
 
	        $query .= $tmp . lnbr . ');' . str_repeat(lnbr, 2);
     	    $results = nga_config::db()->query('SELECT * FROM ' . $t);
         	while ($row = $results->fetch_assoc()) {
 	           $query .= 'INSERT INTO `' . $t .'` (';
 	           $data = Array();
 		           while (list($key, $value) = @each($row)) { $data['keys'][] = $key; $data['values'][] = addslashes($value); }
 			       $query .= join($data['keys'], ', ') . ')' . lnbr . 'VALUES (\'' . join($data['values'], '\', \'') . '\');' . lnbr;
			}
 
		$query .= str_repeat(lnbr, 2);
 
	}
 
		file_put_contents(nga_config::i()->pathServer['service'].'/'.$backupFile, $query);
		header('Content-Type: text/plain; charset=utf-8');
		header('Content-Disposition: attachment;filename="'.$backupFile.'"');
		header('Cache-Control: max-age=0');
		echo $query;
		exit();
	}
	
/*	
	private function getCSV(){
		$sql = "SELECT * INTO OUTFILE '/tmp/result.csv'
				  FIELDS TERMINATED BY ';'
				  LINES TERMINATED BY '\r\n'
				  FROM `".$t."`;";
		nga_config::db()->query($sql);
		
	}
	
	
	
	private function getServiceFiles(){
		if ($handle = opendir(nga_config::i()->pathServer['service'])) {
		    while (false !== ($file = readdir($handle))) {
    		    if ($file != "." && $file != "..") {
        		    echo "$file\n";
	        	}
	    	}
		    closedir($handle);
		}
	}
	
	private $tables = array();
	private function getTables($needLoad=false){
		if ($handle = opendir(nga_config::i()->pathServer['table'])) {
		    while (false !== ($file = readdir($handle))) {
    		    if ($file == "." && $file == "..") { continue;}

    			$fileName = mb_substr($file,0,-4);
   		    	$fileType = mb_substr($file,-3,3);
   		    	
  		    	if($fileType!='php'){continue;}
  		    	if($needLoad){
	  		    	echo 'Таблица '.$fileName;  		    	
					include (nga_config::i()->pathServer['table'].'/'.$fileName.'.php');
					echo ' загружена.<br />';
	   		    	$this->tables[$fileName] = $$fileName;
	   		    } else {
	   		    	$this->tables[$fileName] = $fileName;
	   		    }
	    	}
		    closedir($handle);
		}
	}
	*/
}
?>