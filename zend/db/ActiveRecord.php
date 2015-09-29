<?php
namespace zend\db;

class ActiveRecord extends \yii\db\ActiveRecord
{
    const CUSTOM_EXTENSION_DIR_NAME = 'extension';
    const CUSTOM_DB_CONFIG_NAME_PREFIX = 'db_';
    
    use \zend\traits\ActiveRecordDbConnectionTrait; 
    
    protected static $dbConfigName;
    
    public static function setDBConfig() {
        list($dir, $extension) = explode('\\', get_called_class());
        if (strpos($dir, self::CUSTOM_EXTENSION_DIR_NAME) === false) {
            throw new \Exception("Custom class has to be located in folder [" . self::CUSTOM_DIR_NAME ."], but is [$dir]");
        }
        
        $dbConfigName = self::CUSTOM_DB_CONFIG_NAME_PREFIX . $extension;
        if (!\Yii::$app->has($dbConfigName)) {
            throw new \Exception("Cannot find db config with name [$dbConfigName]");
        }
        self::$dbConfigName = $dbConfigName;
    }
}