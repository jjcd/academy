<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.List" %>
<%@ page import="classes.DivisionClass" %>
<%@ page import="constantes.constantesClass" %>
  <head>
     <%@ page import="constantes.constantesClass" %>
     <%-- Recogida de los ejercicios --%>
    <%
        if((session.getAttribute("TIPOUSUARIO")==null)||(!session.getAttribute("TIPOUSUARIO").toString().equals("PROFESOR"))){
            response.sendRedirect("/ActiLinev1");
        }
    %>
     <%
         List<DivisionClass> listaEjs = new ArrayList<DivisionClass>();
         List<DivisionClass> listaEjs2 = new ArrayList<DivisionClass>();
         List<DivisionClass> listaEjs3 = new ArrayList<DivisionClass>();
         
         if((request.getAttribute("listaEjerciciosResueltos")!=null)&&(request.getAttribute("listaEjerciciosResueltos2")!=null)){
             listaEjs = (List<DivisionClass>)request.getAttribute("listaEjerciciosResueltos");
             listaEjs2 = (List<DivisionClass>)request.getAttribute("listaEjerciciosResueltos2");
             listaEjs3 = (List<DivisionClass>)request.getAttribute("listaEjerciciosResueltos3");
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
      $("#includedContent").load("<%=constantesClass.urlRaiz%>menuProfe.jsp"); 
    });
    </script> 
	

<div class="container">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>Seleccione el ejercicio de matemáticas deseado.</center></h3>
  </div>
  <div class="panel-body">
    <div>Divisiones con número de decimales igual en dividendo que en divisor:</div>
    <div class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(DivisionClass dc : listaEjs){
           String valor = dc.getValor();
           String sol = dc.getSolucion();
           
           String decimales = sol.split(":")[sol.split(":").length-1];
           
           //vamos a comprobar cuantos decimales tenemos y a partir de ahí
           //cortamos el dividemos y ponemos los decimales al divisor
           int decimalesInt = Integer.parseInt(decimales);
           
           //guardamos dividendo y divisor
           String dividendo = valor.split(":")[0];
           String divisor = valor.split(":")[1];
           
           //dividendo = dividendo.substring(0, dividendo.length() - decimalesInt);
           dividendo = dividendo.substring(0, dividendo.length() - decimalesInt) + "," + dividendo.substring(dividendo.length() - decimalesInt, dividendo.length());
           divisor = divisor.substring(0, divisor.length() - decimalesInt) + "," + divisor.substring(divisor.length() - decimalesInt, divisor.length());
       %>
            <a href="<%=constantesClass.urlRaiz%>generarRevisionDivisionDAI?valor=<%=dc.getValor()%>&solucion=<%=dc.getSolucion()%>&solucionusuario=<%=dc.getSolucionUsuario()%>"><button type="button" class="list-group-item list-group-item-action"><%=dividendo%> : <%=divisor%> | usuario: <%=dc.getUsuario()%></button></a>
        <%}%>
        
      

    </div>
  </div>
        
  <div class="panel-body">
    <div>Divisiones con número de decimales mayor en dividendo que en divisor:</div>
    <div class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(DivisionClass dc : listaEjs2){
           String valor = dc.getValor();
           String sol = dc.getSolucion();
           
           String decimalesDivd = sol.split(":")[sol.split(":").length-2];
           String decimalesDivs = sol.split(":")[sol.split(":").length-1];
           
           //vamos a comprobar cuantos decimales tenemos y a partir de ahí
           //cortamos el dividemos y ponemos los decimales al divisor
           int decimalesDivdInt = Integer.parseInt(decimalesDivd);
           int decimalesDivsInt = Integer.parseInt(decimalesDivs);
           
           //guardamos dividendo y divisor
           String dividendo = valor.split(":")[0];
           String divisor = valor.split(":")[1];
           
           //dividendo = dividendo.substring(0, dividendo.length() - decimalesInt);
           dividendo = dividendo.substring(0, dividendo.length() - decimalesDivdInt) + "," + dividendo.substring(dividendo.length() - decimalesDivdInt, dividendo.length());
           divisor = divisor.substring(0, divisor.length() - decimalesDivsInt) + "," + divisor.substring(divisor.length() - decimalesDivsInt, divisor.length());
       %>
            <a href="<%=constantesClass.urlRaiz%>generarRevisionDivisionDAMY?valor=<%=dc.getValor()%>&solucion=<%=dc.getSolucion()%>&solucionusuario=<%=dc.getSolucionUsuario()%>"><button type="button" class="list-group-item list-group-item-action"><%=dividendo%> : <%=divisor%> | usuario: <%=dc.getUsuario()%></button></a>
        <%}%>
        
      

    </div>
  </div>        

  <div class="panel-body">
      
    <div>Divisiones con número de decimales menor en dividendo que en divisor:</div>
    <div class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(DivisionClass dc : listaEjs3){
           String valor = dc.getValor();
           String sol = dc.getSolucion();
           
           String decimalesDivd = sol.split(":")[sol.split(":").length-2];
           String decimalesDivs = sol.split(":")[sol.split(":").length-1];
           
           //vamos a comprobar cuantos decimales tenemos y a partir de ahí
           //cortamos el dividemos y ponemos los decimales al divisor
           int decimalesDivdInt = Integer.parseInt(decimalesDivd);
           int decimalesDivsInt = Integer.parseInt(decimalesDivs);
           
           //guardamos dividendo y divisor
           String dividendo = valor.split(":")[0];
           String divisor = valor.split(":")[1];
           
           //dividendo = dividendo.substring(0, dividendo.length() - decimalesInt);
           dividendo = dividendo.substring(0, dividendo.length() - decimalesDivdInt) + "," + dividendo.substring(dividendo.length() - (decimalesDivdInt+1), dividendo.length()-1);
           divisor = divisor.substring(0, divisor.length() - decimalesDivsInt) + "," + divisor.substring(divisor.length() - decimalesDivsInt, divisor.length());
       %>
            <a href="<%=constantesClass.urlRaiz%>generarRevisionDivisionDAMN?valor=<%=dc.getValor()%>&solucion=<%=dc.getSolucion()%>&solucionusuario=<%=dc.getSolucionUsuario()%>"><button type="button" class="list-group-item list-group-item-action"><%=dividendo%> : <%=divisor%> | usuario: <%=dc.getUsuario()%></button></a>
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
