<%-- 
    Document   : solucionDivision
    Created on : 09-oct-2016, 22:28:43
    Author     : JUAN JOSE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="constantes.constantesClass" %>

<!DOCTYPE html>
<html lang="en">
  <head>
      <style>
        input[type="text"]
        {
            font-size:14px;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-weight: 700;
        }
      </style>
      
    <%
        if(session.getAttribute("TIPOUSUARIO")==null){
            response.sendRedirect("/ActiLinev1");
        }
    %>
    
      <%
            //@SuppressWarnings("unchecked")
            String dividendo = "";
            String divisor = "";
            String cocienteString = "";
            
            String strSol = "";
            String strSolucionComas="";
            String[] dividendoChars = {};
            String solucionConCeros="";
            
            String divisorString = "";
            
            //Para guardar los ceros en formato cadena
            String cerosEnDivision="";
            String decimales="";
            String idDivision = "";
            
            if((request.getAttribute("dividendo")!=null)&&(request.getAttribute("divisor")!=null)&&(request.getAttribute("ceros")!=null)&&(request.getAttribute("decimales")!=null)&&(request.getParameter("idDivision")!=null)){        
                //Recogemos el id que corresponde a la division
                idDivision = request.getParameter("idDivision").toString();
                
                dividendo = request.getAttribute("dividendo").toString();
                decimales = request.getAttribute("decimales").toString();          
                
                //guardar en los atributos nuevamente los decimales, para luego poder ser
                //guardados
                //request.setAttribute("decimales", decimales);
                
                /*Partir el dividendo en diferentes caracteres*/
                dividendoChars = dividendo.split("(?!^)");
                
                /*Fin partir dividendo en distintos*/
                divisor = request.getAttribute("divisor").toString();
                
                /*Crear divisor con decimal*/
                int decimalesInt = Integer.parseInt(decimales);
                int divisorLength = divisor.length();
                
                divisorString = divisor.substring(0, divisorLength - decimalesInt) + "," + divisor.substring(divisorLength - decimalesInt, divisorLength) ;
                
                int cociInt = Integer.parseInt(dividendo) / Integer.parseInt(divisor);
                
                cocienteString = cociInt + "";
               
                List<Integer> ceros = (ArrayList<Integer>) request.getAttribute("ceros");
                
                /*Guardar los ceros en string*/
                for(int cer : ceros){
                    cerosEnDivision += cer + ";";
                }
                
                List<Integer> sol = (ArrayList<Integer>) request.getAttribute("solucion");
                
                
                //Construir solución con ceros
                solucionConCeros = "";
                
                String AnteriorSolucionConCeros = "";
                
                for(int g=0;g<sol.size();g++)
                    {
                        String cerosString = "";
                        if(ceros.size()>g){
                        //generar tantos ceros como vengan del array
                            for(int contceros=0;contceros<ceros.get(g);contceros++){
                                cerosString += "0";
                            }
                        }
                    
                    //Arreglo para el resto    
                    //Si el anterior al resto tiene más de un 0 y el resto tiene
                    //una cifra hay que añadirle un 0 a la izquierda
                    
                    if((sol.size()>2))
                    {
                        //Entramos en el resto en este caso
                        if(AnteriorSolucionConCeros.length()>1){
                            String anadirceros = "";
                            
                            for(int cer=0;cer<AnteriorSolucionConCeros.length()-1;cer++){
                                anadirceros+="0";
                            }

                            cerosString+=anadirceros;
                        }
                    }
                    
                    
                    AnteriorSolucionConCeros = cerosString;
                    //Fin arreglo para el resto
                    
                    cerosString += sol.get(g);
                    
                    solucionConCeros += cerosString + "-";
                }
                
                //Fin construir solución con ceros
                
                int numSol = sol.size();
                strSol = numSol + "";
                strSolucionComas="";
                
                for(Integer in : sol) {
                        strSolucionComas = strSolucionComas + in + ";";
                }
                
                                 
                //Fin cuerpo division
            }
             %>
                
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script src="http://code.jquery.com/jquery.js"></script>
	
    <script> 
        //var contadorPasos = 0;
        $(function(){
            $("#includedContent").load("<%=constantesClass.urlRaiz%>menualumno.jsp"); 
            
            $("#enviarresultado").prop( "disabled", true );
            
            var j = <%=strSol%>;

            //solucionConCeros partido con ;
            var solCerosSplit = "<%=solucionConCeros%>";
            var listaSoluciones = solCerosSplit.split("-");

            var contadorTabulado = 0;
        
            for(var i=0;i<j;i++){
                var solucionActual = listaSoluciones[i];

                strPrimero = "";
                if(i===0){
                    strPrimero = "<input type='text' class='form-control' id='cocienteInput' name='cocienteInput' onkeypress='return isNumberKeyCociente(event)'  maxlength='7'>";
                }

                //Anterior para pintar los input en el cociente
                /*$( "#cuerpoDivision" ).append("<tr><td class='warning' id='comprobacion"+i+
                        "' name='comprobacion"+i+"'><div><input size='1' type='text' class='form-control' id='paso"+i+
                        "' name='paso"+i+"'></div></td><td id='cociente"+i+"' name='cociente"+i+"'>"
                        +strPrimero+"</td></tr>");*/

                var inputs = "";

                var nInputs = <%=dividendoChars.length%>;

                var contAuxPintar = 0;
                var contAuxTab = 0;



                for(var x=0;x<nInputs;x++){
                    //ver hasta cuantos imput hay que poner
                    //inputs+="<div id='cifra"+x+"'>";
                        if((contAuxTab<contadorTabulado)||(contAuxPintar>=solucionActual.length))
                        {
                            
                            inputs += "<input type='text' class='form-control' size='1' style='visibility:hidden;' onkeypress='return isNumberKey(event)' maxlength='1' id='oculto"+x+ i +"i'>";
                            if(x<nInputs-1){
                               inputs += "<span class='input-group-addon' style='visibility:hidden;'></span>";
                            }

                            contAuxTab++;
                        }
                        else
                        {
                            inputs += "<input type='text' class='form-control' size='1' id='paso"+x+ i +"i' onkeypress='return isNumberKey(event)' maxlength='1' id='paso"+x+ i +"i'>";
                            if(x<nInputs-1)
                            {
                               inputs += "<span class='input-group-addon' id='paso"+x+ i + "s'></span>";
                            }

                            contAuxPintar++;
                       }

                     //inputs+="</div>";
                    }

                if(solucionActual.charAt(0)==='0'){
                    contadorTabulado++;
                }

                //Actual para pintar los inputs
                $( "#cuerpoDivision" ).append("<tr>"+
                            "<td class='warning' id='comprobacion"+i+"' name='comprobacion"+i+"'><div class='input-group'>"+ inputs +"</div>"+
                            "</td>"+
                            "<td id='cociente"+i+"' name='cociente"+i+"'>"
                            +strPrimero+"</td>"+
                            "</tr>");

                strPrimero = "";
            }
            
            //quitamos visibilidad a los decimales
            //Primero comprobamos el total de digitos del dividendo
            var dividendoLength = $("[id*='pasoDividendo']").length;
            
            //Una vez que lo tenemos procedemos a realizar el bucle
            var decimalesInt = <%=decimales%>;
            
            //Recorremos inversamente para ir ocultando digitos
            for(var i=0;i<decimalesInt;i++){
                $("[id*='pasoDividendo"+ (dividendoLength - (i+1)) +"']").css("visibility","hidden");
                $("[id*='paso"+ (dividendoLength - (i+1)) +"']").css("visibility","hidden");
            }
            
            $('#myModal').modal('show');
    });
    </script> 
    
    <script type="text/javascript">
    function onClick() {
        
        var strsolucion = "<%=strSolucionComas%>";
        var res = strsolucion.split(";");
        
        var cociInput = "#cociente0";
        var cociValor = "#cocienteInput";
        var cociString = "<%=cocienteString%>";
        var solucionesUsuario = "";
        
        for(h=0;h<res.length;h++){
            if(res[h]!==null&&res[h]!=="")
            {               
               var pasoInput = "#paso" + h;
               var comprobaciontd = "#comprobacion" + h;
               
               //Recuperar y concatenar todos los inputs
               
               //Recuperar y concatenar todos los inputs
               var result = '';
               
               $('#comprobacion'+h+' :input').each(function() {
                    result += $(this).val();
               });
               
               //guardamos la solucion del usuario separando con ;
               solucionesUsuario = solucionesUsuario + result + ";";
               
               //Eliminamos ceros (da igual donde estén la sustitución en ambos
               //resultados debe ser igual
               
               var solucionUsuario = 0;
               var solucionBien = 1;
               
               try
               {
                    solucionUsuario = parseInt(result);
                    solucionBien = parseInt(res[h]);
               }
               catch(err)
               {
                    solucionUsuario = 1;
                    solucionBien = 2;
               }
               
               if(solucionUsuario===solucionBien){
                   $(comprobaciontd).removeClass();
                   $(comprobaciontd).addClass("success");
               }
               else
               {
                   $(comprobaciontd).removeClass();
                   $(comprobaciontd).addClass("danger");
               }
            }
        }
        
        //Asignamos clase si el cociente es correcto o incorrecto
        if($(cociValor).val()===cociString){
           $(cociInput).removeClass();
           $(cociInput).addClass("success");
       }
       else
       {
           $(cociInput).removeClass();
           $(cociInput).addClass("danger");
       }
       
       //Campos para luego ser guardados en la base de datos
       $('#restosAlum').val(solucionesUsuario);
       
       
       var valorCociente = $(cociValor).val();
       
       //Aplicar los decimales
        
       $('#cocienteAlum').val(valorCociente);

       $("#enviarresultado").prop( "disabled", false );
    }
    
    function onClickDecimal() {
        var divs = $('#divisor').text();
        var comaPos = divs.indexOf(',');
        
        if(comaPos > -1 && comaPos < divs.length - 2){
            //Si existen aun decimales procedemos a mover un decimal y hacemos aparecer uno de los
            //ceros en el dividendo
            //Eliminar coma
            var divsAux = divs.replace(",","");          
            
            var divsNew = divsAux.substr(0,comaPos+1) + "," + divsAux.substr(comaPos+1,divsAux.length);
            
            $('#divisor').html("<b>" + divsNew + "</b>");
            
            //Ahora agregamos los ceros al dividendo
            var dividendoLength = $("[id*='pasoDividendo']").length;
            
            comaPos = comaPos - 1; //para salvar el espacio del principio
            var totalDivisor = divs.length - 2; //Tambien para salvar el espacio del principio
            
            $("[id*='pasoDividendo"+ (dividendoLength - (totalDivisor - comaPos)) +"']").css("visibility","inherit");
            $("[id*='paso"+ (dividendoLength - (totalDivisor - comaPos)) +"']").css("visibility","inherit");
        }
        else if(comaPos > -1 && comaPos < divs.length - 1){
            var divsAux = divs.replace(",","");          
                        
            $('#divisor').html("<b>" + divsAux + "</b>");
            
            //Ahora agregamos el último cero al dividendo
            comaPos = comaPos - 1; //para salvar el espacio del principio
            var totalDivisor = divs.length - 2; //Tambien para salvar el espacio del principio
            
            var dividendoLength = $("[id*='pasoDividendo']").length;
            
            $("[id*='pasoDividendo"+ (dividendoLength - (totalDivisor - comaPos)) +"']").css("visibility","inherit");
            $("[id*='paso"+ (dividendoLength - (totalDivisor - comaPos)) +"']").css("visibility","inherit");
            
            //deshabilitarse asi mismo
            $("#moverDecimal").attr("onclick","return false");
            $("#moverDecimal").attr("style","color:grey;font-style: italic;");            
            
            //poner aqui el onclick de testear resultado o deshabilitar.
            $("#correccion").attr("onclick","onClick()");
            $("#correccion").attr("style","color:white;font-style: italic;");
            
            
        }
    }
    
    //Funcion para controlar que el usuario solo introduzca un número en las soluciones
    function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : evt.keyCode;
       if (charCode < 48 || charCode > 57)
          return false;

       return true;
    }
    
    //Funcion para controlar que el usuario solo introduzca un número en el cociente
    function isNumberKeyCociente(evt)
    {
       var charCode = (evt.which) ? evt.which : evt.keyCode;
       if (charCode < 48 || charCode > 57)
          return false;

       return true;
    }
    </script>
    
    <script type="text/javascript">    
        //Para controlar que todo este bien
        $(document).ready(function() {
            $("#formEnviar").submit(function(e){
                
                //Comprobamos que todos los valores han sido introducidos, si no es así
                //avisamos al usuario
                if(comprobarTodosRellenosNoOcultos() === false){                   
                    e.preventDefault(e);
                    $('#myModalEmpty').modal('show');
                }
                else
                {
                    $('#cocienteAlum').val($('#cocienteInput').val());
                }                
            });
        });
        
        function comprobarTodosRellenosNoOcultos()
        {
            var NoExisteUnEmpty = true;
            
            $('*[id*=paso]').each(function() {
                if( ($(this).css('visibility') !== 'hidden') && ($(this).val()=== '') && (!$(this).is('span')))
                {
                    
                    NoExisteUnEmpty = false;
                }
            });
            
            if(($('#cocienteInput').val()) === ''){
                NoExisteUnEmpty = false;
            } 
            
            return NoExisteUnEmpty;
        }
    
    </script>
	

