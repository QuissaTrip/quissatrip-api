<?php
    $app->get('/rolezinhos', function ($request, $response, $args) {
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

    $app->post('/rolezinho/new', function ($request, $response, $args) {
        $data = $request->getParsedBody();
        $uploadedFiles = $request->getUploadedFiles();

        // DELETAR
        return $response->withJson(utf8ize(
            array(
                0 => $data,
                1 => $uploadedFiles
            )
        ));

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

        $user_email_db = getUserEmailById($user_id);
        if ($user_email_db && $request_token == createToken($user_email_db) ) {
            $media = $uploadedFiles['media'];
            $folder = UPLOAD_DIRECTORY . "/rolezinhos";

            if ($media->getError() === UPLOAD_ERR_OK) {
                $filename = moveUploadedFile($folder, $media);
                $media = $folder . "/" . $filename;
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
?>
