<?php

class Current {
    
    static public function getMainByItemId($id_item) {
        global $app;
        $sql = 'SELECT inv_num, price FROM main_view WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
   
    static public function getTypeByItemId($id_item) {
        global $app;
        $sql = 'SELECT type.id_type, type.name_type FROM item INNER JOIN type ON item.id_type = type.id_type  WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
    
    static public function getProviderByItemId($id_item) {
        global $app;
        $sql = 'SELECT provider.id_provider, provider.name_provider FROM item INNER JOIN provider ON item.id_provider = provider.id_provider  WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
    
    static public function getCabByItemId($id_item) {
        global $app;
        $sql = 'SELECT cab.id_cab, cab.num_cab FROM item INNER JOIN cab ON item.id_cab = cab.id_cab  WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
    
    static public function getUserByItemId($id_item) {
        global $app;
        $sql = 'SELECT users.id, users.name FROM item INNER JOIN users ON item.id_user = users.id  WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
    
    static public function getChValByItemId($id_item) {
        global $app;
        $sql = 'SELECT ch.id_name_ch, ch.value, name_ch.name_ch FROM ch INNER JOIN name_ch ON ch.id_name_ch = name_ch.id_name_ch WHERE ch.id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
    
    
}
