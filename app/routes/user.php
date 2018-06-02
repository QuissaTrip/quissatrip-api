<?php
    /******************************************/
    /*              LOGIN ROUTE               */
    /******************************************/
    $app->post('/user/login', function ($request, $response, $args) {
        $data = $request->getParsedBody();

        $email = trim($data["email"]);
        $password = hash('sha512', $data["password"]);

        $user = db_query("SELECT id, name, email, avatar, cpf FROM user WHERE email = '" . $email . "' AND password = '" . $password . "'");

        if (count($user) == 0) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "dsf" => [$email, $password],
                    "errors" => ["Senha ou login incorretos"]
                )
            ));
        }

        $user = $user[0];
        $user["token"] = createToken($user["email"]);

        $myResponse = array(
            "status" => true,
            "user" => $user
        );

        return $response->withJson( utf8ize($myResponse) );
    });

    function checkData($data) {
        $error = array();

        if ( !array_key_exists("name", $data) || null == $data["name"] || $data["name"] == "" ) {
            $error["name"] = "Informe o nome corretamente";
        }
        if ( !array_key_exists("email", $data) || null == $data["email"] || $data["email"] == "") {
            $error["email"] = "Informe o email corretamente";
        }
        if ( !array_key_exists("password", $data) || null == $data["password"] || $data["password"] == "") {
            $error["password"] = "Informe a senha corretamente";
        }
        if ( !array_key_exists("cpf", $data) || null == $data["cpf"] || $data["cpf"] == "") {
            $error["cpf"] = "Informe o CPF corretamente";
        }
        return $error;
    }

    /******************************************/
    /*              CREATE ROUTE              */
    /******************************************/

    $app->post('/user/new', function ($request, $response, $args) {
        $data = $request->getParsedBody();

        $errors = checkData($data);

        if (count($errors) > 0) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "errors" => $errors
                )
            ));
        }

        if ( !array_key_exists("avatar", $data) || null == $data["avatar"] || $data["avatar"] == "") {
            $data["avatar"] = API_BASE + "/files/user.png";
        }

        $name = trim($data["name"]);
        $email = trim($data["email"]);
        $password = hash('sha512', $data["password"]);
        $cpf = str_replace(".", "", trim($data["cpf"]) );
        $cpf = str_replace( "-", "", $cpf);
        $avatar = $data["avatar"];

        $hasUser = db_query("SELECT email, cpf FROM user WHERE email = '" . $email . "' OR cpf = '" . $cpf . "'");

        if (count($hasUser) > 0) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "errors" => ["Já existe um usuário com esse email ou CPF"]
                )
            ));
        }

        $userID = db_query("INSERT INTO user (name, email, password, cpf, avatar) VALUES ('$name', '$email', '$password', '$cpf', '$avatar')");

        return $response->withJson(utf8ize(
            array(
                "status" => true,
                "user" => array(
                    "id" => $userID,
                    "name" => $name,
                    "email" => $email,
                    "cpf" => $cpf,
                    "avatar" => $avatar,
                    "token" => createToken($email)
                )
            )
        ));
    });

    //******************************************//
    //               UPDATE ROUTE               //
    //******************************************//

    $app->post('/user/update', function ($request, $response, $args) {
        $data = $request->getParsedBody();
        $uploadedFiles = $request->getUploadedFiles();

        $user_id = $data['user_id'];
        $request_token = $data['token'];

        $errors = checkData($data);

        if (count($errors) > 0) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "errors" => $errors
                )
            ));
        }

        $is_valid = checkToken($user_id, $request_token);

        if ($is_valid == false) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "errors" => ["Você não possui permissão para fazer essa modificação"]
                )
            ));
        }

        if ( !array_key_exists("avatar", $uploadedFiles) || null == $uploadedFiles["avatar"] || $uploadedFiles["avatar"] == "") {
            $avatar = API_BASE . "/files/user.png";
        } else {
            $avatar = $uploadedFiles['avatar'];
            $folder = UPLOAD_DIRECTORY . "/users";

            // Deletando avatar antigo
            $oldAvatar = db_query("SELECT avatar FROM user WHERE id = $user_id")[0]["avatar"];

            if ($avatar !== $oldAvatar) {
                unlink( $folder . "/" . basename($oldAvatar) );

                // Subindo para o servidor a imagem do novo avatar
                if ($avatar->getError() === UPLOAD_ERR_OK) {
                    $filename = moveUploadedFile($folder, $avatar);
                    $avatar = "http://" . $_SERVER['SERVER_NAME'] . "/app/files/users/" . $filename;
                }
            }
        }

        $name = trim($data["name"]);
        $email = trim($data["email"]);
        $cpf = str_replace(".", "", trim($data["cpf"]) );
        $cpf = str_replace( "-", "", $cpf);
        $query = "UPDATE user SET name = '$name', email = '$email', avatar = '$avatar', cpf = '$cpf'";

        if ($data["password"] !== "password") {
            $password = hash('sha512', $data["password"]);

            $query .= ", password = '$password'";
        }

        $query .= " WHERE id = $user_id";

        $updated = db_query($query);

        if ($updated !== true) {
            return $response->withJson(utf8ize(
                array(
                    "status" => false,
                    "errors" => ["Não foi possível atualizar seu perfil"]
                )
            ));
        }

        return $response->withJson(utf8ize(
            array(
                "status" => true,
                "user" => array(
                    "id" => $user_id,
                    "name" => $name,
                    "email" => $email,
                    "cpf" => $cpf,
                    "avatar" => $avatar,
                    "token" => createToken($email)
                )
            )
        ));
    });


    $app->get('/hash', function ($request, $response, $args) {
        var_dump(hash('sha512', "lucas123"));
    });

?>
