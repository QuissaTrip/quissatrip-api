<?php
    $app->get('/rolezinho', function ($request, $response, $args) {
        $roles = db_query("SELECT * FROM rolezinho");
        $myResponse = array();

        foreach ($roles as $role) {
            $user = db_query("SELECT id, name, avatar FROM user WHERE id = " . $role["user_id"])[0];

            $myResponse[] = array(
                "id" => $role["id"],
                "media" => $role["media"],
                "text" => $role["text"],
                "user" => $user
            );
        }

        return $response->withJson( utf8ize($myResponse) );
    });
?>
