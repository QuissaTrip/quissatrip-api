<?php
    $app->get('/circuits', function ($request, $response, $args) {
        $circuits = db_query("SELECT * FROM circuit");
        for ($i=0; $i < count($circuits); $i++) {
            $circuits[$i]["total"] = db_query("SELECT COUNT(*) as total FROM entity WHERE circuit_id = " . $circuits[$i]["id"])[0]["total"];
        }
        return $response->withJson( utf8ize($circuits) );
    });

    $app->get('/circuit/{ id }', function ($request, $response, $args) {
        $id = $request->getAttribute("route")->getArgument("id");

        $circuit = db_query("SELECT * FROM circuit WHERE id = " . $id);

        if ( count($circuit) > 0 ) {
            $circuit = $circuit[0];
            $circuit["total"] = db_query("SELECT COUNT(*) as total FROM entity WHERE circuit_id = " . $circuit["id"])[0]["total"];
        }

        return $response->withJson( utf8ize($circuit) );
    });
?>
