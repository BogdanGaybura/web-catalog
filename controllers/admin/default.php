<?php

$app->get('/matworths', function () use ($app) {
    $conn = $app['db'];
    $matworths = $conn->fetchAll('SELECT id_matworth, inventory_num, name_provider, num_cab  FROM main_view');
    return $app['twig']->render('matworths.twig', ['matworths' => $matworths]);
})->bind('matworths');

$app->get('/matworths/add', function () use ($app) {
    $conn = $app['db'];
    $users = $conn->fetchAll('SELECT id, name FROM users WHERE roles = "ROLE_USER"');
    $cabs = $conn->fetchAll('SELECT id_cab, num_cab FROM cab');
    $providers = $conn->fetchAll('SELECT * FROM provider');
    $types = $conn->fetchAll('SELECT * FROM type');

    $token = $app['security']->getToken();
    if (null !== $token) {
        $user['id'] = $token->getUser()->getId();
    }

    return $app['twig']->render('addmatw.twig', ['users' => $users,
                'cabs' => $cabs,
                'providers' => $providers,
                'types' => $types,
                'id_user' => $user['id']
    ]);
})->bind('add');

$app->post('/matworths/add', function() use ($app) {
    $conn = $app['db'];
    $req = $app['request'];

    $inventory_num = $req->get('inventory_num');
    $id_type = $req->get('id_type');
    $id_provider = $req->get('id_provider');
    $id_cab = $req->get('id_cab');
    $id_user = $req->get('id_user');
    $price = $req->get('price');

    $conn->insert('material_worth', ['inventory_num' => $inventory_num,
        'id_type' => $id_type,
        'id_provider' => $id_provider,
        'id_cab' => $id_cab,
        'id_user' => $id_user,
        'price' => $price
    ]);

    $id_matworth = $conn->lastInsertId();
    $arCharact = $req->get('id_name_ch');
    $arCharactValue = $req->get('value');

    foreach ($arCharact as $chKey => $chItem) {
        $conn->insert('ch', ['id_matworth' => $id_matworth,
            'id_name_ch' => $chItem,
            'value' => $arCharactValue[$chKey]]);
    }

    return $app->redirect($app['url_generator']->generate('view', array('id_matworth' => $id_matworth)));
});

$app->get('/matworths/edit', function () use ($app) {
    $conn = $app['db'];

    $req = $app['request'];
    $id_matworth = $req->get('id_matworth');
    $matworths = $conn->fetchAll('SELECT inventory_num, price FROM main_view WHERE id_matworth = ?', [$id_matworth]);
    $users = $conn->fetchAll('SELECT id, name FROM users WHERE roles = "ROLE_USER"');
    $cabs = $conn->fetchAll('SELECT id_cab, num_cab FROM cab');
    $providers = $conn->fetchAll('SELECT * FROM provider');
    $types = $conn->fetchAll('SELECT * FROM type');
    
    $token = $app['security']->getToken();
    if (null !== $token) {
        $user['id'] = $token->getUser()->getId();
    }

    return $app['twig']->render('editmatw.twig', ['users' => $users,
                'cabs' => $cabs,
                'providers' => $providers,
                'types' => $types,
                'id_user' => $user['id'],
                'matworths' => $matworths
    ]);
})->bind('edit');

$app->post('/matworths/edit', function() use ($app) {
    $conn = $app['db'];
    $req = $app['request'];

    $inventory_num = $req->get('inventory_num');
    $id_type = $req->get('id_type');
    $id_provider = $req->get('id_provider');
    $id_cab = $req->get('id_cab');
    $id_user = $req->get('id_user');
    $price = $req->get('price');

    $conn->insert('material_worth', ['inventory_num' => $inventory_num,
        'id_type' => $id_type,
        'id_provider' => $id_provider,
        'id_cab' => $id_cab,
        'id_user' => $id_user,
        'price' => $price
    ]);

    $id_matworth = $conn->lastInsertId();
    $arCharact = $req->get('id_name_ch');
    $arCharactValue = $req->get('value');

    foreach ($arCharact as $chKey => $chItem) {
        $conn->insert('ch', ['id_matworth' => $id_matworth,
            'id_name_ch' => $chItem,
            'value' => $arCharactValue[$chKey]]);
    }

    return $app->redirect($app['url_generator']->generate('view', array('id_matworth' => $id_matworth)));
});

$app->get('/matworths/view', function () use ($app) {
    $conn = $app['db'];
    $req = $app['request'];
    $id_matworth = $req->get('id_matworth');

    $matworths = $conn->fetchAll('SELECT * FROM main_view WHERE id_matworth = ?', [$id_matworth]);
    $chs = $conn->fetchAll('SELECT * FROM ch_full WHERE id_matworth = ?', [$id_matworth]);

    return $app['twig']->render('viewmatw.twig', ['matworths' => $matworths,
                'chs' => $chs]);
})->bind('view');



$app->post('/matworth/delete', function() use ($app) {
    $conn = $app['db'];
    $req = $app['request'];
    $id_matworth = $req->get('id_matworth');

    $conn->delete('material_worth', ['id_matworth' => $id_matworth]);
    $conn->delete('ch', ['id_matworth' => $id_matworth]);
    return $app->redirect($app['url_generator']->generate('matworths'));
})->bind('delete');

