<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Plantilla b�sica de Bootstrap</title>
 
    <!-- CSS de Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librer�as opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div id="includedContent"></div>
 
    <!-- Librer�a jQuery requerida por los plugins de JavaScript -->
    <script src="http://code.jquery.com/jquery.js">
	
	</script>
	
	<script> 
    $(function(){
      $("#includedContent").load("menu.html"); 
    });
    </script> 
	
	<div class="container">
	<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>ActiWeb</center></h3>
  </div>
  <div class="panel-body">
    <center>Bienvenido a ActiWeb, en modo profesor, esta secci�n le permitir� ingresar actividades, as� como modificar o eliminar alguna de ellas, para acceder a alguna de estas opciones, ingrese desde el men�.</center>
  </div>
</div>
</div>
	

	
	
    <!-- Todos los plugins JavaScript de Bootstrap (tambi�n puedes
         incluir archivos JavaScript individuales de los �nicos
         plugins que utilices) -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>