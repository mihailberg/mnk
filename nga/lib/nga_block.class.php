<?php
class nga_block implements Iterator, ArrayAccess
{
    private $cursor = 0;
    private $count = 0;
    private $data = array(); //Массив с полями

    /**
     * Set true for width 100% in edit interface
     * @var bool
     */
    public $wide = false;
    /**
     * css class for fieldset
     * @var
     */
    public $class;


    public $search = false;
    public $name;

    public function __construct($name, $settings = array())
    {
        $this->name = $name;
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
        if ($this->cursor > $this->count) $this->cursor = 0;
    }

    public function key()
    {
        return $this->position;
    }

    public function valid()
    {
        return isset($this->data[$this->cursor]);
    }

    public function offsetSet($offset, $value)
    {
        $this->data[$offset] = $value;
        $this->count = count($this->data);
    }

    public function offsetExists($offset)
    {
        return isset($this->data[$offset]);
    }

    public function offsetUnset($offset)
    {
        unset($this->data[$offset]);
    }

    public function offsetGet($offset)
    {
        return isset($this->data[$offset]) ? $this->data[$offset] : null;
    }

}

?>