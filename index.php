<?php
	session_cache_limiter(false);
	session_start();
	error_reporting(E_ALL);

	require 'vendor/autoload.php';
	require 'database/connection.php';
	use Psr\Http\Message\RequestInterface as Request;
	use Psr\Http\Message\ResponseInterface as Response;
	use Slim\Http\UploadedFile;

	$app = new \Slim\App(array(
		'settings' => [
	        'displayErrorDetails' => true
	    ]
	));

	/*
	 *
	 * Função para ignorar a presença ou a falta de '/' no link
	 *
	 */
	$app->add(function (Request $request, Response $response, callable $next) {
	    $uri = $request->getUri();
	    $path = $uri->getPath();
	    if ($path != '/' && substr($path, -1) == '/') {
	        $uri = $uri->withPath(substr($path, 0, -1));
	        if($request->getMethod() == 'GET')
	            return $response->withRedirect((string)$uri, 301);
	        else
	            return $next($request->withUri($uri), $response);
	    }
	    return $next($request, $response);
	});


	/*******************************************************************************\
	|                                                                               |
	|                                   Rotas                                       |
	|                                                                               |
	\*******************************************************************************/

	$app->get('/', function ($request, $response) {
		return $response->withJson(array(
			'mensagem' => "Bem vindo à API do Aplicativo QuissaTrip"
		));
	});

	// Rotas relacionadas as entidades
	require 'routes/entity.php';

	// Rotas relacionadas aos comércios
	require 'routes/commerce.php';

	// Rotas relacionadas aos circuitos
	require 'routes/circuit.php';

	$app->run();
?>
