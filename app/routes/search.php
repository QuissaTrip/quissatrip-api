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

            if (isset($params["category"])) {
                if ($hasFilter) {
                    $sql_query .= " AND ";
                }
                $hasFilter = true;
                $sql_query .= "category_id = " . $params["category"];
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

            $search_results = db_query($sql_query);

            for ($i=0; $i < count($search_results); $i++) {
                $image = db_query("SELECT image_url FROM images WHERE entity_id = " . $search_results[$i]["id"] . " LIMIT 1");

                if (count($image) > 0) {
                    $search_results[$i]["image"] = $image[0]["image_url"];
                } else {
                    $search_results[$i]["image"] = "";
                }
            }

            $myResponse = array(
                "status" => true,
                "search" => $search_results
            );
        }

        return $response->withJson( utf8ize($myResponse) );
    });
?>
