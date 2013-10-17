<?php
class field_hidden extends fieldGeneral implements fieldI
{

    public function getForm()
    {
        $html = '                <input type="hidden" class="field form string" style="width:100%" name="' . $this->sqlField . '" value="' . $this->value . '" maxlength="255" />	';
        return $html;
    }

    public function getListEdit()
    {
        $html = '<input type="hidden" class="field list string edit" name="' . $this->sqlField . '" style="width:100%;margin:5px 5px 6px 0;" value="' . $this->value . '">' . "\n";
        return $html;
    }

}

?>