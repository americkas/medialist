<?php


class DbAdaperFactory
{
    public function createService ()
    {
        $config = include '../src/config/config.php';
        return new \PDO(
            sprintf('mysql:host=%s;dbname=%s', $config['db']['host'], $config['db']['dbname']),
            $config['db']['user'],
            $config['db']['password'],
            array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    }
}