<?php error_reporting(0);
class Config
{
    static $config = array();
    
    public static function Write($key, $value)
    {
       self::$config[$key] = $value;
    }
    
    public static function Read($key)
    {
        return self::$config[$key];
    }
}
