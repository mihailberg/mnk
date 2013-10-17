<?php

class User
{
    static $o;
    /**
     *
     * @return User 
     */
    static function i(){
        if(!self::$o){self::$o = new User();}
        return self::$o;
    }
    
    const SALT = '493hf780!@%$#%&(^+&*';


    private $currentUser;

    protected function __construct()
    {
        session_start();
        if (isset($_POST['login']) && isset($_POST['password']) && !$this->isAuth()) {
            $this->login();
        }
    }

    public function getID(){
        return $this->currentUser['userID'];
    }
    
    public function getName()
    {
        return $this->currentUser['name'];
    }
    
    public function getFio(){
        return $this->currentUser['fio'];
    }
    
    public function getPhone()
    {
        return $this->currentUser['phone'];
    }
    
    static function createPassword($inputPasswod)
    {
        return md5($inputPasswod . self::SALT);
    }

    public function isAdmin()
    {
        if ($this->isAuth()) {
            return $this->currentUser['isadmin'];
        }
    }

    public function isAuth()
    {
        //This
        if (isset($this->currentUser['name'])) {
            return true;
        }
        
        //Session
        if (isset($_SESSION['NGA_user_id'])) {
            $query = "SELECT * FROM `user` WHERE `userID`='".(int)$_SESSION['NGA_user_id']."'       LIMIT 1";
            $res = nga_config::i()->db()->query($query);
            if ($res->num_rows == 1) {
                $this->currentUser = $res->fetch_assoc();
                return true;
            } else {
                return false;
            }
        }
        
        //Cookie
        if (isset($_COOKIE['NGA_login']) && isset($_COOKIE['NGA_password'])) {
            $login = nga_config::i()->db()->real_escape_string($_COOKIE['NGA_login']);
            $password = nga_config::i()->db()->real_escape_string($_COOKIE['NGA_password']);

            $query = "SELECT *
                    FROM `user`
                    WHERE `login`='{$login}' AND `password`='{$password}'
                    LIMIT 1";
            $res = nga_config::i()->db()->query($query);

            // если такой пользователь нашелся
            if ($res->num_rows == 1) {
                // то мы ставим об этом метку в сессии (допустим мы будем ставить ID пользователя)

                $this->currentUser = $res->fetch_assoc();
                $_SESSION['NGA_user_id'] = $this->currentUser['userID'];
                return true;
            }
        }
        
        return false;
    }

    public function login()
    {
        $login = nga_config::i()->db()->real_escape_string($_POST['login']);
        $password = self::createPassword($_POST['password']);

        $query = "SELECT * FROM `user`
                WHERE `login`='{$login}' AND `password`='{$password}'
                LIMIT 1";
        $res = nga_config::i()->db()->query($query);

        if ($res->num_rows == 1) {
            $this->currentUser = $row = $res->fetch_assoc();
            $_SESSION['NGA_user_id'] = $row['userID'];

            //месяц
            $expire = time() + (3600 * 24 * 30);
            setcookie("NGA_login", $login, $expire, "/");
            setcookie("NGA_password", $password, $expire, "/");
            return true;
        }
        return false;
    }

    public function logout()
    {
        unset($this->currentUser);
        unset($_SESSION['NGA_user_id']);
        setcookie("NGA_login");
        setcookie("NGA_password");
        unset($_COOKIE['NGA_login']);
        unset($_COOKIE['NGA_password']);
        
    }

}
?>