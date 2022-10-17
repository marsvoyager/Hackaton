<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Coneix el teu Barri</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="header">
	<div class=nav-bar>
			<a class="navbar-brand" href="/">
	    	  <img class="logo" alt="Coneix el teu Barri" src="https://i.ibb.co/Q9gp0zL/Screen-Shot-2022-10-17-at-5-36-27-PM.png">
	    	  <span class="logo_name">Anys i Companys<span>
	    </a>
	    <div class="user-options">
	    	<ul class="list-inline">
	    		<li>Inicia sesió</li>
	    		<li>Crear Compte</li>
	    	</ul>
	    </div>
  </div>	
</div>

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
<div class="wrapper">

	<div class="content">
			<h1>Coneix el teu Barri</h1>
			<p>Estadisticas i dades socioeconomiques dels barris de Barcelona</p>



			<form method="post" id="_idform_libros" name="_form_libros" action="/LibreriaJPAomeg/Controlador">
			<input type="hidden" id="_idproc_action" name="_proc_action" value="_alta">
			<input type="hidden" id="_ididstocklibro" name="_idstocklibro" value="">
			<input type="hidden" id="_idmodificaobaja_titulo" name="_modificaobajatitulo" value="_alta">
			<input type="hidden" id="_idmodificaobaja_precio" name="_modificaobajaprecio" value="_alta">
			<c:foreach var="__table2" items="${_TABLEC}" varstatus="_filascnt">
				<c:choose>
					<c:when test="${_filascnt.first}"></c:when>		
				</c:choose>

				</c:foreach><table border="1">
			<thead>
			<tr>
				<th>Id </th>
				<th>Metrica</th>
				<th>Barri</th>
				<th>Districte</th>
				<th>Barcelona</th>
			</tr>
			</thead>

			<tbody><tr>
				<td>
					&lt;%// <a href="/LibreriaJPAomeg/Controlador?action=modificacion&amp;pctid=${__librostock.id}">__${__librostock.id}__</a>
					%&gt;
					 <input type="text" id="_idid_${__table2.col1}" name="_id${__table2.col1}" value="${__table2.col1}" disabled="disabled">
				</td>
				<td>
				 <input type="text" id="_idid_${__table2.col2}" name="_id${__table2.col2}" value="${__table2.col2}">	
				</td>
				<td>
				 <input type="text" id="_idid_${__table2.col3}" name="_id${__table2.col3}" value="${__table2.col3}">	

				</td>
				<td>
				 <input type="text" id="_idid_${__table2.col4}" name="_id${__table2.col4}" value="${__table2.col4}">	

				</td>
				<td>
				 <input type="text" id="_idid_${__table2.col5}" name="_id${__table2.col5}" value="${__table2.col5}">	

				</td>
				<td>
				</td>	
				</tr>

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
					<input type="submit" name="hacer" value="agregar">	
					</td>
			</tr>
			</tbody></table>
			</form>

			${_resultado}
	</div>
</div>
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