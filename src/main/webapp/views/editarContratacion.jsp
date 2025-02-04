<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Contratación - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Editar Contratación</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para editar contratación -->
            <form action="contrataciones" method="post">
                <input type="hidden" name="action" value="editar">
                <input type="hidden" name="idContratacion" value="${contratacion.idContratacion}">

                <!-- Departamento -->
                <div class="form-group">
                    <label for="idDepartamento">Departamento:</label>
                    <select class="form-control" id="idDepartamento" name="idDepartamento" required>
                        <c:forEach var="departamento" items="${departamentos}">
                            <option value="${departamento.idDepartamento}" 
                                ${departamento.idDepartamento == contratacion.idDepartamento ? 'selected' : ''}>
                                ${departamento.nombreDepartamento}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Empleado -->
                <div class="form-group">
                    <label for="idEmpleado">Empleado:</label>
                    <select class="form-control" id="idEmpleado" name="idEmpleado" required>
                        <c:forEach var="empleado" items="${empleados}">
                            <option value="${empleado.idEmpleado}" 
                                ${empleado.idEmpleado == contratacion.idEmpleado ? 'selected' : ''}>
                                ${empleado.nombre} ${empleado.apellido}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Cargo -->
                <div class="form-group">
                    <label for="idCargo">Cargo:</label>
                    <select class="form-control" id="idCargo" name="idCargo" required>
                        <c:forEach var="cargo" items="${cargos}">
                            <option value="${cargo.idCargo}" 
                                ${cargo.idCargo == contratacion.idCargo ? 'selected' : ''}>
                                ${cargo.cargo}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Tipo de Contratación -->
                <div class="form-group">
                    <label for="idTipoContratacion">Tipo de Contratación:</label>
                    <select class="form-control" id="idTipoContratacion" name="idTipoContratacion" required>
                        <c:forEach var="tipo" items="${tiposContratacion}">
                            <option value="${tipo.idTipoContratacion}" 
                                ${tipo.idTipoContratacion == contratacion.idTipoContratacion ? 'selected' : ''}>
                                ${tipo.tipoContratacion}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Fecha de Contratación -->
                <div class="form-group">
                    <label for="fechaContratacion">Fecha de Contratación:</label>
                    <input type="date" class="form-control" id="fechaContratacion" name="fechaContratacion"
                           value="${contratacion.fechaContratacion}" required>
                </div>

                <!-- Salario -->
                <div class="form-group">
                    <label for="salario">Salario:</label>
                    <input type="number" step="0.01" class="form-control" id="salario" name="salario"
                           value="${contratacion.salario}" required>
                </div>

                <!-- Estado -->
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <select class="form-control" id="estado" name="estado" required>
                        <option value="true" ${contratacion.estado ? 'selected' : ''}>Activo</option>
                        <option value="false" ${!contratacion.estado ? 'selected' : ''}>Inactivo</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-lg">Actualizar</button>
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