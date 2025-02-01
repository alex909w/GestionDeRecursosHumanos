<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Departamentos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Lista de Departamentos</h1>
    <a href="departamentos?action=agregar" class="btn btn-primary mb-3">Agregar Departamento</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="departamento" items="${departamentos}">
            <tr>
                <td>${departamento.idDepartamento}</td>
                <td>${departamento.nombreDepartamento}</td>
                <td>${departamento.descripcionDepartamento}</td>
                <td>
                    <a href="departamentos?action=editar&idDepartamento=${departamento.idDepartamento}" class="btn btn-warning">Editar</a>
                    <a href="departamentos?action=eliminar&idDepartamento=${departamento.idDepartamento}" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>