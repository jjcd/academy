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
         List<EjercicioClass> listaEjs2 = new ArrayList<EjercicioClass>();
         List<EjercicioClass> listaEjs3 = new ArrayList<EjercicioClass>();
         List<EjercicioClass> listaEjs4 = new ArrayList<EjercicioClass>();
         
         
         if((request.getAttribute("listaEjerciciosSS")!=null)&&(request.getAttribute("listaEjerciciosDN")!=null)&&(request.getAttribute("listaEjerciciosDD")!=null)&&(request.getAttribute("listaEjerciciosDAM")!=null)){
             listaEjs = (List<EjercicioClass>)request.getAttribute("listaEjerciciosSS");
             listaEjs2 = (List<EjercicioClass>)request.getAttribute("listaEjerciciosDN");
             listaEjs3 = (List<EjercicioClass>)request.getAttribute("listaEjerciciosDD");
             listaEjs4 = (List<EjercicioClass>)request.getAttribute("listaEjerciciosDAM"); 
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
    
    <script type = "text/javascript">

    var formEnviar = "";

    $( document ).ready(function() {
        $('#submit').click(function(){
            $("#"+ formEnviar).submit();
        }); 
        

    });
    
    function clickEliminar(form){
        formEnviar = form;
    }

 
    </script>
    
     
	

<div class="container">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>Seleccione el ejercicio de matemáticas deseado.</center></h3>
  </div>
  <div class="panel-body">
    <ul class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(EjercicioClass ec : listaEjs){%>
        <form action="<%=constantesClass.urlRaiz%>eliminarDivision" id="form<%=ec.getId()%>">
            <input type="hidden" value="<%=ec.getId()%>" name="idDivision" id="idDivision"/>            
            <li class="list-group-item"><input type="button" name="btn" value="<%=ec.getValor()%>" id="submitBtn" data-toggle="modal" data-target="#confirm-submit" class="btn btn-default" onclick="clickEliminar('form<%=ec.getId()%>')"/> <span><img src="<%=constantesClass.urlRaiz%>bootstrap/paperbin.png"/></span></li>

        </form>
        <%}%>
        
    </ul> 
  </div>
        
  <div class="panel-body">
    <ul class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(EjercicioClass ec : listaEjs2){%>
        <form action="<%=constantesClass.urlRaiz%>eliminarDivision" id="form<%=ec.getId()%>">
            <input type="hidden" value="<%=ec.getId()%>" name="idDivision" id="idDivision"/>            
            <li class="list-group-item"><input type="button" name="btn" value="<%=ec.getValor()%>" id="submitBtn" data-toggle="modal" data-target="#confirm-submit" class="btn btn-default" onclick="clickEliminar('form<%=ec.getId()%>')"/> <span><img src="<%=constantesClass.urlRaiz%>bootstrap/paperbin.png"/></span></li>

        </form>
        <%}%>
        
    </ul> 
  </div>
        
  <div class="panel-body">
    <ul class="list-group">
        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(EjercicioClass ec : listaEjs3){%>
        <form action="<%=constantesClass.urlRaiz%>eliminarDivision" id="form<%=ec.getId()%>">
            <input type="hidden" value="<%=ec.getId()%>" name="idDivision" id="idDivision"/>            
            <li class="list-group-item"><input type="button" name="btn" value="<%=ec.getValor()%>" id="submitBtn" data-toggle="modal" data-target="#confirm-submit" class="btn btn-default" onclick="clickEliminar('form<%=ec.getId()%>')"/> <span><img src="<%=constantesClass.urlRaiz%>bootstrap/paperbin.png"/></span></li>

        </form>
        <%}%>
        
    </ul> 


  </div>
        
  <div class="panel-body">
      
       <ul class="list-group">
            

 
      

        
        <%-- Aqui la enumeracion recogida de bd --%>
       <%for(EjercicioClass ec : listaEjs4){%>
       
        <form action="<%=constantesClass.urlRaiz%>eliminarDivision" id="form<%=ec.getId()%>">
            <input type="hidden" value="<%=ec.getId()%>" name="idDivision" id="idDivision"/>            
            <li class="list-group-item"><input type="button" name="btn" value="<%=ec.getValor()%>" id="submitBtn" data-toggle="modal" data-target="#confirm-submit" class="btn btn-default" onclick="clickEliminar('form<%=ec.getId()%>')"/> <span><img src="<%=constantesClass.urlRaiz%>bootstrap/paperbin.png"/></span></li>

        </form>
            
        <%}%>
        
      

        </ul>
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


	
<div class="modal fade" id="confirm-submit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                Confirmar borrado:
            </div>
            <div class="modal-body">
                ¿Desea realmente borrar permanentemente la siguiente división junto a los ejercicios realizados por los alumnos?
                <table class="table">
                    <tr>
                        <th>Dividendo</th>
                        <td id="ldividendo"></td>
                    </tr>
                    <tr>
                        <th>Divisor</th>
                        <td id="ldivisor"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <a href="#" id="submit" class="btn btn-success success">Borrar</a>
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
