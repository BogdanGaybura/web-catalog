<?php

class DropDownList {
    
    static public function getUsersByUserRole() {
        global $app;
        $sql = 'SELECT id, name FROM users WHERE roles = "ROLE_USER"';
        $result = $app['db']->fetchAll($sql);
        return $result;
    }
    
     static public function getProvider() {
        global $app;
        $sql = 'SELECT * FROM provider';
        $result = $app['db']->fetchAll($sql);
        return $result;
    }
    
    static public function getCab() {
        global $app;
        $sql = 'SELECT id_cab, num_cab FROM cab';
        $result = $app['db']->fetchAll($sql);
        return $result;
    }
    
    static public function getType() {
        global $app;
        $sql = 'SELECT * FROM type';
        $result = $app['db']->fetchAll($sql);
        return $result;
    }
    
    static public function getChByItemId($id_item) {
        global $app;
        $sql = 'SELECT ch.id_name_ch, name_ch.name_ch FROM ch INNER JOIN name_ch ON ch.id_name_ch = name_ch.id_name_ch WHERE ch.id_item = ?';
        $result = $app['db']->fetchAll($sql, [$id_item]);
        return $result;
    }
    
    static public function getNameChByIdType($id_type) {
        global $app;
        $sql = 'SELECT name_ch.id_name_ch, name_ch.name_ch FROM name_ch INNER JOIN type ON type.id_type = name_ch.id_type WHERE type.id_type = ?';
        $result = $app['db']->fetchAssoc($sql, array((int) $id_type ));
        
        $array = array();
	$i = 0;
	while ($row = $result) {
		$array[$i]['id_name_ch'] = $row['id_name_ch'];		
		$array[$i]['name_ch'] = $row['name_ch'];
		$i++;
	}
	return $array;
    }
}
