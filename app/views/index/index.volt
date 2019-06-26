<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
</head>

<body class="">

    <div class="wrapper ">
        <div class="sidebar" data-color="purple" data-background-color="white" >
            <div class="logo">
                <center><label>PRUEBA BRM</label><center>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{url('index')}}">
                            <p>Productos proveedor</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('index/product')}}">
                            <p>Compra productos</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('index/inventory')}}">
                            <p>Inventario</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="main-panel">
            <div class="col-md-10 col-md-offset-1 main">
                {{ flash.output() }}
            </div>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-info">
                                    <h4 class="card-title">Productos Proveedor</h4>
                                </div>
                                <div class="card-body">
                                {{ form("index/newProduct", "method":"post", 'enctype': 'multipart/form-data') }}                           
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="bmd-label-floating"><b>Entrega de productos por proveedor:</b></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label class="bmd-label-floating">Producto</label>
                                            <input type="text" id='product' name='product' class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label class="bmd-label-floating">Numero de lote</label>
                                            <input type="number" id='lote' name='lote' class="form-control" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label class="bmd-label-floating">Cantidad</label>
                                            <input type="number" id='quantity' name='quantity' class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label class="bmd-label-floating">Precio</label>
                                            <input type="number" id='price' name='price' class="form-control" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label class="bmd-label-floating">Fecha</label>
                                            <input type="date" id='date' name='date' class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-lg-offset-9 col-md-offset-9">
                                        <div class="nav-tabs-navigation">
                                            <div class="nav-tabs-wrapper">
                                                <ul class="nav nav-tabs pull-right" data-tabs="tabs">
                                                    <li class="nav-item">
                                                        <button type="submit" class="nav-link">
                                                            Agregar inventario
                                                        </button>   
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                {{ end_form() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>