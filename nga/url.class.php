<?php

class url
{

    //Default values
    private $url;
    private $languageUrl = 'ru';
    private $moduleUrl = 'page';
    private $currentUrl = 'index';

    public function __construct()
    {
        //$this->url = lib::getData('url', '/[0-9a-z\/_\-]/i', 'string', 'ru/page/index', 'G');
        //lib::pre($_SERVER['QUERY_STRING']);
        //lib::pre($_GET);

        $this->url = $_SERVER['REQUEST_URI'];

        $e = explode('/', mb_strtolower($this->url));
        $admin = false;
        //Language Url
        if (IsSet($e[0]) && strlen($e[0]) == 2)
            $this->languageUrl = $e[0];

        //Module Url
        if (IsSet($e[1]) //&&isset(main::i()->module[$e[1]])
        )
            $this->moduleUrl = $e[1];

        //Current Url
        if (!empty($e[2])) {
            $this->currentUrl = substr($this->url, strpos($this->url, "/", 3) + 1);
        }
        $urlPath[] = '<a href="/' . $this->languageUrl . '/">' . main::i()->getObject('language')->get($this->languageUrl)->title . '</a>&nbsp;/&nbsp;';
        $urlPath[] = '<a href="/' . $this->languageUrl . '/' . $this->moduleUrl . '/">' . main::i()->getObject('module')->get($this->moduleUrl)->title . '</a>&nbsp;/&nbsp;';
        //lib::pre($urlPath);
        //lib::pre($this);
        //die();
    }

    /**
     * Return current language url
     *
     * @return String
     */
    public function getLanguageUrl()
    {
        return $this->languageUrl;
    }

    /**
     * Return current module url
     *
     * @return String
     */
    public function getModuleUrl()
    {
        return $this->moduleUrl;
    }

    /**
     * Return current url
     *
     * @return String
     */
    public function getCurrentUrl()
    {
        return $this->currentUrl;
    }

}

?>