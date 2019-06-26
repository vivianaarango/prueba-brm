<?php

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Prueba BRM');
    }

    public function indexAction()
    {   
        
    }

    public function newProductAction()
    {
        if ($this->request->isPost()){ 

            $product = new Product;
            $product->name = $_POST["product"];
            $product->quantity = $_POST["quantity"];
            $product->price = $_POST["price"];
            $product->lote_number = $_POST["lote"];
            $product->expired_date = $_POST["date"];

            if ($product->save()) {
                $this->flash->success('Se ha agregado al inventario');
                return $this->response->redirect("index");
            }
        }
    }

    public function productAction(){
        $products = Product::find(array(
            "order" => "name ASC"
        ));

        $this->view->products = $products;
    }


    public function buyProductAction()
    {
        if ($this->request->isPost()){ 

            $post = $this->request->getPost();

            $product = Product::findFirst($post['products']);
     
            if ($product->quantity < $post['quantity']){
                $this->flash->error('Solo tenemos '.$product->quantity.' unidades de este producto');
                return $this->response->redirect("index/product");
            } else {
                $product->quantity = $product->quantity-$post['quantity'];
                $price = $post['quantity']*$product->price;

                $purchase = new Purchases;
                $purchase->id_product = $post['products'];
                $purchase->quantity = $post['quantity'];
                $purchase->total = $price;
                $purchase->check = false;

                if ($product->save() && $purchase->save()) {
                    $this->flash->success('Se ha realizado la compra. El total es de $ '.$price);
                    return $this->response->redirect("index/product");
                }
            }
        }
    }

    public function inventoryAction()
    {
        $products = Product::find(array(
            "order" => "name ASC"
        ));

        $this->view->products = $products;

    }

    public function purchasesAction()
    {
        if ($this->request->isPost()){ 

            $post = $this->request->getPost();
            $product = Product::findFirst($post['id']);

            $purchase = Purchases::find(array(
                "conditions" => "id_product = ?1 and check = false",
                "bind" => array(1 => $post['id'])
            ));

            $this->view->purchases = $purchase;
            $this->view->product = $product;
        }
    }

    public function cancelAction()
    {
        if ($this->request->isPost()){ 

            $post = $this->request->getPost();
            $purchase = Purchases::findFirst($post['id_purchase']);

            if (isset($purchase->id_product)){
                $product = Product::findFirst($purchase->id_product);
                $product->quantity = $product->quantity+$purchase->quantity;
                $purchase->check = true;
                
                if ($product->save() && $purchase->save()){
                    $this->flash->success('Se ha cancelado la compra.');
                    return $this->response->redirect("index/inventory");
                }
            }
        }
    }

    public function invoiceAction()
    {
        if ($this->request->isPost()){ 

            $post = $this->request->getPost();
            $purchase = Purchases::findFirst($post['id_purchase1']);

            if (isset($purchase->id_product)){
                $product = Product::findFirst($purchase->id_product);
                
                $this->view->purchases = $purchase;
                $this->view->product = $product;     
            }
        }
    }

   
}
