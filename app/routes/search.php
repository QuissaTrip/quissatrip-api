<?php
    $app->get('/search', function ($request, $response, $args) {
        $params = $request->getQueryParams();
        $myResponse = array(
            "status" => false,
            "search" => array()
        );

        if (count($params) > 0) {
            $sql_query = "SELECT id, name, description FROM entity WHERE ";
            $hasFilter = false;

            if (isset($params["query"])) {
                $search_query = $params["query"];
                $sql_query .= "( name LIKE '%$search_query%' OR description LIKE '%$search_query%' )";
            }

            if (isset($params["type"])) {
                $hasFilter = true;
                $type = $params["type"];

                if ($type == "place")
                    $sql_query .= "is_place = 1 ";
                else if ($type == "commerce")
                    $sql_query .= "is_commerce = 1 ";
                else if ($type == "event")
                    $sql_query .= "is_event = 1 ";
            }

            if (isset($params["circuit"])) {
                if ($hasFilter) {
                    $sql_query .= " AND ";
                }
                $hasFilter = true;
                $sql_query .= "circuit_id = " . $params["circuit"];
            }

            if (isset($params["open"])) {
                if ($hasFilter) {
                    $sql_query .= " AND ";
                }
                $hasFilter = true;
                $sql_query .= "open = '" . str_replace("-", ":", $params["open"]) . "'";
            }

            if (isset($params["close"])){
                if ($hasFilter) {
                    $sql_query .= " AND ";
                }
                $hasFilter = true;
                $sql_query .= "close = '" . str_replace("-", ":", $params["close"]) . "'";
            }

            $myResponse = array(
                "status" => true,
                "search" => db_query($sql_query)
            );
        }

        return $response->withJson( utf8ize($myResponse) );
    });
?>