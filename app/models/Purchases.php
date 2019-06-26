<?php

use Phalcon\Mvc\Model;

class Purchases extends Model
{
    /**
     * @var integer
     */
    public $id_purchase;

    /**
     * @var integer
     */
    public $id_product;

    /**
     * @var integer
     */
    public $quantity;

    /**
     * @var integer
     */
    public $total;

    /**
     * @var boolean
     */
    public $check;

}
