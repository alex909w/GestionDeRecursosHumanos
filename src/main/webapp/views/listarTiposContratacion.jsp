<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Tipos de Contratación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Lista de Tipos de Contratación</h1>
    <a href="tiposcontratacion?action=agregar" class="btn btn-primary mb-3">Agregar Tipo de Contratación</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tipo de Contratación</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tipoContratacion" items="${tiposContratacion}">
            <tr>
                <td>${tipoContratacion.idTipoContratacion}</td>
                <td>${tipoContratacion.tipoContratacion}</td>
                <td>
                    <a href="tiposcontratacion?action=editar&idTipoContratacion=${tipoContratacion.idTipoContratacion}" class="btn btn-warning">Editar</a>
                    <a href="tiposcontratacion?action=eliminar&idTipoContratacion=${tipoContratacion.idTipoContratacion}" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>