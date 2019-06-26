<?php

use Phalcon\Mvc\Model;

class Product extends Model
{
    /**
     * @var integer
     */
    public $id_product;

    /**
     * @var string
     */
    public $name;

    /**
     * @var integer
     */
    public $quantity;

    /**
     * @var integer
     */
    public $price;

    /**
     * @var string
     */
    public $date;

    /**
     * @var integer
     */
    public $lote_number;

}
