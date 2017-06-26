<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ page import="constantes.constantesClass"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ActiWeb - portal de ejercicios</title>
 
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
      $("#includedContent").load("<%=constantesClass.urlRaiz%>menuProfe.jsp"); 
    });
    </script> 

    <%
        if((session.getAttribute("TIPOUSUARIO")==null)||(!session.getAttribute("TIPOUSUARIO").toString().equals("PROFESOR"))){
            response.sendRedirect("/ActiLinev1");
        }
    %>

<div class="container">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>Seleccione el tipo de ejercicio deseado.</center></h3>
  </div>
  <div class="panel-body">
    <div class="row">
		<div class="col-md-6"><a href="<%=constantesClass.urlRaiz%>Profesor/Matematicas/DivisionSinSigno/crearDivisionSinSigno.jsp"><center><img src="<%=constantesClass.urlRaiz%>images/001_small.jpg" height="200" alt="Divisi�n Naturales" class="img-thumbnail"><br/>Divisi�n Naturales</center></a></div>
		<div class="col-md-6"><a href="<%=constantesClass.urlRaiz%>Profesor/Matematicas/DivisionConDecimales/crearDivisionDecimalNumerador.jsp"><center><img src="<%=constantesClass.urlRaiz%>images/001_small.jpg" height="200" alt="Divisi�n con decimales en dividendo" class="img-thumbnail"><br/>Divisi�n con decimales en dividendo</center></a></div>
	</div>
	<div class="row">
		<div class="col-md-6"><a href="<%=constantesClass.urlRaiz%>Profesor/Matematicas/DivisionConDecimales/crearDivisionDecimalDenominador.jsp"><center><img src="<%=constantesClass.urlRaiz%>images/001_small.jpg" height="200" alt="Divisi�n con decimales en dividendo" class="img-thumbnail"><br/>Divisi�n con decimales en dividendo</center></a></div>
		<div class="col-md-6"><a href="<%=constantesClass.urlRaiz%>Profesor/Matematicas/DivisionConDecimales/crearDivisionDecimalAmbos.jsp"><center><img src="<%=constantesClass.urlRaiz%>images/001_small.jpg" height="200" alt="Divisi�n con decimales en dividendo y divisor" class="img-thumbnail"><br/>Divisi�n con decimales en dividendo y divisor</center></a></div>
	</div>
  </div>
</div>
<div class="panel panel-primary">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
			<center><a href="#">Acerca de</a></center>
			<center><a href="https://twitter.com/ActiWeb" class="twitter-follow-button" data-show-count="false">Follow @ActiWeb</a></center>
                        <center><div class="fb-follow" data-href="https://www.facebook.com/zuck" data-layout="button" data-show-faces="false"></div></center>
			</div>
	</div>
  </div>
</div>
</div>


	

	
	
    <!-- Todos los plugins JavaScript de Bootstrap (tambi�n puedes
         incluir archivos JavaScript individuales de los �nicos
         plugins que utilices) -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
