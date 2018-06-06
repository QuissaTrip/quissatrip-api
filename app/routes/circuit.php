<?php
    $app->get('/categories', function ($request, $response, $args) {
        $categories = db_query("SELECT * FROM categories");
        for ($i=0; $i < count($categories); $i++) {
            $categories[$i]["total"] = db_query("SELECT COUNT(*) as total FROM entity WHERE category_id = " . $categories[$i]["id"])[0]["total"];
        }
        return $response->withJson( utf8ize($categories) );
    });

    $app->get('/categories/{ id }', function ($request, $response, $args) {
        $id = $request->getAttribute("route")->getArgument("id");

        $circuit = db_query("SELECT * FROM categories WHERE id = " . $id);

        if ( count($circuit) > 0 ) {
            $circuit = $circuit[0];
            $circuit["total"] = db_query("SELECT COUNT(*) as total FROM entity WHERE category_id = " . $circuit["id"])[0]["total"];
        }

        return $response->withJson( utf8ize($circuit) );
    });
?>
