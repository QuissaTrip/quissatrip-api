<?php
    $app->get('/apps', function ($request, $response, $args) {
        $apps = db_query("SELECT playstore_url, city_name, image FROM apps ORDER BY city_name ASC");

        return $response->withJson( utf8ize($apps) );
    });
?>
