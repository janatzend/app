<?php

namespace zend\traits;

trait ActiveRecordDbConnectionTrait
{
    public static function getDb()
    {
        if (!self::$dbConfigName) {
            self::setDbConfig();
        }
        return \Yii::$app->{self::$dbConfigName};
    }
}
