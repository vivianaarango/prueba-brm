<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="../css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
</head>

<body class="">

    <div class="wrapper ">
        <div class="sidebar" data-color="purple" data-background-color="white" >
            <div class="logo">
                <center><label>PRUEBA BRM</label><center>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('index')}}">
                            <p>Productos proveedor</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('index/product')}}">
                            <p>Compra productos</p>
                        </a>
                    </li>
                    <li class="nav-item active">
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
                       <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-info">
                                <h4 class="card-title">Compras {{ product.name }}</h4>
                                <p class="card-category"></p>
                            </div>
                            <div class="card-body table-responsive">
                                <table class="table table-hover">
                                    <thead class="text-info">
                                        <th>Cantidad</th>
                                        <th>Precio total</th>
                                        <th>Cancelar</th>
                                        <th>Factura</th>
                                    </thead>
                                    <tbody>
                                        {% for item in purchases %}
                                            <tr>
                                                <td>{{ item.quantity }}</td>
                                                <td>{{ item.total }}</td> 
                                                <td>
                                                    {{ form('index/cancel', 'role': 'form') }}
                                                        <input type='hidden' name='id_purchase' id='id_purchase' value={{ item.id_purchase }}>
                                                        <button class="nav-link options" type='submit'>
                                                            <i  style='color: #456168;' class="material-icons">delete_sweep</i>
                                                        </button>
                                                    {{ end_form() }} 
                                                </td>  
                                                <td>
                                                    {{ form('index/invoice', 'role': 'form') }}
                                                        <input type='hidden' name='id_purchase1' id='id_purchase1' value={{ item.id_purchase }}>
                                                        <button class="nav-link options" type='submit'>
                                                            <i  style='color: #456168;' class="material-icons">visibility</i>
                                                        </button>
                                                    {{ end_form() }} 
                                                </td>                                             
                                            </tr>
                                        {% endfor %}
                                    </tbody>
                                </table>
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