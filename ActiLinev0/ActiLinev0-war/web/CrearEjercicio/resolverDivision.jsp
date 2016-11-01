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
      <%
            //@SuppressWarnings("unchecked")
            String dividendo = "";
            String divisor = "";
            String cocienteString = "";
            
            String[] dividendoMax = {"","","","","","",""};
            String[] dividendoChars;
            
            String strSol = "";
            String strSolucionComas="";
            
            if((request.getParameter("dividendo")!=null)&&(request.getParameter("divisor")!=null)){        
                dividendo = request.getParameter("dividendo").toString();
                
                /*Partir el dividendo en diferentes caracteres*/
                dividendoChars = dividendo.split("(?!^)");
                
                //Asignar a las columnas del dividendo los valores
                for(int cont=0;cont<dividendoChars.length;cont++){
                    dividendoMax[cont] = dividendoChars[cont];
                }
                
                /*Fin partir dividendo en distintos caracteres*/
                divisor = request.getParameter("divisor").toString();
                
                int cociInt = Integer.parseInt(dividendo) / Integer.parseInt(divisor);
                
                cocienteString = cociInt + "";
                
                List<Integer> sol = (ArrayList<Integer>) request.getAttribute("solucion");
                int numSol = sol.size();
                strSol = numSol + "";
                strSolucionComas="";
                
                for(Integer in : sol) {
                        strSolucionComas = strSolucionComas + in + ";";
                }
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
      
            /*var myEl = document.getElementById('addpaso');

            myEl.addEventListener('click', function() {
                alert(contadorPasos);
            }, false);
            
            contadorPasos++;*/
        var j = <%=strSol%>;
       
        for(var i=0;i<j;i++){
            //str+="&nbsp;";
            strPrimero = "";
            if(i===0){
                strPrimero = "<input type='text' class='form-control' id='cocienteInput' name='cocienteInput'>";
            }
            
            <%--
                              <table class="table" id="tabladividendo">
                                 <tr>
                                    <td id="columnadividendo0"><%=dividendoMax[0]%></td>
                                    <td id="columnadividendo1"><%=dividendoMax[1]%></td>
                                    <td id="columnadividendo2"><%=dividendoMax[2]%></td>
                                    <td id="columnadividendo3"><%=dividendoMax[3]%></td>
                                    <td id="columnadividendo4"><%=dividendoMax[4]%></td>
                                    <td id="columnadividendo5"><%=dividendoMax[5]%></td>
                                    <td id="columnadividendo6"><%=dividendoMax[6]%></td>
                                 </tr>
                             </table>
             * 
             --%>
            
            
            $( "#cuerpoDivision" ).append("<tr><td class='warning' id='comprobacion"+i+"' name='comprobacion"+i+"'>"+
                                                //"<div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div>"+
                                                //Cuerpo de la división donde tabular
                                                
                                                "<table class='table' id='tabladividendo'>"+
                                                    "<tr>"+
                                                       "<td id='columnadividendo0'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"' disabled='true'></div></td>"+
                                                       "<td id='columnadividendo1'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div></td>"+
                                                       "<td id='columnadividendo2'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div></td>"+
                                                       "<td id='columnadividendo3'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div></td>"+
                                                       "<td id='columnadividendo4'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div></td>"+
                                                       "<td id='columnadividendo5'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div></td>"+
                                                       "<td id='columnadividendo6'><div><input type='text' class='form-control' id='paso"+i+"' name='paso"+i+"'></div></td>"+
                                                    "</tr>"+
                                                "</table>"+
                                                
                                                //Fin cuerpo de la división donde tabular
                                                "</td><td id='cociente"+i+"' name='cociente"+i+"'>"+strPrimero+"</td></tr>");
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
        
        for(h=0;h<res.length;h++){
            if(res[h]!==null&&res[h]!=="")
            {               
               var pasoInput = "#paso" + h;
               var comprobaciontd = "#comprobacion" + h;
               
               
               if($(pasoInput).val()===res[h]){
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
        
        //alert(cociString + " " + $(cociValor).val());
        
        if($(cociValor).val()===cociString){
           $(cociInput).removeClass();
           $(cociInput).addClass("success");
       }
       else
       {
           $(cociInput).removeClass();
           $(cociInput).addClass("danger");
       }
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
                         <td>
                             <%--<div class="dividendo">--%>
                             <table class="table" id="tabladividendo">
                                 <tr>
                                    <td id="columnadividendo0"><%=dividendoMax[0]%></td>
                                    <td id="columnadividendo1"><%=dividendoMax[1]%></td>
                                    <td id="columnadividendo2"><%=dividendoMax[2]%></td>
                                    <td id="columnadividendo3"><%=dividendoMax[3]%></td>
                                    <td id="columnadividendo4"><%=dividendoMax[4]%></td>
                                    <td id="columnadividendo5"><%=dividendoMax[5]%></td>
                                    <td id="columnadividendo6"><%=dividendoMax[6]%></td>
                                 </tr>
                             </table>
                                 <%--<b><%=dividendo%> </b>--%>
                         </td>    
                             <%--</div>--%>
                         
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