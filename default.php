<?php


require_once __DIR__ . '/app.php';

$app->get('/', function () use ($app) {
    
    if ($app['security']->isGranted('ROLE_ADMIN')) {
        return $app->redirect($app['url_generator']->generate('user.login'));
    } else
        return $app->redirect($app['url_generator']->generate('user.login'));
})->bind('homepage');

require_once __DIR__ . '/controllers/admin/default.php';
require_once __DIR__ . '/controllers/user/default.php';

//$app['http_cache']->run();
$app->run();