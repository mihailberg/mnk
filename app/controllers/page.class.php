<?php

class page extends ngaController
{

    protected $tpl;

    public function __construct($url)
    {
        $this->fullUrl = $url;
        if (!isset($url[0])) return false;
        include 'nga/tables/page.php';

        $menu = clone $page_table;
        $menu->perPage = 10000;
        $menuData = $menu->getData();
        //print_r($menuData);
        $tree = array();
        foreach ($menuData as $id => $node) {
            if ($node['parentID'] == 0) {
                $tree[$node['tid']][0] = $node;
            } else {
                $tree[$node['parentID']][$node['tid']] = $node;
            }
        }

        //print_r($tree);
        $this->varsPrepare();
        if (count($url) > 0) {
            $page_lvl2 = clone $page_table;
            $page_table->addWhere('url', "'" . nga_config::db()->real_escape_string($url[0]) . "'");
            $parentPageData = $page_table->getData();
            if (!is_array($parentPageData)) {
                $this->page404();
            }

            $parentPageData = array_shift($parentPageData);

            if (isset($url[1])) {
                $page_lvl2->addWhere('url', "'" . nga_config::db()->real_escape_string($url[1]) . "'");
                $page_lvl2->addWhere('parentID', $parentPageData['tid']);

                $currentPageData = $page_lvl2->getData();
                if (!is_array($currentPageData)) {
                    $this->page404();
                }
                $currentPageData = array_shift($currentPageData);

            }

            if (!isset($currentPageData)) {
                $currentPageData = $parentPageData;
                $this->tplData['parentPageData'] = $parentPageData;
            }
        }

        $this->layout = 'layout_white';
        $this->tpl = 'page';
        $this->tplData += $currentPageData;
        $this->tplData['tree'] = $tree;
        $this->layoutData['h1'] = $currentPageData['h1'];
        $this->layoutData['title'] = $currentPageData['title'];
        $this->layoutData['content'] = $currentPageData['content'];
        $this->show();
    }

    public function actionIndex()
    {
    }

}