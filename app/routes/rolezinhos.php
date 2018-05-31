<?php
    function checkRole($data) {
        $error = array();
        if ( !array_key_exists("user_id", $data) || null == $data["user_id"] || $data["user_id"] == "" ) {
            $error["user"] = "Informe um usuário";
        }

        return $error;
    }

    function getUserEmailById($id = 0) {
        $user = db_query("SELECT email FROM user WHERE id = " . $id);

        if (count($user) > 0) {
            $user = $user[0];

            return $user["email"];
        }

        return false;
    }

    function checkToken($user_id = null, $token) {
        if ($user_id == null) {
            return false;
        }

        $resp = false;
        $user_email_db = getUserEmailById($user_id);

        if ($user_email_db && $token == createToken($user_email_db)) {
            $resp = true;
        }

        return $resp;
    }

    $app->get('/rolezinhos', function ($request, $response, $args) {
        $roles = db_query("SELECT id, media, text, user_id, date FROM rolezinho ORDER BY date DESC");
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

    $app->post('/rolezinho/new', function ($request, $response, $args) {
        $data = $request->getParsedBody();
        $uploadedFiles = $request->getUploadedFiles();

        //move_uploaded_file($data["media"], __DIR__);

        $errors = checkRole($data);

        if (count($errors) > 0) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "errors" => $errors
                )
            ));
        }

        $text = $data['text'];
        $user_id = $data['user_id'];
        $request_token = $data['token'];

        if ( checkToken($user_id, $request_token) ) {
            $media = $uploadedFiles['media'];
            $folder = UPLOAD_DIRECTORY . "/rolezinhos";

            if ($media->getError() === UPLOAD_ERR_OK) {
                $filename = moveUploadedFile($folder, $media);
                $media = "http://" . $_SERVER['SERVER_NAME'] . "/app/files/rolezinhos/" . $filename;
            }

            db_query("INSERT INTO rolezinho (media, text, user_id) VALUES ('$media', '$text', '$user_id')");

            return $response->withJson(utf8ize(
                array(
                    "status" => true,
                    "message" => "Seu rolezinho foi adicionado com sucesso!"
                )
            ));
        } else {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "error" => "Token Inválido"
                )
            ));
        }
    });

    $app->post('/rolezinho/delete', function ($request, $response, $args) {
        $data = $request->getParsedBody();

        if ( checkToken($data["user_id"], $data["token"]) ) {
            $media = db_query("SELECT media FROM rolezinho WHERE id = " . $data["id"])[0]["media"];
            $path = UPLOAD_DIRECTORY . "/rolezinhos/" . basename($media);

            db_query("DELETE FROM rolezinho WHERE id = " . $data["id"]);

            unlink($path);

            return $response->withJson(utf8ize(
                array("status" => true, "message" => "Rolezinho deletado com sucesso" )
            ));
        }

        return $response->withJson(utf8ize(
            array("status" => false, "message" => "Não foi possível deletar o rolezinho" )
        ));
    });

    $app->post('/rolezinho/report', function ($request, $response, $args) {
        $data = $request->getParsedBody();

        if ( checkToken($data["user_id"], $data["token"]) ) {
            db_query("UPDATE rolezinho SET report = 1 WHERE id = " . $data["id"]);

            return $response->withJson(utf8ize(
                array("status" => true, "message" => "Sua denúncia foi registrada com sucesso" )
            ));
        }

        return $response->withJson(utf8ize(
            array("status" => false, "message" => "Não foi possível denunciar esse rolezinho agora, tente novamente mais tarde" )
        ));
    });
?>
