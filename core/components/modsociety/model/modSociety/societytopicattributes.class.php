<?php
class SocietyTopicAttributes extends xPDOSimpleObject {
    
    public function save($cacheFlag = NULL){
        if(!$this->get('resourceid')){
            $this->xpdo->log(xPDO::LOG_LEVEL_ERROR, "Resource ID is null");
            return false;
        }
        return parent::save($cacheFlag);
    }
}