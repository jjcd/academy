<!DOCTYPE html>
<html lang="en">
  <head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ page import="constantes.constantesClass" %>
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
        
        //Para controlar que todo este bien
        $(document).ready(function() {
            
            $("#formEnviar").submit(function(e){
                
            var dividendoString = $("#dividendo").val();
            var divisorString = $("#divisor").val();
            var dividendoArray = dividendoString.split(',');
            var divisorArray = divisorString.split(',');
            
            if((dividendoString!="")&&(divisorString!="")&&(dividendoArray.length === 2)&&(divisorArray.length === 2)&&(comprobarArrayNumeros(dividendoArray))&&(comprobarArrayNumeros(divisorArray))&&( (parseFloat(dividendoString.replace(",", "."))) >= (parseFloat(divisorString.replace(",", ".")))  )){
                $("#decimalesDividendo").val(dividendoArray[1].length);
                $("#decimalesDivisor").val(divisorArray[1].length);                                    
            }
            else
            {
                $('#myModal').modal('show');
            
                e.preventDefault(e);
            }
                
            });
        });
        
        function comprobarArrayNumeros(array)
        {
            var sonNumeros = true;
            
            for(var i=0;i<array.length;i++){
                if(isNaN(array[i])){
                    sonNumeros = false;
                }
            }
            
            return sonNumeros;
        }
        
    </script> 
	

<div class="container">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>Introduzca divisor y dividendo (ambos con decimales, usar la coma "," ).</center></h3>
  </div>
  <div class="panel-body">
  
  <form id="formEnviar" onsubmit="" method="GET" action="<%=constantesClass.urlRaiz%>guardarDivisionDecAmbosProfesor">
  <div class="form-group">
    <label for="number">Dividendo:</label>
    <input type="text" class="form-control" id="dividendo" name="dividendo" maxlength="9">
  </div>
  
  <div class="form-group">
    <label for="number">Divisor</label>
    <input type="text" class="form-control" id="divisor" name="divisor" maxlength="5">
  </div>

  <input type="hidden" class="form-control" id="decimalesDividendo" name="decimalesDividendo">
  <input type="hidden" class="form-control" id="decimalesDivisor" name="decimalesDivisor">
  
  <center><button type="submit" class="btn btn-default" id="btnCalcular">Calcular</button></center>
</form>
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
    
  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title">Error en los valores introducidos.</h4>
      </div>
      <div class="modal-body" id="modal-body">
          <p>Por favor, introduzca ambos números válidos con decimales (Ejemplo 23,241).<br/></br>El valor del dividendo debe ser mayor que el del divisor.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>

  </div>
  </div>
    
  </body>
</html>