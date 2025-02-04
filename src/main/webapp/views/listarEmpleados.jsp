<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Empleados - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Lista de Empleados</h1>
        </div>
        <div class="container mt-5">
            <!-- Botón para agregar nuevo empleado -->
            <a href="empleados?action=agregar" class="btn btn-success mb-3 btn-lg">Agregar Empleado</a>
            <!-- Botón para regresar al menú principal -->
            <a href="index.jsp" class="btn btn-secondary mb-3 btn-lg">Volver al Menú Principal</a>
            <!-- Tabla de Empleados -->
            <table class="table table-bordered table-striped">
                <thead>
                    <tr class="table-dark">
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="empleado" items="${empleados}">
                        <tr>
                            <td>${empleado.idEmpleado}</td>
                            <td>${empleado.nombre}</td>
                            <td>${empleado.apellido}</td>
                            <td>${empleado.telefono}</td>
                            <td>${empleado.correoElectronico}</td>
                            <td>${empleado.fechaNacimiento}</td>
                            <td>
                                <a href="empleados?action=editar&idEmpleado=${empleado.idEmpleado}" class="btn btn-warning btn-sm">Editar</a>
                                <a href="empleados?action=eliminar&idEmpleado=${empleado.idEmpleado}" class="btn btn-danger btn-sm">Eliminar</a>
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
