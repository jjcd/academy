<%-- 
    Document   : solucionDivision
    Created on : 09-oct-2016, 22:28:43
    Author     : JUAN JOSE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            //@SuppressWarnings("unchecked")
            String dividendo = "";
            String divisor = "";
            String cocienteString = "";
            
            String strSol = "";
            String strSolucionComas="";
            String[] dividendoChars = {};
            String solucionConCeros="";
            
            //List<Integer> ceros = (ArrayList<Integer>) request.getAttribute("ceros");
            
            if((request.getParameter("dividendo")!=null)&&(request.getParameter("divisor")!=null)&&(request.getAttribute("ceros")!=null)){        
                dividendo = request.getParameter("dividendo").toString();
                
                /*Partir el dividendo en diferentes caracteres*/
                dividendoChars = dividendo.split("(?!^)");
                
                /*Fin partir dividendo en distintos*/
                divisor = request.getParameter("divisor").toString();
                
                int cociInt = Integer.parseInt(dividendo) / Integer.parseInt(divisor);
                
                cocienteString = cociInt + "";
               
                List<Integer> ceros = (ArrayList<Integer>) request.getAttribute("ceros");
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
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
 
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
            $("#includedContent").load("menu.html"); 

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
                strPrimero = "<input type='text' class='form-control' id='cocienteInput' name='cocienteInput'>";
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
                        inputs += "<input type='text' required class='form-control' size='1'>";
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
    
<div class="panel panel-primary" style="background-color:#337ab7;">
  <div class="panel-body">
    <div class="row">
		<div class="col-md-12">
                    <center><a href="#" id="addpaso" onclick="onClick()" style="color:white;font-style: italic;"><b>Click para corregir</b></a></center>
			</div>
	</div>
  </div>
</div>    

 <div class="panel panel-primary" style="background-color:#337ab7;">
    <form  method="GET" action="/ActiLinev1/guardarDivision">

    <input type="hidden" class="form-control" id="dividendoAlum" name="dividendoAlum" value="<%=dividendo%>">
    <input type="hidden" class="form-control" id="divisorAlum" name="divisorAlum" value="<%=divisor%>">
    <input type="hidden" class="form-control" id="cocienteAlum" name="cocienteAlum">
    <input type="hidden" class="form-control" id="restosAlum" name="restosAlum">
    
    <input type="hidden" class="form-control" id="cocienteAlumBien" name="cocienteAlumBien" value="<%=cocienteString%>">
    <input type="hidden" class="form-control" id="restosAlumBien" name="restosAlumBien" value="<%=strSolucionComas%>">

    <button type="submit" class="btn btn-default">Enviar resultado</button>
    </form>
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


	

	
	
    <!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    



  </body>
</html>