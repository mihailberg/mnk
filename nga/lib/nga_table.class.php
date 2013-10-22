<?php

class nga_table implements Iterator
{

    /**
     * SQL имя таблицы
     * @var String
     */
    public $name;

    /**
     * @var
     */
    public $title;

    /**
     * Название столбца с именем записи
     * @var String
     */
    protected $tableNames = 'title';
    protected $current = false;
    public $id; //id поля таблицы
    public $idValue; //значение
    private $fields = array();
    private $cursor = 0;
    private $count = 0;
    private $data = array(); //Массив с полями
    public $dataValue = false;
    public $order = false; //Массив field,type
    public $where = false; //
    private $between = false; //
    private $in;
    public $perPage = 20;
    private $page = 1;
    public $foundRows = 0;


    /**
     * Нужна ли вставка до сохранения(для подтаблиц/картинок и тп)
     * @var bool
     */
    public $preInsert = false;

    public function emptyInsert()
    {
        $staticFields = array();
        //$sql = "INSERT INTO `" . $this->name . "` (`" . $this->id . "`";
        foreach ($this as $f) {
            if ($f instanceof field_static) {
                $staticFields[$f->sqlField] = $f->value;
            }
        }
        if (count($staticFields)) {
            $sql = "INSERT INTO `" . $this->name . "` (`" . $this->id . "`,`" . implode("`, `", array_keys($staticFields)) . "`) VALUES ('','" . implode("', '", $staticFields) . "')";
        } else {
            $sql = "INSERT INTO `" . $this->name . "` (`" . $this->id . "`) VALUES ('')";
        }

        $res = nga_config::db()->query($sql);
        if (!$res) {
            return false;
            //header('Location: http://'.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'].'?'
        }
        return nga_config::db()->insert_id;
    }

    /*
     *
     * OLD
     *
     */
    public $OverrideQuerySelect = false;

    public function __construct($table, $tTitle)
    {
        $this->name = $table;
        $this->title = $tTitle;
        $this->id = $this->name . "ID";
        $this->page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
        //if(!$this->tableKey)$this->tableKey = $this->tableId;
    }

    //public function clearW

    public function ResetObject()
    {
        $this->between = false;
        $this->order = false;
        $this->where = false;
        $this->perPage = 20;
        $this->foundRows = 0;
        $this->in = null;
        $this->count = 0;
        $this->cursor = 0;
        $this->OverrideQuerySelect = false;
        $this->dataValue = false;
    }

    public function addBetween($field, $from, $to)
    {
        if ($from !== '' && $to !== '') {
            $this->between[] = array(
                'field' => $field,
                'from' => $from,
                'to' => $to
            );
        }
    }

    public function addIn($field, $values)
    {
        $this->in[] = array(
            'field' => $field,
            'values' => $values
        );
    }

    protected $sqlWhere = array();

    public function addSqlWhere($sql)
    {
        $this->sqlWhere[] = $sql;
    }

    public function addWhere($field, $value, $symbol = '=')
    {
        $this->where[] = array(
            'field' => $field,
            'value' => $value,
            'symbol' => $symbol
        );
    }

    public function getData()
    {
        $this->makeSqlQuery();

        $res = nga_config::i()->db()->query($this->query);
        if ($res !== false) {

            while ($row = $res->fetch_assoc()) {
                $this->dataValue[$row['tid']] = $row;
            }

            $result = nga_config::db()->query("SELECT FOUND_ROWS()");
            if ($r = $result->fetch_row()) {
                $this->foundRows = $r[0];
            } else {
                $this->foundRows = 1;
            }

            //echo '<div style="background:#fff;">';
            //var_dump($this->query);echo '<br />';
        } else {
            echo '<div style="background:#fff;">';
            var_dump($this->query);
            echo '<br />';
            print_r(nga_config::i()->db()->error);
            var_dump($res);
        }
        return $this->dataValue;
    }

