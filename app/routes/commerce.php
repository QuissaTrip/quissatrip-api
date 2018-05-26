<?php
    $app->get('/commerce', function ($request, $response, $args) {
        $commerces = db_query("SELECT * FROM commerce_category");

        return $response->withJson( utf8ize($commerces) );
    });
?>
