<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Contrataciones - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Lista de Contrataciones</h1>
        </div>
        <div class="container mt-5">
            <!-- Botón para agregar nueva contratación -->
            <a href="contrataciones?action=agregar" class="btn btn-success mb-3 btn-lg">Agregar Contratación</a>
            <!-- Botón para regresar al menú principal -->
            <a href="index.jsp" class="btn btn-secondary mb-3 btn-lg">Volver al Menú Principal</a>
            <!-- Tabla de Contrataciones -->
            <table class="table table-bordered table-striped">
                <thead>
                    <tr class="table-dark">
                        <th>ID</th>
                        <th>Departamento</th>
                        <th>Empleado</th>
                        <th>Cargo</th>
                        <th>Tipo Contratación</th>
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
                            <!-- Ahora mostramos los nombres en lugar de los IDs -->
                            <td>${contratacion.nombreDepartamento}</td>
                            <td>${contratacion.nombreEmpleado}</td>
                            <td>${contratacion.nombreCargo}</td>
                            <td>${contratacion.tipoContratacion}</td>
                            <td>${contratacion.fechaContratacion}</td>
                            <td>${contratacion.salario}</td>
                            <td>${contratacion.estado ? 'Activo' : 'Inactivo'}</td>
                            <td>
                                <a href="contrataciones?action=editar&idContratacion=${contratacion.idContratacion}" class="btn btn-warning btn-sm">Editar</a>
                                <a href="contrataciones?action=eliminar&idContratacion=${contratacion.idContratacion}" class="btn btn-danger btn-sm">Eliminar</a>
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
