<?php

class news extends ngaController
{

    public function actionIndex()
    {
        include 'nga/tables/news.php';

//        $this->tpl = 'page';

        $this->layout = 'layout_white';
        $this->tpl = 'news';
        //$this->tplData += $currentNewsData;
        $this->tplData['newsData'] = $news_table->getData();

        $this->layoutData['h1'] = "Новости";
        $this->layoutData['title'] = "Новости";
        $this->layoutData['content'] = "Новости";
    }

}