    private function SaveUpdate($inputArray)
    {
        $sql = 'UPDATE `' . $this->name . '` SET';
        foreach ($this as $field) {
            if ($field->sqlField == $this->id) {
                continue;
            }
            if (!IsSet($inputArray[$field->sqlField])&&!$field->multifield) {
                continue;
            }
            $field->getValueFromArray($inputArray);
            $field->Save('update');

            //Перебираем все поля для базы данного виджета
            if ($field->multifield) {
                foreach($field->multifieldData as $mfsql=>$mfvalue){
                    $sql .= '`'.$mfsql.'` = "' . $mfvalue . '", ';
                }
            } else {
                $sql .= '`' . $field->sqlField . '` = "' . $field->getValue() . '", ';
            }
        }
        $sql = mb_substr($sql, 0, -2);
        $sql .= ' WHERE `' . $this->id . '` = ' . (int)$this->idValue;
        //echo $sql;        die();
        nga_config::i()->db()->query($sql);
//        echo nga_config::i()->db()->error;
        //      die();
    }

    public function SaveInsert($inputArray)
    {
        $sql = 'INSERT INTO `' . $this->name . '` ';
        $sqlF = '';
        $sqlV = '';
        foreach ($this as $field) {
            if ($field->sqlField == $this->id) {
                continue;
            }
            $field->getValueFromArray($inputArray);
            $field->Save('insert');
            $sqlF .= '`' . $field->sqlField . '`, ';
            $sqlV .= '"' . $field->getValue() . '", ';
        }
        $sqlF = mb_substr($sqlF, 0, -2);
        $sqlV = mb_substr($sqlV, 0, -2);
        $sql .= '(' . $sqlF . ') VALUES (' . $sqlV . ');';
//    	echo $sql;
        nga_config::i()->db()->query($sql);
    }

    public function SaveList()
    {
        foreach ($_POST['id'] as $id => $v) {
            $this->idValue = $id;
            $this->SaveUpdate($v);
        }
    }

    public function DeleteRow()
    {
        $this->getData();
        foreach ($this as $field) {
            if ($field->sqlField == $this->id) {
                continue;
            }
            if ($field instanceof field_nodb) {
                continue;
                //@todo
                //Cascade delete items

            }
            $field->setValue($this->dataValue[$this->idValue][$field->sqlField]);
            $field->Delete();
        }
        $sql = 'DELETE FROM `' . $this->name . '` WHERE `' . $this->id . '` = ' . (int)$this->idValue;
        nga_config::i()->db()->query($sql);
    }

    public function Save()
    {
        if (isset($_POST['ID'])) {
            //Update
            $this->idValue = (int)$_POST['ID'];
            $this->SaveUpdate($_POST);
        } else {
            //Insert
            $this->SaveInsert($_POST);
        }
    }

    public function setIdValue($value)
    {
        $this->idValue = (int)$value;
        $this->addWhere($this->id, $value);
    }

    public function addOrderBy($field, $type)
    {
        $this->order[] = array(
            'field' => $field,
            'type' => $type
        );
    }

