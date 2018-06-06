<?php
    $app->get('/entity/{ id }', function ($request, $response, $args) {
        $id = $request->getAttribute("route")->getArgument("id");

        $entity = db_query("SELECT * FROM entity WHERE id = " . $id, 1)[0];

        $newEntity = array(
            'id' => $entity["id"],
            'name' => $entity["name"],
            'address' => $entity["address"],
            'phone' => $entity["phone"],
            'address_extra' => $entity["address_extra"],
            'description' => $entity["description"],
            'info' => $entity["info"],
            'latitude' => $entity["latitude"],
            'longitude' => $entity["longitude"],
            'open' => $entity["open"],
            'close' => $entity["close"]
        );

        if ($entity["is_commerce"] == true) {
            $commerce_category = db_query("SELECT * FROM commerce_category WHERE id = " . $entity["commerce_category"], 1);

            $newEntity["category_name"] = $commerce_category[0]["name"];
            $newEntity["category_id"] = $commerce_category[0]["id"];
        }
        else if ($entity["is_place"] == true) {
            $category = db_query("SELECT * FROM categories WHERE id = " . $entity["category_id"], 1);

            $newEntity["category_name"] = $category[0]["name"];
            $newEntity["category_id"] = $category[0]["id"];
        }

        $newEntity["images"] = array();
        $images = db_query("SELECT * FROM images WHERE entity_id = " . $entity["id"]);

        foreach ($images as $image) {
            $newEntity["images"][] = $image["image_url"];
        }

        return $response->withJson( utf8ize($newEntity) );
    });
?>
