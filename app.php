<?php

date_default_timezone_set('Europe/Kiev');

$loader = require_once __DIR__ . '/vendor/autoload.php';
//$loader->add('RDA', __DIR__.'/classes');

require_once __DIR__ . '/classes/Polytech.php';
require_once __DIR__ . '/classes/Current.php';
require_once __DIR__ . '/classes/DropDownList.php';

use Doctrine\DBAL\Connection;
use Silex\Application;
use Silex\Provider\DoctrineServiceProvider;
use Silex\Provider\TwigServiceProvider;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Debug\Debug;
use Symfony\Component\HttpFoundation\Response;
use Silex\Provider;

Request::enableHttpMethodParameterOverride();

$app = new Application();

$app['debug'] = true;

require_once __DIR__ . '/config/config.php';
//$app->register(new Silex\Provider\HttpCacheServiceProvider(), array(
//    'http_cache.cache_dir' => __DIR__ . '/cache/',
//));
$app->register(new Provider\SessionServiceProvider());
$app->register(new Provider\DoctrineServiceProvider());
$app->register(new Provider\TwigServiceProvider());

$app->register(new Provider\SecurityServiceProvider(), array(
    'security.firewalls' => array(
        'secured_area' => array(
            'pattern' => '^.*$',
            'anonymous' => true, 
            'remember_me' => array(),
            'form' => array(
                'login_path' => '/user/login',
                'check_path' => '/user/login_check',
            ),
            'logout' => array(
                'logout_path' => '/user/logout',
            ),
            'users' => $app->share(function($app) {
                        return $app['user.manager'];
                    }),
        ),
    ),
));
$app->register(new Provider\RememberMeServiceProvider());
$app->register(new Provider\ServiceControllerServiceProvider());
$app->register(new Provider\UrlGeneratorServiceProvider());

$app->register(new Provider\SwiftmailerServiceProvider());

// Register the SimpleUser service provider.
$app->register($u = new SimpleUser\UserServiceProvider());

// Optionally mount the SimpleUser controller provider.
$app->mount('/user', $u);

$app->register(new \Kilte\Silex\Pagination\PaginationServiceProvider, array('pagination.per_page' => 25));



$app['twig.path'] = array(__DIR__ . '/templates',
    __DIR__ . '/templates/simpleuser',
    __DIR__ . '/templates/admin',
    __DIR__ . '/templates/user'
);

$app->boot();

$app['twig']->addGlobal('datemonthstart', date("Y-m-01"));
$app['twig']->addGlobal('datemonthend', date("Y-m-t"));
$app['twig']->addGlobal('dateyearstart', date("Y-01-01"));
$app['twig']->addGlobal('dateyearend', date("Y-12-31"));

$app['user.options'] = array(
    'templates' => array(
        'layout_template' => 'layout.twig',
        'register' => 'register.twig',
        'register-confirmation-sent' => 'register-confirmation-sent.twig',
        'login' => 'login.twig',
        'login-confirmation-needed' => 'login-confirmation-needed.twig',
        'forgot-password' => 'forgot-password.twig',
        'reset-password' => 'reset-password.twig',
        'view' => 'view.twig',
        'edit' => 'edit.twig',
        'list' => 'list.twig',
    ),
); 



/**$app['security.role_hierarchy'] = array(
    'ROLE_LOCALUSER' => array(),
    'ROLE_ADMIN' => array('ROLE_LOCALUSER', 'ROLE_POV', 'ROLE_MANAGER'),
    'ROLE_ADMIN' => array('ROLE_LOCALUSER', 'ROLE_POV', 'ROLE_BOSS', 'ROLE_OFFICE', 'ROLE_MANAGER'),
); */

$app['security.firewalls'] = array(
    'admin' => array(
        'pattern' => '^/admin/',
        'form' => array('login_path' => '/login', 'check_path' => '/admin/login_check'),
        'users' => array(
            'admin' => array('ROLE_ADMIN', '$2y$10$3i9/lVd8UOFIJ6PAMFt8gu3/r5g0qeCJvoSlLCsvMTythye19F77a'),
        ),
    ),
);

$app['security.access_rules'] = array(
    array('^/admin', 'ROLE_ADMIN', 'https'),
    array('^.*$', 'ROLE_USER'),
);




$app['user.passwordStrengthValidator'] = $app->protect(function(SimpleUser\User $user, $password) {
    if (strlen($password) < 4) {
        return 'Password must be at least 4 characters long.';
    }
    if (strtolower($password) == strtolower($user->getName())) {
        return 'Your password cannot be the same as your name.';
    }
});




//var_dump(date("Y-m-d H:i:s"));


$app->before(function () use ($app) {
    /* $token = $app['security']->getToken();
      if (null !== $token and is_object($token->getUser())) {

      $user = $token->getUser()->getId();
      $app['iamblocked'] = UsrDept::iamBlocked($user);
      $app['iamactive'] = UsrDept::iamActive($user);
      } */

    //$app['ebook_count'] = EBookStatic::getEBookCount();
    //$app["twig"]->addGlobal("rand_books", EBookStatic::getRandBooks());

    return "";
});

return $app;
