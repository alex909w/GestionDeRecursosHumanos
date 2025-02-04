<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Cargos - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Lista de Cargos</h1>
        </div>
        <div class="container mt-5">
            <!-- Botón para agregar nuevo cargo -->
            <a href="cargos?action=agregar" class="btn btn-success mb-3 btn-lg">Agregar Cargo</a>
            <!-- Botón para regresar al menú principal -->
            <a href="index.jsp" class="btn btn-secondary mb-3 btn-lg">Volver al Menú Principal</a>
            <!-- Tabla de Cargos -->
            <table class="table table-bordered table-striped">
                <thead>
                    <tr class="table-dark">
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
                                <a href="cargos?action=editar&idCargo=${cargo.idCargo}" class="btn btn-warning btn-sm">Editar</a>
                                <a href="cargos?action=eliminar&idCargo=${cargo.idCargo}" class="btn btn-danger btn-sm">Eliminar</a>
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