<div class="container">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>Procede a resolver la división:</center></h3>
  </div>
  <div class="panel-body">
          <div class="row">
             <div class="col-md-12">
                  
                    <table class="table">
                   
                     <!-- Aplicadas en las filas -->
                   <thead>
                     <tr>
                         <td><div class="dividendo">
                                 
                                 <%--=dividendo--%>
                             <div class="input-group">
                                 <% for(int i=0;i<dividendoChars.length;i++){
                                     %>
                                                
                                     <input type="text" required class="form-control" size="1" value="<%=dividendoChars[i]%>" disabled id='pasoDividendo<%=i%>d'>
                                        <%if(i<dividendoChars.length-1){%>
                                        <span class="input-group-addon" id='paso<%=i%>ds'></span>
                                        <%}%>    
        
                                     <%
                                 }
                                 %>
                                 
                                 </div>
                                 
                             </div></td>
                         <td><div id="divisor" class="divisor" style="border-left-color: #337ab7; border-left-style: solid; border-left-width: 2px;border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: 2px;"><b>&nbsp;<%=divisorString%></b></div></td>
                     </tr>
                   </thead>
                   <tbody id="cuerpoDivision">
                     <!-- Aplicadas en las celdas (<td> o <th>) 
                     <tr>
                       <td class="warning">...</td>
                       <td class="warning">...</td>
                     </tr>
                     -->
                     <!-- Zona para resultados -->
                   </tbody>
                   </table>                 




              </div>
	</div>
  </div>
