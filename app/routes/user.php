<?php
    $app->post('/user/login', function ($request, $response, $args) {
        $data = $request->getParsedBody();

        $email = trim($data["email"]);
        $password = hash('sha512', $data["password"]);

        $user = db_query("SELECT id, name, email, avatar, cpf FROM user WHERE email = '" . $email . "' AND password = '" . $password . "'");

        if (count($user) > 0) {
            $user = $user[0];
            $user["token"] = createToken($user["email"]);
        }

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
            $data["avatar"] = "http://lucascraveiropaes.com/app/files/user.png";
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

?>
