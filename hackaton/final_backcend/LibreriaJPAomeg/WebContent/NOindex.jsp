<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> CONSULTA</h1>
<table border=1>
<thead>
<tr>
	<th>Id </th>
	<th>Nombre </th>
	<th>Apellido</th>
	<th>Fecha de Alta</th>
</tr>
</thead>
<c:forEach var="__paciente" items="${_Pacientes}" varStatus="_filascnt">
	<c:choose>
		<c:when test='${_filascnt.first}'></c:when>		
	</c:choose>

	<tr>
	<td><a href="/JPAHospital/Controlador?action=modificacion&pctid=${__paciente.id}">__${__paciente.id}__</a> </td>
	<td>${__paciente.nombre}</td>
	<td>${__paciente.apellido}</td>
	<td>
		<fmt:formatDate pattern="dd-MM-yyyy" 
					value="${__paciente.fechaalta}" />	
	</td>	

	<c:choose>
		<c:when test='${_filascnt.last}'></c:when>
	</c:choose>
	</tr>
</c:forEach>
</table>

</body>
</html>