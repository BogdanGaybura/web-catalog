<?php

class Polytech {
    static public function getItemsList() {
        global $app;
        $sql = 'SELECT id_item, inv_num, user_name, name_provider, num_cab FROM main_view';
        $result = $app['db']->fetchAll($sql);
        return $result;
    }
        
    static public function pushChByItemId($id_item, $arCharact, $arCharactValue) {
        global $app;
        
        foreach ($arCharact as $chKey => $chItem) {      
        
        $app['db']->insert('ch', ['id_item' => $id_item,
                                  'id_name_ch' => $chItem,
                                  'value' => $arCharactValue[$chKey]]);
        }  
    }
     
     
    
static public function getChByItemId($id_item) {
        global $app;
        $sql = 'SELECT * FROM ch_full WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, array((int) $id_item));
        return $result;
    }
    
    
    static public function getItemsByItemId($id_item) {
        global $app;
        $sql = 'SELECT * FROM main_view WHERE id_item = ?';
        $result = $app['db']->fetchAll($sql, array((int) $id_item));
        return $result;
    }
    
    static public function delItem($id_item) {
        global $app;      
        $app['db']->delete('item', ['id_item' => $id_item]);
        $app['db']->delete('ch', ['id_item' => $id_item]);
    }
    
    static public function updateMainFieldsByItemId($id_item, $inv_num, $id_type, $id_provider, $id_cab, $id_user, $price) {
        global $app;
        $sql = "UPDATE item SET inv_num = ?, id_type = ?, id_provider = ?, id_cab = ?, id_user = ?, price = ? WHERE id_item = ?";
        $app['db']->executeUpdate($sql, array($inv_num, $id_type, $id_provider, $id_cab, $id_user, $price, $id_item));
    }

    }