</div>

<div class="panel panel-primary" style="background-color:#337ab7;">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
                    <center><a href="#" id="moverDecimal" onclick="onClickDecimal()" style="color:white;font-style: italic;"><b>Mover decimal a la derecha</b></a></center>
			</div>
	</div>
  </div>
</div>                     
                     
<div class="panel panel-primary" style="background-color:#337ab7;">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
                    <center><a href="#" id="correccion" onclick="return false" style="color:grey;font-style: italic;"><b>Click para corregir</b></a></center>
			</div>
	</div>
  </div>
</div>    

 <div class="panel panel-primary" style="background-color:#337ab7;">
    <form id="formEnviar"  method="GET" action="/ActiLinev1/guardarDivisionDD">

    <input type="hidden" class="form-control" id="dividendoAlum" name="dividendoAlum" value="<%=dividendo%>">
    <input type="hidden" class="form-control" id="divisorAlum" name="divisorAlum" value="<%=divisor%>">
    <input type="hidden" class="form-control" id="cocienteAlum" name="cocienteAlum">
    <input type="hidden" class="form-control" id="restosAlum" name="restosAlum">
    
    <input type="hidden" class="form-control" id="cocienteAlumBien" name="cocienteAlumBien" value="<%=cocienteString%>">
    <input type="hidden" class="form-control" id="restosAlumBien" name="restosAlumBien" value="<%=strSolucionComas%>">
    <input type="hidden" class="form-control" id="cerosAlumBien" name="cerosAlumBien" value="<%=cerosEnDivision%>">
    <input type="hidden" class="form-control" id="decimalesAlumBien" name="decimalesAlumBien" value="<%=decimales%>">
    <input type="hidden" class="form-control" id="idDivision" name="idDivision" value="<%=idDivision%>">
    
    <center><button type="submit" class="btn btn-default" id="enviarresultado">Enviar resultado</button></center>
    </form>
</div>                   
                     
<div class="panel panel-primary">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
			<center><a href="#">.Acerca de</a></center>
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
        <h4 class="modal-title" id="modal-title">División con decimales en divisor.</h4>
      </div>
      <div class="modal-body" id="modal-body">
          <p>Recuerda que para proceder a la división antes debes hacer el arreglo añadiendo tantos ceros al dividendo como decimales tenga el divisor. </br></br>*Presionar una vez a "Mover decimal a la derecha" hará que se añada un cero.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>

  </div>
</div>
    
    
        <div id="myModalEmpty" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="modal-title">División de naturales.</h4>
              </div>
              <div class="modal-body" id="modal-body">
                  <p>Debes rellenar todos todos los valores para poder enviar a corrección la división. </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              </div>
            </div>

          </div>
        </div>     
    
  </body>
</html>