<?php
    // Importando config e criando conexão com o banco de dados
    define('SECRET_KEY', "quissatrip-melhor-app");

    $config = include(__DIR__ . '/config.php');
    $conn = new PDO("mysql:host=".$config['db']['host'].";dbname=".$config['db']['name'], $config['db']['user'], $config['db']['password'] );
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $whitelist = array(
        '127.0.0.1',
        '::1'
    );

    function db_query($query = null, $numOfResults = null) {
        global $conn;

        if ($query != null) {
            $stmt = $conn->prepare($query);

            if ($numOfResults != null)
                $stmt->execute(array($numOfResults));
            else
                $stmt->execute();

            if (strpos($query, "INSERT") >= 0) {
                return $conn->lastInsertId();;
            } else {
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
        } else {
            return null;
        }
    }

    function utf8ize($d) {
        global $whitelist;

        if( in_array($_SERVER['REMOTE_ADDR'], $whitelist) ) {
            if (is_array($d)) {
    			foreach ($d as $k => $v) {
    				$d[$k] = utf8ize($v);
    			}
    		} else if (is_string($d)) {
    			return utf8_encode($d);
    		}
        }
		return $d;
    }
?>
