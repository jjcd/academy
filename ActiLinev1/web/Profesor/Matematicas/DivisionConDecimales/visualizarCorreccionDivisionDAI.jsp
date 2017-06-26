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
        if((session.getAttribute("TIPOUSUARIO")==null)||(!session.getAttribute("TIPOUSUARIO").toString().equals("PROFESOR"))){
            response.sendRedirect("/ActiLinev1");
        }
    %>      
      <%
            //@SuppressWarnings("unchecked")
            String listaRestosUser = "";
            String dividendo = "";
            String divisor = "";
            String cocienteString = "";
            
            String strSol = "";
            String strSolucionComas="";
            String[] dividendoChars = {};
            String solucionConCeros="";
            
            String cocienteSolUsuario = "";
            
            //Para guardar los ceros en formato cadena
            String cerosEnDivision="";
            
            String decimales = "";
            
            //Para el dividendo y divisor originales
            String dividendoOriginal = "";
            String divisorOriginal = "";
            
            if((request.getAttribute("dividendo")!=null)&&(request.getAttribute("divisor")!=null)&&(request.getAttribute("ceros")!=null)&&(request.getAttribute("solucion")!=null)&&(request.getAttribute("cocienteSolUsuario")!=null)&&(request.getAttribute("solucionusuario")!=null)&&(request.getAttribute("decimales")!=null)){        
                dividendo = request.getAttribute("dividendo").toString();
                
                /*Partir el dividendo en diferentes caracteres*/
                dividendoChars = dividendo.split("(?!^)");
                
                /*Fin partir dividendo en distintos*/
                divisor = request.getAttribute("divisor").toString();
                
                //Recuperamos el cociente de la solución del usuario
                cocienteSolUsuario = request.getAttribute("cocienteSolUsuario").toString();
                
                //Recuperamos los restos de la solución del usuario
                listaRestosUser = request.getAttribute("solucionusuario").toString();
                
                //Recuperamos los decimales
                decimales = request.getAttribute("decimales").toString();
               
                int decimalesInt = Integer.parseInt(decimales);
                
                //Obtenemos dividendo y divisor originales
                dividendoOriginal = dividendo.substring(0, dividendo.length() - decimalesInt) + "," + dividendo.substring(dividendo.length() - decimalesInt, dividendo.length());
                divisorOriginal = divisor.substring(0, divisor.length() - decimalesInt) + "," + divisor.substring(divisor.length() - decimalesInt, divisor.length());
                /*
                    dividendo = dividendo.substring(0, dividendo.length() - decimalesInt);
                    divisor = divisor.substring(0, divisor.length() - decimalesInt) + "," + divisor.substring(divisor.length() - decimalesInt, divisor.length());
                */
                
                
                //Partir
                
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
                            
                            for(int cer=0;cer<AnteriorSolucionConCeros.length();cer++){
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
        //funcion para recoger parametro por get
        function findGetParameter(parameterName) {
            var result = null,
            tmp = [];
            location.search
            .substr(1)
            .split("&")
            .forEach(function (item) {
                tmp = item.split("=");
                if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
            });
            
            return result;
        }
        
        //var contadorPasos = 0;
        $(function(){
            $("#includedContent").load("<%=constantesClass.urlRaiz%>menuProfe.jsp"); 
            
            $("#enviarresultado").prop( "disabled", true );
            
            var j = <%=strSol%>;

            //solucionConCeros partido con ;
            var solCerosSplit = "<%=solucionConCeros%>";
            var listaSoluciones = solCerosSplit.split("-");

            //alert(listaSoluciones[0] + listaSoluciones[1] + listaSoluciones[2]);
            var contadorTabulado = 0;
        
            for(var i=0;i<j;i++){
                var solucionActual = listaSoluciones[i];

                strPrimero = "";
                if(i===0){
                    strPrimero = "<input type='text' class='form-control' id='cocienteInput' name='cocienteInput' data-toggle='tooltip' title='Solución : <%=cocienteString%>' data-placement='right'>";
                }

                //Anterior para pintar los input en el cociente
                /*$( "#cuerpoDivision" ).append("<tr><td class='warning' id='comprobacion"+i+
                        "' name='comprobacion"+i+"'><div><input size='1' type='text' class='form-control' id='paso"+i+
                        "' name='paso"+i+"'></div></td><td id='cociente"+i+"' name='cociente"+i+"'>"
                        +strPrimero+"</td></tr>");*/

                var inputs = "";

                var nInputs = <%=dividendoChars.length%>;

                //alert(solucionActual.length + " " + solucionActual.charAt(0) + " " + solucionActual + " " + contadorTabulado);

                var contAuxPintar = 0;
                var contAuxTab = 0;



                for(var x=0;x<nInputs;x++){
                    
                    //ver hasta cuantos imput hay que poner
                        if((contAuxTab<contadorTabulado)||(contAuxPintar>=solucionActual.length))
                        {
                            inputs += "<input type='text' required class='form-control' size='1' style='visibility:hidden;'>";
                            if(x<nInputs-1){
                               inputs += "<span class='input-group-addon' style='visibility:hidden;'></span>";
                               
                            }

                            contAuxTab++;
                        }
                        else
                        {
                            inputs += "<input type='text' required class='form-control' size='1' id='solucioncolumna"+ i + contAuxPintar +"'>";
                                                                                  
                            if(x<nInputs-1)
                            {
                               inputs += "<span class='input-group-addon'></span>";
                            }

                            contAuxPintar++;
                       }


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
            
            //Se procede a inicializar los inputs:
            $("#cocienteInput").val(<%=cocienteSolUsuario%>);
            
            //recoger parametros de la url
            var soluser = findGetParameter('solucionusuario');
            var solcorrecta = findGetParameter('solucion');
            
            //Splitear solucion de usuario por : y coger la ultima para volver a cortar
            //para después guardar en array
            var solRestosUser = soluser.split(':')[1];
            
            //Splitear solucion correcta por : y coger solucion y ceros
            var solRestosCorrecta = solcorrecta.split(':')[1];
            var solRestosCorrectaArray = solRestosCorrecta.split(';');
            
            var solCerosCorrecta = solcorrecta.split(':')[2];
            var solCerosCorrectaArray = solCerosCorrecta.split(';');
            
            var solRestosUserArray = solRestosUser.split(';');
            
            //alert(solRestosUserArray[0]);
            
            for(var i=0;i<solRestosUserArray.length;i++){
                //cada solucion la spliteamos en caracteres
                var solRestosUserArrayChars = solRestosUserArray[i];
                // data-toggle='tooltip' title='Solución :
                $('#comprobacion'+i).attr("data-toggle", "tooltip");
                $('#comprobacion'+i).attr("data-placement", "left");
                
                //Formar los ceros de delante
                var ceros = "";
                
                for(var c=0;c<solCerosCorrectaArray[i];c++){
                    ceros = ceros + '0';
                }
                
                $('#comprobacion'+i).attr("title", "Solución : " + ceros + solRestosCorrectaArray[i]);
                
                for(var j=0;j<solRestosUserArrayChars.length;j++){
                    //alert(solRestosUserArrayChars[j]);
                    
                    //alert($('solucioncolumna'+i+j).val());
                    $('#solucioncolumna'+i+j).val(solRestosUserArrayChars[j]);
                    
                    //$('#solucioncolumna'+i+j).attr("data-toggle", "tooltip");
                    //$('#solucioncolumna'+i+j).attr("title", "Solución 2: ");
                }
            }
            //var listaRestosUsuario = restosUsuarioString.split('/');;
            
            //for(var x=0;x<listaRestosUsuario.length();x++){
                //var restox = listaRestosUsuario[i];
                
            //}
            //$("#logger").val("hola");
            onClick();
    });
    </script> 
    
    <script type="text/javascript">
    function onClick() {
        
        
        var strsolucion = "";
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
       
       //alert(solucionesUsuario);
       //Campos para luego ser guardados en la base de datos
       $('#restosAlum').val(solucionesUsuario);
       
       
       var valorCociente = $(cociValor).val();
       $('#cocienteAlum').val(valorCociente);
       
       //alert($('#cocienteAlum').val());
       $("#enviarresultado").prop( "disabled", false );
    }
    </script>
    <script type="text/javascript">    
        //Para controlar que todo este bien
        $(document).ready(function() {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>	

<div class="container">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title"><center>Corrección de la división:</center></h3>
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
                                                
                                     <input type="text" required class="form-control" size="1" value="<%=dividendoChars[i]%>" disabled="true">
                                        <%if(i<dividendoChars.length-1){%>
                                        <span class="input-group-addon"></span>
                                        <%}%>    
        
                                     <%
                                 }
                                 %>
                                 
                                 </div>
                                 
                             </div></td>
                         <td><div class="divisor" style="border-left-color: #337ab7; border-left-style: solid; border-left-width: 2px;border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: 2px;"><b>&nbsp;<%=divisor%></b></div></td>
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
    
<div class="panel panel-primary">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
			<center>Numero de decimales : <b><%=decimales%></b> </center>
                        <center>Dividendo original : <b><%=dividendoOriginal%></b> </center>
                        <center>Divisor original : <b><%=divisorOriginal%></b> </center>
                </div>
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
