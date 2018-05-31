<?php
    $app->get('/events', function ($request, $response, $args) {
        $events = db_query("SELECT * FROM events");

        //var_dump( array_group_by($events, "month") );

        return $response->withJson( utf8ize( array_group_by($events, "month") ) );
    });
?>
