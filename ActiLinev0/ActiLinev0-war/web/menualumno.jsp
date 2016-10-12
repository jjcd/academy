
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
.navbar-nav>li>a.opcionHome:after { background-image: url('bootstrap/home.png'); }

.navbar-default .navbar-nav>.active>a.about:after,
.navbar-nav>li>a.opcionInsert:after {  background-image: url('bootstrap/new.png'); }

.navbar-default .navbar-nav>.active>a.contact:after,
.navbar-nav>li>a.opcionEdit:after {  background-image: url('bootstrap/pencil.png'); }

.navbar-default .navbar-nav>.active>a.contact:after,
.navbar-nav>li>a.opcionRemove:after {  background-image: url('bootstrap/paperbin.png'); }

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
 


 
 <nav class="navbar navbar-default" role="navigation">
  <!-- El logotipo y el icono que despliega el men� se agrupan
       para mostrarlos mejor en los dispositivos m�viles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegaci�n</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">ActiWeb</a>
  </div>
 
  <!-- Agrupar los enlaces de navegaci�n, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <!--class="active"-->
	  <li><a href="#" id="opcion1" class="opcionHome">Inicio</a></li>
      <li><a href="#" id="opcion2" class="opcionInsert">Realizar ejercicio</a></li>

    </ul>


  </div>
</nav>