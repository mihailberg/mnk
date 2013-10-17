<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ng
 * Date: 11/30/12
 * Time: 1:42 AM
 * To change this template use File | Settings | File Templates.
 */
class site extends ngaController
{
    public function actionIndex(){
        $this->tpl = 'index';
        $this->noLayout = 1;

        return;
    }

}