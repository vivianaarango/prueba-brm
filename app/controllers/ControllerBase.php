<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    
    protected function initialize()
    {
        $this->tag->prependTitle('PRUEBA | ');
        $this->view->setTemplateAfter('BRM');
    }
}
