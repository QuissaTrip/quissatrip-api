<?php
    function formatEntity($entity) {
        $newEntity = array(
            'id' => $entity["id"],
            'name' => $entity["name"],
            'address' => $entity["address"],
            'address_extra' => $entity["address_extra"],
            'description' => $entity["description"],
            'info' => $entity["info"],
            'latitude' => $entity["latitude"],
            'longitude' => $entity["longitude"],
            'open' => $entity["open"],
            'close' => $entity["close"]
        );

        if ($entity["is_commerce"] == true) {
            $commerce_category = db_query("SELECT * FROM commerce_category WHERE id = " . $entity["comerce_category"], 1);

            $newEntity["category_name"] = $commerce_category[0]["nome"];
            $newEntity["category_id"] = $commerce_category[0]["id"];
        }
        else if ($entity["is_place"] == true) {
            $circuit = db_query("SELECT * FROM circuit WHERE id = " . $entity["circuit_id"], 1);

            $newEntity["circuit_name"] = $circuit[0]["name"];
            $newEntity["circuit_id"] = $circuit[0]["id"];
        }

        $newEntity["images"] = array();
        $images = db_query("SELECT * FROM images WHERE entity_id = " . $entity["id"], 1);

        foreach ($images as $image) {
            $newEntity["images"][] = $image["image_url"];
        }

        return $newEntity;
    }

    function formatEntityList($entities) {
        $newEntities = array();

        foreach ($entities as $entity) {
            if ($entity["is_place"] == true)
                $category = "Lugar";
            else if ($entity["is_commerce"] == true)
                $category = "Comércio";
            else if ($entity["is_event"] == true)
                $category = "Evento";
            else
                $category = "";

            $excerpt = mb_convert_encoding(substr($entity["description"], 0, 50),"UTF-8","auto");

            if ($entity["commerce_category"] != 0) {
                $commerce_category = db_query("SELECT * FROM commerce_category WHERE id = " . $entity["commerce_category"], 1);
                $commerce_name = $commerce_category[0]["nome"];
            } else {
                $commerce_name = null;
            }

            $newEntities[] = array(
                'id' => $entity["id"],
                'name' => $entity["name"],
                'description' => trim($excerpt),
                'category' => $category,
                'commerce_category' => $commerce_name
            );
        }

        var_dump($newEntities);
    }

    /*
     ** Rotas **
    */

    $app->get('/entity', function ($request, $response, $args) {
        $data = db_query("SELECT id, name, description, is_place, is_commerce, is_event, is_other, commerce_category, circuit_id FROM entity");

        $data = formatEntityList($data);

        //$data = formatEntity( $data[0] );

		//return $response->withJson( utf8ize($data) );
    });

    $app->get('/entity/{ id }', function ($request, $response, $args) {
        $route = $request->getAttribute("route");
		$id = $route->getArgument("id");

        $data = db_query("SELECT * FROM entity WHERE id = " . $id, 1);
        $data = formatEntity( $data[0] );

		return $response->withJson( utf8ize($data) );
    });

?>
