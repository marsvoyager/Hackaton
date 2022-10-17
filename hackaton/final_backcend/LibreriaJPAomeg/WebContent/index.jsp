<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>

<html>

<style type="text/css">
.wrapper {
        width: 600px;
        display: grid;
    	grid-gap: 10px;
        grid-template-columns: repeat(4, 100px);
        }

.box {
  background-color: #444;
  color: #fff;
  border-radius: 5px;
  padding: 20px;
  font-size: 150%;
}

.box:nth-child(even) {
  background-color: #ccc;
  color: #000;
}        
</style>
<script type="text/javascript">
function _fmodificar (formSubobject, idstocklibro){

	console.log("HOLA:"+formSubobject);
	console.log(formSubobject);
	console.log("ID:" +formSubobject.id);
	console.log("name:" +formSubobject.name);

	//usamos el nombre del input como action del form
	document.getElementById("_idproc_action").value = formSubobject.name;
	
	
	console.log("usar el emlemento" + "_idtitulo_"+idstocklibro);
	console.log("usar el emlemento" + "_idprecio_"+idstocklibro);
	console.log(document.getElementById("_idtitulo_"+idstocklibro).value);
	console.log(document.getElementById("_idprecio_"+idstocklibro).value);

			
	document.getElementById("_ididstocklibro").value = idstocklibro;
	document.getElementById("_idmodificaobaja_titulo").value = document.getElementById("_idtitulo_"+idstocklibro).value;
	document.getElementById("_idmodificaobaja_precio").value = document.getElementById("_idprecio_"+idstocklibro).value;
		
	document.getElementById("_idform_libros").submit();
	


	//if(document.getElementById())
	//document.getElementById("_proc_action").value = "modificar";
//	document.getElementById("action").value = "modificar";
	//document.getElementById("idEnviada").value = id;
	//document.getElementById("modifica_titulo").value = document.getElementById("titulo_"+id).value;
	//document.getElementById("modifica_precio").value = document.getElementById("precio_"+id).value;
	
}
</script>

<head>
<meta charset="ISO-8859-1">
<title>Coneix el teu Barri</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="header">
	<div class=nav-bar>
			<a class="navbar-brand" href="/">
	    	  <img data-src="/images/logo.png" class="logo" alt="Coneix el teu Barri" src="/images/logo.png">
	    </a>
	    <div class="user-options">
	    	<ul class="list-inline">
	    		<li>Inicia sesió</li>
	    		<li>Crear Compte</li>
	    	</ul>
	    </div>
  </div>	
</div>

<div class="wrapper">
	<h1>Coneix el teu Barri</h1>
	<p>Estadisticas i dades socioeconomiques dels barris de Barcelona</p>

<h1> Stock</h1>
<!-- 
<div class="wrapper">
	<div class="box box1">Id</div> 
	<div class="box box2">Título</div>
	<div class="box">Precio</div>
	<div class="box">Opción</div>
	<c:forEach var="__librostock" items="${_Stock}" varStatus="_filascnt">
	<div class="box">${__librostock.id}</div>
	<div class="box">${__librostock.titulo}</div>
	<div class="box">${__librostock.precio}</div>
	<div class="box"></div>
	</c:forEach>
	<div class ="box">
	<form method="post" action="/LibreriaJPAomeg/Controlador" >
		<input type="hidden" name="proc_action" value="_alta">
		<div class="box box1">AY AY</div>
		<div class="box">
			<input type="text" name="__titulo" value="">
			</div>
		<div class="box box2">
			<input type="text" name="__precio" value="">
		</div>
		<div class="box box3">
			<input type=submit name=hacer value="agregar">		
		</div>
	</form>
	</div>	
</div>

 -->
<form method="post" id="_idform_libros" name="_form_libros"  action="/LibreriaJPAomeg/Controlador" >
<input type="hidden" id="_idproc_action" name="_proc_action" value="_alta">
<input type="hidden" id="_ididstocklibro" name="_idstocklibro" value="">
<input type="hidden" id="_idmodificaobaja_titulo" name="_modificaobajatitulo" value="_alta">
<input type="hidden" id="_idmodificaobaja_precio" name="_modificaobajaprecio" value="_alta">
<table border=1>
<thead>
<tr>
	<th>Id </th>
	<th>Título</th>
	<th>Precio</th>
	<th>Opción</th>
</tr>
</thead>

<c:forEach var="__table2" items="${_TABLEC}" varStatus="_filascnt">
	<c:choose>
		<c:when test='${_filascnt.first}'></c:when>		
	</c:choose>

	<tr>
	<td>
		<%// <a href="/LibreriaJPAomeg/Controlador?action=modificacion&pctid=${__librostock.id}">__${__librostock.id}__</a>
		%>
		 <input type="text" id="_idid_${__table2.col1}" name="_id${__table2.col1}" value="${__table2.col1}" disabled="disabled" >
	</td>
	<td>
	 <input type="text" id="_idid_${__table2.col2}" name="_id${__table2.col2}" value="${__table2.col2}"  >	
	</td>
	<td>
	 <input type="text" id="_idid_${__table2.col3}" name="_id${__table2.col3}" value="${__table2.col3}"  >	

	</td>
	<td>
	 <input type="text" id="_idid_${__table2.col4}" name="_id${__table2.col4}" value="${__table2.col4}"  >	

	</td>
	<td>
	 <input type="text" id="_idid_${__table2.col5}" name="_id${__table2.col5}" value="${__table2.col5}"  >	

	</td>
	<td>
	</td>	
	</tr>
</c:forEach>
<tr>	
		<td>
		AY AY	
		</td>
		<td>
		<input type="text" name="__titulo" value="">
		</td>
		<td>
		<input type="text" name="__precio" value="">	
		</td>
		<td>
		<input type=submit name=hacer value="agregar">	
		</td>
</tr>
</table>
</form>
</div>
${_resultado}
<footer>
    <div class="container">
        <div class="footer text-muted text-center">
            <ul class="list-inline">
                <li><a href="#">Contacto</a></li> |
                <li><a href="#" rel="noindex">Aviso legal</a></li> |
                <li><a href="#" rel="noindex">Política de privacidad</a></li> |
                <li><a href="#" rel="noindex">Política de cookies</a></li> |
                <li><a href="#">Gestionar Consentimiento de Cookies</a></li> |
                <li> <a href="#">Mapa web</a></li>

            </ul>
            <p>
                © 2022 - <a href="#">Equipo 11 Hackaton Barcelona</a> - editado por
                <a href="https://www.webbrokers.es" target="_blank">
                    <span class="text-semibold">Europa</span>
                    <span class="text-semibold">Press</span>
                </a>
            </p>

        </div>
    </div>
</footer>

</body>
</html>