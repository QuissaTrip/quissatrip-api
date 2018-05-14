<?php
    // Importando config e criando conexão com o banco de dados
    $config = include(__DIR__ . '/config.php');
    $conn = new PDO("mysql:host=".$config['db']['host'].";dbname=".$config['db']['name'], $config['db']['user'], $config['db']['password'] );
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    function db_query($query = null, $numOfResults = null) {
        global $conn;

        if ($query != null) {
            $stmt = $conn->prepare($query);

            if ($numOfResults != null)
                $stmt->execute(array($numOfResults));
            else
                $stmt->execute();

            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else {
            return null;
        }
    }

    function utf8ize($d) {
        if (is_array($d)) {
			foreach ($d as $k => $v) {
				$d[$k] = utf8ize($v);
			}
		} else if (is_string($d)) {
			return utf8_encode($d);
		}
		return $d;
    }
?>