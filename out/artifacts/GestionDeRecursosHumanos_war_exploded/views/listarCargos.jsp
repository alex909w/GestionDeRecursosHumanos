<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Cargos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Lista de Cargos</h1>
    <a href="cargos?action=agregar" class="btn btn-primary mb-3">Agregar Cargo</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Cargo</th>
            <th>Descripción</th>
            <th>Jefatura</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cargo" items="${cargos}">
            <tr>
                <td>${cargo.idCargo}</td>
                <td>${cargo.cargo}</td>
                <td>${cargo.descripcionCargo}</td>
                <td>${cargo.jefatura ? 'Sí' : 'No'}</td>
                <td>
                    <a href="cargos?action=editar&idCargo=${cargo.idCargo}" class="btn btn-warning">Editar</a>
                    <a href="cargos?action=eliminar&idCargo=${cargo.idCargo}" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>