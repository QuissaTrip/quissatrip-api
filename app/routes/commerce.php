<?php
    $app->get('/commerces/categories', function ($request, $response, $args) {
        $commerces = db_query("SELECT * FROM commerce_category");

        return $response->withJson( utf8ize($commerces) );
    });

    $app->get('/commerces', function ($request, $response, $args) {
        $params = $request->getQueryParams();
        $query = "SELECT id, name, description, commerce_category FROM entity WHERE is_commerce = 1";
        $newCommerces = array();

        if (isset($params["category"])) {
            $query = $query . " AND commerce_category = " . $params["category"];
        }

        $db_commerces = db_query($query);

        foreach ($db_commerces as $commerce) {
            $category = db_query("SELECT id, name FROM commerce_category WHERE id = " . $commerce["commerce_category"])[0];

            $excerpt = trim(mb_convert_encoding(substr($commerce["description"], 0, 50),"UTF-8","auto"));
            $image = db_query("SELECT image_url FROM images WHERE entity_id = " . $commerce["id"] . " LIMIT 1");

            if (strlen($excerpt) == 50) {
                $excerpt .= "...";
            }

            if (count($image) > 0) {
                $image = $image[0]["image_url"];
            } else {
                $image = null;
            }

            $newCommerces[] = array(
                'id' => $commerce["id"],
                'name' => $commerce["name"],
                'description' => strip_tags($excerpt),
                'category' => $category,
                'image' => $image
            );
        }

        return $response->withJson( utf8ize($newCommerces) );
    });
?>
