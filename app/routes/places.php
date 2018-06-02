<?php
    $app->get('/places', function ($request, $response, $args) {
        $params = $request->getQueryParams();
        $query = "SELECT id, name, description, circuit_id FROM entity WHERE is_place = 1";

        if (isset($params["circuit"])) {
            $query = $query . " AND circuit_id = " . $params["circuit"];
        }

        $db_places = db_query($query);
        $myResponse = array("status" => false);

        if ($db_places !== null && count($db_places) > 0) {
            $myResponse = array();
            foreach ($db_places as $place) {
                $category = "Lugar";
                $excerpt = trim(mb_convert_encoding(substr($place["description"], 0, 50),"UTF-8","auto"));
                $image = db_query("SELECT image_url FROM images WHERE entity_id = " . $place["id"] . " LIMIT 1");

                if (strlen($excerpt) == 50) {
                    $excerpt .= "...";
                }

                if (count($image) > 0) {
                    $image = $image[0]["image_url"];
                } else {
                    $image = null;
                }

                $myResponse[] = array(
                    'id' => $place["id"],
                    'name' => $place["name"],
                    'description' => strip_tags($excerpt),
                    'category' => $category,
                    'image' => $image
                );
            }
        }

        return $response->withJson( utf8ize($myResponse) );
        //return $response->withJson( $myResponse );
    });
?>