    public function showSql(){
        $this->makeSqlQuery();
        echo $this->query;
    }
    public function makeSqlQuery()
    {
        if (!$this->OverrideQuerySelect) {
            $query = "SELECT SQL_CALC_FOUND_ROWS `" . $this->name . "`." . "`" . $this->id . "` AS `tid`";
            foreach ($this->data as $k => $v) {
                if ($k == 0) continue;
                if ($v instanceof field_nodb) continue;



        //print_r($v);
//                    if ($this->DataType[$this->DataToShow[$k]] == "date" || $this->DataType[$this->DataToShow[$k]] == "datetime")
//                    $query .= ", UNIX_TIMESTAMP(`".$this->DataSQLf[$this->DataToShow[$k]]."`) as time$k";
//                    else
                if ($v->multifield) {
                    foreach($v->multifieldData as $mfsql=>$mfvalue){
                        $query .= ", `" . $this->name . "`.`" . $mfsql . "`";
                    }
                } else {
                    $query .= ", `" . $this->name . "`.`" . $v->sqlField . "`";
                }
            }
            $query .= " FROM `$this->name`";

            $glue = '';

            if ($this->where) {
                $glue = " WHERE";
                foreach ($this->where as $v) {
                    $query .= $glue . " `" . $v['field'] . "` " . $v['symbol'] . " " . $v['value'];
                    $glue = " AND";
                }
            }

            if ($this->sqlWhere) {
                if ($glue == '')
                    $glue = " WHERE";
                foreach ($this->sqlWhere as $v) {
                    $query .= $glue . " " . $v . " ";
                    $glue = " AND";
                }
            }

            if ($this->between) {
                if ($glue == '')
                    $glue = " WHERE";
                foreach ($this->between as $v) {
                    $query .= $glue . " `" . $v['field'] . "` BETWEEN " . $v['from'] . " AND " . $v['to'] . "";
                    $glue = " AND";
                }
            }

            if (!empty($this->in)) {
                if ($glue == '')
                    $glue = " WHERE";
                foreach ($this->in as $v) {
                    $query .= $glue . " `" . $v['field'] . "` IN (" . $v['values'] . ")";
                    $glue = " AND";
                }
            }


            if ($this->order) {
                $query .= " ORDER BY ";
                foreach ($this->order as $v) {
                    if ($v['type'] == 'random') {
                        $query .= "RAND()  ";
                        break;
                    }
                    $query .= "`" . $this->name . "`.`" . $v['field'] . "` " . $v['type'] . ", ";
                }
                $query = substr($query, 0, -2);
            }

            if ($this->perPage < 1000) {
                $query .= " LIMIT " . ($this->page - 1) * $this->perPage . ", " . $this->perPage;
            }
        } else {
            $query = str_replace('SELECT ', 'SELECT SQL_CALC_FOUND_ROWS ', $this->OverrideQuerySelect);
        }
        $this->query = $query;
        return $query;
    }


    public $pdfShow = array();

    public function setPdfShow()
    {
        $arr = func_get_args();
        foreach ($arr as $f) {
            $f->pdfShow = true;
        }
    }

    public $listShowSort = array();
    public function setListShow()
    {
        $ListShow = func_get_args();

        foreach ($ListShow as $v) {
            $v->listShow();
            $this->listShowSort[] = $v;
        }
    }

    public $blocks = array();

    /**
     * @param $name
     * @return nga_block
     */
    public function addBlock($name)
    {
        $this->blocks[] = new nga_block($name);
        return $this->blocks[count($this->blocks) - 1];
    }

    public function replaceBlockByObj($block,$newName){
        $s = array_search($block,$this->blocks);
        if($s){
            $this->blocks[$s] = new nga_block($newName);
            return $this->blocks[$s];
        }
        return false;
    }

    public $search = array();

    public function setSearchForm()
    {
        $arr = func_get_args();
        foreach ($arr as $f) {
            $f->search = true;
        }
    }

    public function setFormNoShow()
    { return;
        $FormNoShow = func_get_args();
        foreach ($this->data as $k => $v) {
            if (in_array($k, $FormNoShow)) {
                $v->FormShow = false;
            }
        }
    }
    
    public function getID(){
        return $this->data[0];
    }

    public function addID($name, $sqlField, $type)
    {
        $this->id = $sqlField;
        $this->count++;
        $this->data[$this->count - 1] = field::get($type);
        $this->data[$this->count - 1]->name = $name;
        $this->data[$this->count - 1]->sqlField = $sqlField;
        $this->data[$this->count - 1]->type = $type;
        return $this->data[$this->count - 1];
    }

    public function add($name, $sqlField, $type, $options = array())
    {
        $this->data[$this->count] = field::get($type);
        $this->data[$this->count]->name = $name;
        $this->data[$this->count]->sqlField = $sqlField;
        $this->data[$this->count]->type = $type;
        $this->count++;


        if(!empty($options)){
            $this->data[$this->count-1]->setOptions($options);
        }
        if(isset($options['required'])&&$options['required'] == true){

        }


        return $this->data[$this->count - 1];
    }

    public function rewind()
    {
        $this->cursor = 0;
    }

    public function current()
    {
        return $this->data[$this->cursor];
    }

    public function next()
    {
        $this->cursor++;
        if ($this->cursor > $this->count)
            $this->cursor = 0;
    }

    public function key()
    {
        return $this->position;
    }

    public function valid()
    {
        return isset($this->data[$this->cursor]);
    }

}

?>