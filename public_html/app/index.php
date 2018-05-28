<?php
	header('Content-Type: text/html; charset=utf-8');
	session_cache_limiter(false);
	session_start();
	error_reporting(E_ALL);
    define('UPLOAD_DIRECTORY', __DIR__ . "/files");

	require '../../app/vendor/autoload.php';
	require '../../app/database/connection.php';
	require '../../app/functions.php';
	use Psr\Http\Message\RequestInterface as Request;
	use Psr\Http\Message\ResponseInterface as Response;
	use Slim\Http\UploadedFile as UploadedFile;

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

	$app->add(function ($req, $res, $next) {
	    $response = $next($req, $res);
	    return $response
	            ->withHeader('Access-Control-Allow-Origin', '*') //dies gewährleistet den Zugriff für alle extere Programme und sollte nur zur Entwicklung genutzt werden
	            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
	            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
	});
	/*
	 *
	 * Fim
	 *
	 */

	$routers = glob('../../app/routes/*.php');

    foreach ($routers as $router) {
        require $router;
    }

	$app->get('/', function ($request, $response) {
		return $response->withJson(array(
			'mensagem' => "Bem vindo à API do Aplicativo QuissaTrip"
		));
	});

    $app->run();
?>
