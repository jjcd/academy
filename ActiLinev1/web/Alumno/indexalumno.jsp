<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ page import="constantes.constantesClass" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ActiWeb - Portal de ejercicios</title>
 
    <!-- CSS de Bootstrap -->
    <link href="<%=constantesClass.urlRaiz%>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
 
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
      $("#includedContent").load("<%=constantesClass.urlRaiz%>menualumno.jsp"); 
    });
    </script> 
	
	<div class="container">
	<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>ActiWeb</center></h3>
  </div>
  <div class="panel-body">
    <center>Bienvenido a ActiWeb, en modo alumno, esta secci�n le permitir� realizar actividades, as� como consultar su realizaci�n y comparar con el resultado, para realizar cualquier actividad pulse en el men�.</center>
  </div>
</div>

<div class="panel panel-primary">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
			<center><a href="#">Acerca de</a></center>
			<center><a href="https://twitter.com/ActiWeb" class="twitter-follow-button" data-show-count="false">Follow @ActiWeb</a></center>
			<div class="fb-follow" data-href="https://www.facebook.com/zuck" data-layout="button" data-show-faces="false"></div>
			</div>
	</div>
  </div>
</div>
</div>
	

	
	
    <!-- Todos los plugins JavaScript de Bootstrap (tambi�n puedes
         incluir archivos JavaScript individuales de los �nicos
         plugins que utilices) -->
    <script src="<%=constantesClass.urlRaiz%>bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>