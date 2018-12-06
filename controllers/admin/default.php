<?php

$app->get('/admin/items/all', function () use ($app) {
    $data['items'] = Polytech::getItemsList();
    return $app['twig']->render('admin.items.twig', $data);
})->bind('admin.items');


$app->get('/admin/items/add', function () use ($app) {

    $request = $app['request'];

    $id_type = $request->query->get('id_type');

    $response = DropDownList::getNameChByIdType($id_type);
    $chs = json_encode($response);
    
    $users = DropDownList::getUsersByUserRole();
    $cabs = DropDownList::getCab();
    $providers = DropDownList::getProvider();
    $types = DropDownList::getType();
   
    return $app['twig']->render('admin.add.twig', ['users' => $users,
                'cabs' => $cabs,
                'providers' => $providers,
                'types' => $types,
                'chs' => $chs]);
})->bind('admin.add');

$app->post('/admin/items/add', function() use ($app) {
    $request = $app['request'];

    $data['inv_num'] = $request->request->get('inv_num');
    $data['id_type'] = $request->request->get('id_type');
    $data['id_provider'] = $request->request->get('id_provider');
    $data['id_cab'] = $request->request->get('id_cab');
    $data['id_user'] = $request->request->get('id_user');
    $data['price'] = $request->request->get('price');

    $app['db']->insert('item', $data);

    $id_item = $app['db']->lastInsertId();
    $arCharact = $request->request->get('id_name_ch');
    $arCharactValue = $request->request->get('value');

    Polytech::pushChByItemId($id_item, $arCharact, $arCharactValue);

    return $app->redirect($app['url_generator']->generate('admin.view', array('id_item' => $id_item), array('id_type' => $id_type), array('id_provider' => $id_provider), array('id_cab' => $id_cab), array('id_user' => $id_user)
    ));
});

$app->get('/admin/item/update', function () use ($app) {
    $post = $app['request'];

    $id_item = $post->get('id_item'); 

    $items = Current::getMainByItemId($id_item);

    $types = DropDownList::getType();
    $cur_type = Current::getTypeByItemId($id_item);

    $providers = DropDownList::getProvider();
    $cur_provider = Current::getProviderByItemId($id_item);

    $cabs = DropDownList::getCab();
    $cur_cab = Current::getCabByItemId($id_item);

    $users = DropDownList::getUsersByUserRole();
    $cur_user = Current::getUserByItemId($id_item);

    $chs = DropDownList::getChByItemId($id_item);
    $cur_ch = Current::getChValByItemId($id_item);
var_dump($chs);

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! взять отсюда
    $token = $app['security']->getToken();
    if (null !== $token) {
        $user['id'] = $token->getUser()->getId();
    }
//===============================================================
    return $app['twig']->render('admin.update.twig', ['id_item' => $id_item,
                'items' => $items,
                'types' => $types,
                'cur_type' => $cur_type,
                'providers' => $providers,
                'cur_provider' => $cur_provider,
                'cabs' => $cabs,
                'cur_cab' => $cur_cab,
                'users' => $users,
                'cur_user' => $cur_user,
                'chs' => $chs,
                'cur_ch' => $cur_ch
    ]);
})->bind('admin.update');

$app->post('/admin/item/update', function() use ($app) {
    $request = $app['request'];
    
    $id_item = $request->query->get('id_item');  
    $inv_num = $request->request->get('inv_num');
    $id_type = $request->request->get('id_type');
    $id_provider = $request->request->get('id_provider');
    $id_cab = $request->request->get('id_cab');
    $id_user = $request->request->get('id_user');
    $price = $request->request->get('price');
    
    $sql = "UPDATE item SET inv_num = ?, id_type = ?, id_provider = ?, id_cab = ?, id_user = ?, price = ? WHERE id_item = ?";
        $app['db']->executeUpdate($sql, array($inv_num, $id_type, $id_provider, $id_cab, $id_user, $price, $id_item));
    
    $arCharact = $request->request->get('id_name_ch');
    $arCharactValue = $request->request->get('value');

    /**foreach ($arCharact as $chKey => $chItem) {
        $conn->insert('ch', ['id_matworth' => $id_matworth,
            'id_name_ch' => $chItem,
            'value' => $arCharactValue[$chKey]]);
    }
**/
    return $app->redirect($app['url_generator']->generate('admin.view', array('id_item' => $id_item)));
});

$app->get('/admin/item/view', function () use ($app) {
    $post = $app['request'];
    $id_item = $post->get('id_item');

    $data['items'] = Polytech::getItemsByItemId($id_item);
    $data['chs'] = Polytech::getChByItemId($id_item);

    return $app['twig']->render('admin.view.twig', ['items' => $data['items'],
                'chs' => $data['chs']]);
})->bind('admin.view');



$app->post('/admin/item/delete', function() use ($app) {
    $post = $app['request'];
    $id_item = $post->get('id_item');

    Polytech::delItem($id_item);
    return $app->redirect($app['url_generator']->generate('admin.items'));
})->bind('admin.delete');

