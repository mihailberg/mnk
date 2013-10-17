<?php
class field_custom_map extends fieldGeneral implements fieldI
{
    //Y Value
    //public $Y = '';

    public $multifield = true;
    public function __construct(){

        $this->multifieldData = array(
            'X' => '',
            'Y' => '',
        );
    }

    public function getValueFromArray($inputArray){
        //die(__METHOD__);
        foreach($this->multifieldData as $k=>$v){
            if(isset($inputArray[$k])){
                $this->multifieldData[$k] = stripslashes(nga_config::i()->db()->real_escape_string($inputArray[$k]));
            }
        }

   	}

    public function getForm()
    {
        $html = <<<EOT
            <script>
                markers = {};
                $('document').ready(function () {

                });

                $('#eliteMap').live('click', function (e) {
                    var _top = parseInt(e.offsetY);
                    var _left = parseInt(e.offsetX);
                    $('#myXY').remove();
                    $('#eliteMap').append('<div id="myXY" style="top:' + (_top) + 'px;left: ' + (_left) + 'px;" class="marker"></div>');

                    $('input[name=X]').val(_left);
                    $('input[name=Y]').val(_top);
                    return false;
                });

                 $(document).ready(function() {
                    if({$this->multifieldData['X']}>0 && {$this->multifieldData['Y']}>0){
                        $('#eliteMap').append('<div id="myXY" style="top:' + (parseInt({$this->multifieldData['Y']})) + 'px;left: ' + (parseInt({$this->multifieldData['X']})) + 'px;" class="marker"></div>');
                    }
                 });
            </script>
            <style>
                #eliteMap {
                    background: url('/img/elitemap.jpeg') no-repeat top left;
                    position: relative;
                    width: 1158px;
                    height: 843px;
                }

                .marker {
                    position: absolute;
                    width: 21px;
                    height: 29px;
                    margin-top:-27px;
                    margin-left:-11px;
                    /* background: #ed882e; */
                    background: url(/img/arrowOrangeVertical.png) bottom center no-repeat;
                }

            </style>
            <input id="xI" type="hidden" name = "X" value = "{$this->multifieldData['X']}" />
            <input id="yI" type="hidden" name = "Y" value = "{$this->multifieldData['Y']}" />

            <div id="eliteMap">

            </div>
EOT;
        return $html;
    }

    public function getView()
    {
        if (!empty($this->value)) {
            $html = '<tr><td colspan="2">' . $this->name . '<br /><img src="' . $this->value . '" style="margin: 2px;" alt="' . $this->name . '" /><br /></td></tr>';
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
        /*
            if(isset($_POST['Y'])&&isset($_POST['X'])){
                $this->value = $_POST['X'];
                $this->Y = $_POST['Y'];
            }*/

    }
}

?>