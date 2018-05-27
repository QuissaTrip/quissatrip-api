<?php
    $app->get('/circuits', function ($request, $response, $args) {
        $circuits = db_query("SELECT * FROM circuit");
        for ($i=0; $i < count($circuits); $i++) {
            $circuits[$i]["total"] = db_query("SELECT COUNT(*) as total FROM entity WHERE circuit_id = " . $circuits[$i]["id"])[0]["total"];
        }
        return $response->withJson( utf8ize($circuits) );
    });
?>
