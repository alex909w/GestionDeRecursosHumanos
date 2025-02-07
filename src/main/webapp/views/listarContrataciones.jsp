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
            <!-- Añadir después del botón "Volver al Menú Principal" -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Filtros</h5>
                            <div class="row">
                                <div class="col-md-2">
                                    <input type="text" id="filtroDepartamento" class="form-control" placeholder="Filtrar por Departamento">
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="filtroCargo" class="form-control" placeholder="Filtrar por Cargo">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" id="filtroSalarioMin" class="form-control" placeholder="Salario Mínimo">
                                </div>
                                <div class="col-md-2">
                                    <select id="filtroTipoContrato" class="form-control">
                                        <option value="">Tipo de Contrato</option>
                                        <option value="Indefinido">Indefinido</option>
                                        <option value="Temporal">Temporal</option>
                                        <option value="Practicas">Prácticas</option>
                                        <option value="Freelance">Freelance</option>
                                        <option value="Servicio">Servicio Profesional</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <select id="filtroEstado" class="form-control">
                                        <option value="">Estado</option>
                                        <option value="true">Activo</option>
                                        <option value="false">Inactivo</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-primary" onclick="limpiarFiltros()">Limpiar Filtros</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                            <td>${contratacion.nombreEmpleado}</td>
                            <td>${contratacion.nombreDepartamento}</td>
                            <td>${contratacion.nombreCargo}</td>
                            <td>${contratacion.tipoContratacion}</td>
                            <td>${contratacion.fechaContratacion}</td>
                            <td>${contratacion.salario}</td>
                            <td>${contratacion.estado ? 'Activo' : 'Inactivo'}</td>
                            <td>
                                <a href="contrataciones?action=editar&idContratacion=${contratacion.idContratacion}" class="btn btn-warning btn-sm">Editar</a>
                                <a href="contrataciones?action=eliminar&idContratacion=${contratacion.idContratacion}" class="btn btn-danger btn-sm">Eliminar</a>
                                <a href="empleados?action=editar&idEmpleado=${empleado.idEmpleado}" class="btn btn-info btn-sm">Info</a>
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

        <script>
            // Función para aplicar los filtros
            function aplicarFiltros() {
                const filtroDepartamento = document.getElementById('filtroDepartamento').value.toLowerCase();
                const filtroCargo = document.getElementById('filtroCargo').value.toLowerCase();
                const filtroSalarioMin = document.getElementById('filtroSalarioMin').value;
                const filtroTipoContrato = document.getElementById('filtroTipoContrato').value;
                const filtroEstado = document.getElementById('filtroEstado').value;

                const filas = document.querySelectorAll('tbody tr');

                filas.forEach(fila => {
                    const departamento = fila.cells[2].textContent.toLowerCase();
                    const cargo = fila.cells[3].textContent.toLowerCase();
                    const salario = parseFloat(fila.cells[6].textContent);
                    const tipoContrato = fila.cells[4].textContent;
                    const estado = fila.cells[7].textContent === 'Activo' ? 'true' : 'false';

                    const cumpleDepartamento = !filtroDepartamento || departamento.includes(filtroDepartamento);
                    const cumpleCargo = !filtroCargo || cargo.includes(filtroCargo);
                    const cumpleSalario = !filtroSalarioMin || salario >= parseFloat(filtroSalarioMin);
                    const cumpleTipoContrato = !filtroTipoContrato || tipoContrato === filtroTipoContrato;
                    const cumpleEstado = !filtroEstado || estado === filtroEstado;

                    if (cumpleDepartamento && cumpleCargo && cumpleSalario && cumpleTipoContrato && cumpleEstado) {
                        fila.style.display = '';
                    } else {
                        fila.style.display = 'none';
                    }
                });
            }

            // Función para limpiar todos los filtros
            function limpiarFiltros() {
                document.getElementById('filtroDepartamento').value = '';
                document.getElementById('filtroCargo').value = '';
                document.getElementById('filtroSalarioMin').value = '';
                document.getElementById('filtroTipoContrato').value = '';
                document.getElementById('filtroEstado').value = '';
                aplicarFiltros();
            }

            // Agregar eventos a los campos de filtro
            document.getElementById('filtroDepartamento').addEventListener('input', aplicarFiltros);
            document.getElementById('filtroCargo').addEventListener('input', aplicarFiltros);
            document.getElementById('filtroSalarioMin').addEventListener('input', aplicarFiltros);
            document.getElementById('filtroTipoContrato').addEventListener('change', aplicarFiltros);
            document.getElementById('filtroEstado').addEventListener('change', aplicarFiltros);
        </script>
    </body>
</html>
