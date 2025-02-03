<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Contrataciones</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Lista de Contrataciones</h1>
    <a href="contrataciones?action=agregar" class="btn btn-primary mb-3">Agregar Contratación</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Fecha Contratación</th>
            <th>Salario</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contratacion" items="${contrataciones}">
            <tr>
                <td>${contratacion.idContratacion}</td>
                <td>${contratacion.fechaContratacion}</td>
                <td>${contratacion.salario}</td>
                <td>${contratacion.estado ? 'Activo' : 'Inactivo'}</td>
                <!-- Usamos 'estado' ahora en lugar de 'gestado'. -->
                <td>
                    <a href="contrataciones?action=editar&idContratacion=${contratacion.idContratacion}"
                       class="btn btn-warning">Editar</a>
                    <a href="contrataciones?action=eliminar&idContratacion=${contratacion.idContratacion}"
                       class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
