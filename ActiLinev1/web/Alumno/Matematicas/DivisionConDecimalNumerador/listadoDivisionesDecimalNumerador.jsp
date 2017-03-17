<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.List" %>
<%@ page import="classes.EjercicioClass" %>
<%@ page import="constantes.constantesClass" %>
  <head>
     <%@ page import="constantes.constantesClass" %>
     <%-- Recogida de los ejercicios --%>

     <%
         List<EjercicioClass> listaEjs = new ArrayList<EjercicioClass>();
         
         if(request.getAttribute("listaEjercicios")!=null){
             listaEjs = (List<EjercicioClass>)request.getAttribute("listaEjercicios");
             
         }
     
     %>
      
      
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ActiWeb - portal de ejercicios</title>
 
    <!-- CSS de Bootstrap -->
    <link href="<%=constantesClass.urlRaiz%>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
 
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div id="includedContent"></div>
 
    <!-- Librería jQuery requerida por los plugins de JavaScript -->
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
    <h3 class="panel-title"><center>Seleccione el ejercicio de matemáticas deseado.</center></h3>
  </div>
  <div class="panel-body">
    <div class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(EjercicioClass ec : listaEjs){%>
       <a href="<%=ec.getWeb()%>"><button type="button" class="list-group-item list-group-item-action"><%=ec.getValor()%></button></a>
        <%}%>
        
      

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


	

	
	
    <!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
    <script src="<%=constantesClass.urlRaiz%>bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
