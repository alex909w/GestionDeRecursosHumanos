<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Tipos de Contratación - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Lista de Tipos de Contratación</h1>
        </div>
        <div class="container mt-5">
            <!-- Botón para agregar nuevo tipo de contratación -->
            <a href="tiposcontratacion?action=agregar" class="btn btn-success mb-3 btn-lg">Agregar Tipo de Contratación</a>
            <!-- Botón para regresar al menú principal -->
            <a href="index.jsp" class="btn btn-secondary mb-3 btn-lg">Volver al Menú Principal</a>
            <!-- Tabla de Tipos de Contratación -->
            <table class="table table-bordered table-striped">
                <thead>
                    <tr class="table-dark">
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
                                <a href="tiposcontratacion?action=editar&idTipoContratacion=${tipoContratacion.idTipoContratacion}" class="btn btn-warning btn-sm">Editar</a>
                                <a href="tiposcontratacion?action=eliminar&idTipoContratacion=${tipoContratacion.idTipoContratacion}" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Footer -->
        <footer class="footer mt-5">
            <div class="container text-center">
                <p>© 2025 Gestión RRHH. Todos los derechos reservados.</p>
            </div>
        </footer>
    </body>
</html>
