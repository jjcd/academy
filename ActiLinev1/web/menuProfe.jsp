<%@ page import="constantes.constantesClass" %> 

 <style>
.navbar-default .navbar-nav>.active>a:after,
.navbar-nav>li>a:after {
    background-repeat: no-repeat;
    background-position: 0 top;
    content: "";
    display: inline-block;
    height: 30px;
    margin-right: 30px;
    vertical-align: middle;
    width: 29px;
}


.navbar-default .navbar-nav>.active>a.home:after,
.navbar-nav>li>a.opcionHome:after { background-image: url('<%=constantesClass.urlRaiz%>bootstrap/home.png'); }

.navbar-default .navbar-nav>.active>a.about:after,
.navbar-nav>li>a.opcionInsert:after {  background-image: url('<%=constantesClass.urlRaiz%>bootstrap/new.png'); }

.navbar-default .navbar-nav>.active>a.contact:after,
.navbar-nav>li>a.opcionEdit:after {  background-image: url('<%=constantesClass.urlRaiz%>bootstrap/pencil.png'); }

.navbar-default .navbar-nav>.active>a.contact:after,
.navbar-nav>li>a.opcionRemove:after {  background-image: url('<%=constantesClass.urlRaiz%>bootstrap/paperbin.png'); }

nav.navbar {
    background-color: #337AB7;
	color:white;
}

.navbar-default .navbar-brand{
	color:white;
}

.navbar-default .navbar-nav > li > a{
	color:white;
}
 </style>
 
 <%
    Object usuarioSesion = session.getAttribute("USUARIO");
    String UsuarioString = "";
    
    if(usuarioSesion!=null){
        UsuarioString = usuarioSesion.toString();
    }
 %>
 
 
 <nav class="navbar navbar-default" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegación</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="<%=constantesClass.urlRaiz%>">ActiWeb</a>
  </div>
 
  <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <!--class="active"-->
	  <li><a href="<%=constantesClass.urlRaiz%>Profesor/indexprofesor.jsp" id="opcion1" class="opcionHome">Inicio</a></li>
          <li><a href="<%=constantesClass.urlRaiz%>Profesor/crearejercicio.jsp" id="opcion2" class="opcionInsert">Insertar tarea</a></li>
	  <li><a href="<%=constantesClass.urlRaiz%>Profesor/Matematicas/visualizarCorreccionesGeneral.jsp" id="opcion3" class="opcionEdit">Visualizar Soluciones Tareas</a></li>
	  <li><a href="<%=constantesClass.urlRaiz%>consultaDivisionesEliminar" id="opcion4" class="opcionRemove">Visualizar/Eliminar Tareas</a></li>

    </ul>

               <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><font color="white">Bienvenido, <%=UsuarioString%></font> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/auth/logout"><i class="icon-off"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
              </div>

  </div>
</nav>

	<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.6&appId=729544183797639";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
		
	
