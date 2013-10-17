<?php
/**
 * Special field type.
 * Поля такого типа не участвуют в построении запросов к базе
 */
require_once 'nodb.field.php';
class field_multiphoto extends field_nodb implements fieldI
{


    public $table;
    public $fk_field;
    public $fk_value;

    public $fk_type;


    public function getForm()
    {
        $this->fk_value = ((int)$_GET['id']);
        $html = '

              <link href="/services/client/fineuploader.css" rel="stylesheet" type="text/css"/>
              <script src="/services/client/js/header.js"></script>
              <script src="/services/client/js/util.js"></script>
              <script src="/services/client/js/button.js"></script>
              <script src="/services/client/js/handler.base.js"></script>
              <script src="/services/client/js/handler.form.js"></script>
              <script src="/services/client/js/handler.xhr.js"></script>
              <script src="/services/client/js/uploader.basic.js"></script>
              <script src="/services/client/js/dnd.js"></script>
              <script src="/services/client/js/uploader.js"></script>
              <script src="/services/client/js/jquery-plugin.js"></script>
              <script>
              $(document).ready(function() {
                  var errorHandler = function(event, id, fileName, reason) {
                      //qq.log("id: " + id + ", fileName: " + fileName + ", reason: " + reason);
                  };

                  var fileNum = 0;

                  $(\'.multiupload.multiphoto' . $this->fk_type . $this->fk_value . '\').fineUploader({
                      debug: false,
                      request: {
                          endpoint: "/services/photoUpload.php",
                          paramsInBody: true,
                          params: {
                              R_TYPE: \'' . $this->fk_type . '\',
                              R_ID: \'' . $this->fk_value . '\',
                              fileNum: function() {
                                  fileNum+=1;
                                  return fileNum;
                              }
                          }
                      },
                      validation: {
                          allowedExtensions: [\'jpeg\', \'jpg\', \'png\', \'gif\'],
                          sizeLimit: 8000000
                      }
                  })
                      //.on(\'error\', errorHandler)
                      .on(\'complete\', function(event, id, filename, responseJSON){
                          $(\'.subiframe' . $this->fk_type . $this->fk_value . '\').each(function() {
                            this.contentWindow.location.reload(true);
                          });

                          //do something
                        });
              });
               </script>
              <style type="text/css">
                  .stylemulti li{
                      height:130px;
                      padding:5px;
                      background: #fff;
                      margin:3px;
                  }
                  .stylemulti li.qq-upload-success{
                      display: none;
                  }
                  .stylemulti li span{
                      margin-left: 10px;
                      height:130px;

                  }
                  .stylemulti li span.upload_thumb{
                      width:160px;
                      padding: 5px 5px;
                      text-align: center;
                      display: inline-block;
                      border:1px solid #777;
                  }
              </style>


              <ul class="multiupload multiphoto' . $this->fk_type . $this->fk_value . ' stylemulti"></ul>
              <iframe class="subiframe' . $this->fk_type . $this->fk_value . ' subiframe" style="border:0px; width:100%;" src="/admin/' . $this->table . '.php?gid=' . $this->fk_value . '&R_TYPE=' . $this->fk_type . '"></iframe>

';
        /*
        <script src="/nga/templates/default/js/uploader.js"></script>

        <form method="post">
            <ul id="multiphoto"></ul>
            <input type="submit" value="Сохранить" />
        </form>


        ';
        */


        return $html;
    }

    public function getListEdit()
    {
        return '';
    }

    public function getValueFromArray($inputArray)
    {

    }

    public function getView()
    {
        $this->fk_value = ((int)$_GET['id']);
        return '<iframe class="subiframe' . $this->fk_type . $this->fk_value . ' subiframe" style="border:0px; width:100%;" src="/admin/' . $this->table . '.php?gid=' . $this->fk_value . '&R_TYPE=' . $this->fk_type . '"></iframe>';
    }


}

?>