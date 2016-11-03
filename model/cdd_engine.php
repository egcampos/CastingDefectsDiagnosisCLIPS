<?php

/**
 * Created by PhpStorm.
 * User: Ezequiel
 * Date: 2/11/2016
 * Time: 10:18 PM
 */
final class cdd_engine {

    private static $instance = null;
    protected function __construct() {}
    protected function __clone() {}

    public static function getInstance() {
        if (!isset(static::$instance)) {
            static::$instance = new static();
        }
        return static::$instance;
    }

    public static function getDiagnosticoDiscontinuidad() {
        // Escribir aca la funcionalidad y dejarlo en una variable, se imprime
        // solo en el index.php

        return 'TEST';

    }

}