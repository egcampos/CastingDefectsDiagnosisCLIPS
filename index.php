<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Casting Defects Diagnosis</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="css/creative.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Casting Defects Diagnosis</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#services">Cavidades</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Discontinuidades</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="col-lg-4 col-lg-offset-1">
                <h2 class="section-heading">Descripción de la Cavidad</h2>
                <hr class="primary">
                <form class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label for="select" class="col-lg-6 control-label">Aspecto de la Superficie</label>
                            <div class="col-lg-6">
                                <select multiple="" class="form-control">
                                    <option>Liso</option>
                                    <option>Dentritico</option>
                                    <option>Rugoso</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="col-lg-6 control-label">Color</label>
                            <div class="col-lg-6">
                                <select multiple="" class="form-control">
                                    <option>Negruzco</option>
                                    <option>Amarronado</option>
                                    <option>Rojizo</option>
                                    <option>Dorado</option>
                                    <option>Plateado</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="col-lg-6 control-label">Acabado de la Superficie</label>
                            <div class="col-lg-6">
                                <select class="form-control" id="select">
                                    <option>Mate</option>
                                    <option>Brillante</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="col-lg-6 control-label">Forma</label>
                            <div class="col-lg-6">
                                <select class="form-control" id="select">
                                    <option>Irregular alargada</option>
                                    <option>Irregular redonda</option>
                                    <option>Irregular cuadrada</option>
                                    <option>Cilíndrica alargada</option>
                                    <option>Cilíndrica corta</option>
                                    <option>Cónica</option>
                                    <option>Esférica</option>
                                    <option>Redondeada</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="col-lg-6 control-label">Tamaño</label>
                            <div class="col-lg-6">
                                <select class="form-control" id="select">
                                    <option>Pequeño</option>
                                    <option>Mediano</option>
                                    <option>Grande</option>
                                    <option>Muy grande</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button type="reset" class="btn btn-default">Reset</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="col-lg-4 col-lg-offset-2 text-center">
                <h2 class="section-heading">Diagnóstico</h2>
                <hr class="primary">
                <?php
                require_once('./model/cdd_engine.php');
                $result = cdd_engine::getDiagnosticoDiscontinuidad();
                echo '<p>' . $result . '</p>'
                ?>
            </div>
        </div>
    </header>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>


</body>

</html>
