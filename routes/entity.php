<?php

    function formatEntity($entity) {
        $newEntity = array(
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

        return $newEntity;
    }

    $app->get('/entity/{ id }', function ($request, $response, $args) {
        $route = $request->getAttribute("route");
		$id = $route->getArgument("id");

        $data = db_query("SELECT * FROM entity WHERE id = " . $id, 1);
        $data = formatEntity( $data[0] );

		return $response->withJson( utf8ize($data) );
    });

?>
