<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Contratación - Gestión RRHH</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <!-- Encabezado -->
    <div class="header">
        <h1 class="fw-bold">Agregar Contratación</h1>
    </div>

    <div class="container mt-5">
        <!-- Formulario para agregar contratación -->
        <form action="contrataciones" method="post">
            <input type="hidden" name="action" value="agregar">

            <div class="form-group">
                <label for="idDepartamento">Departamento:</label>
                <select class="form-control" id="idDepartamento" name="idDepartamento" required>
                    <option value="" disabled selected>Seleccione un Departamento</option>
                    <c:forEach var="departamento" items="${departamentos}">
                        <option value="${departamento.idDepartamento}">${departamento.nombreDepartamento}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="idEmpleado">Empleado:</label>
                <select class="form-control" id="idEmpleado" name="idEmpleado" required>
                    <option value="" disabled selected>Seleccione un Empleado</option>
                    <c:forEach var="empleado" items="${empleados}">
                        <option value="${empleado.idEmpleado}">${empleado.nombre} ${empleado.apellido}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="idCargo">Cargo:</label>
                <select class="form-control" id="idCargo" name="idCargo" required>
                    <option value="" disabled selected>Seleccione un Cargo</option>
                    <c:forEach var="cargo" items="${cargos}">
                        <option value="${cargo.idCargo}">${cargo.cargo}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="idTipoContratacion">Tipo Contratación:</label>
                <select class="form-control" id="idTipoContratacion" name="idTipoContratacion" required>
                    <option value="" disabled selected>Seleccione un Tipo de Contratación</option>
                    <c:forEach var="tipoContratacion" items="${tiposContratacion}">
                        <option value="${tipoContratacion.idTipoContratacion}">${tipoContratacion.tipoContratacion}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="fechaContratacion">Fecha de Contratación:</label>
                <input type="date" class="form-control" id="fechaContratacion" name="fechaContratacion" required>
            </div>

            <div class="form-group">
                <label for="salario">Salario:</label>
                <input type="number" step="0.01" class="form-control" id="salario" name="salario" required>
            </div>

            <div class="form-group">
                <label for="estado">Estado:</label>
                <select class="form-control" id="estado" name="estado" required>
                    <option value="true">Activo</option>
                    <option value="false">Inactivo</option>
                </select>
            </div>

            <!-- Botones de acción -->
            <button type="submit" class="btn btn-primary btn-lg">Agregar</button>
            <a href="contrataciones" class="btn btn-secondary btn-lg">Volver a la Página Anterior</a>
            <a href="index.jsp" class="btn btn-secondary btn-lg">Volver al Menú Principal</a>
        </form>
    </div>

    <!-- Footer -->
    <footer class="footer mt-5">
        <div class="container text-center">
            <p>© 2025 Gestión RRHH. Todos los derechos reservados.</p>
        </div>
    </footer>
</body>
</html>
