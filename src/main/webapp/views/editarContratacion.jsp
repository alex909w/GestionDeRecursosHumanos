<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Contratación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Editar Contratación</h1>
    <form action="contrataciones" method="post">
        <input type="hidden" name="action" value="editar">
        <input type="hidden" name="idContratacion" value="${contratacion.idContratacion}">
        <div class="form-group">
            <label for="idDepartamento">ID Departamento:</label>
            <input type="number" class="form-control" id="idDepartamento" name="idDepartamento" value="${contratacion.idDepartamento}" required>
        </div>
        <div class="form-group">
            <label for="idEmpleado">ID Empleado:</label>
            <input type="number" class="form-control" id="idEmpleado" name="idEmpleado" value="${contratacion.idEmpleado}" required>
        </div>
        <div class="form-group">
            <label for="idCargo">ID Cargo:</label>
            <input type="number" class="form-control" id="idCargo" name="idCargo" value="${contratacion.idCargo}" required>
        </div>
        <div class="form-group">
            <label for="idTipoContratacion">ID Tipo Contratación:</label>
            <input type="number" class="form-control" id="idTipoContratacion" name="idTipoContratacion" value="${contratacion.idTipoContratacion}" required>
        </div>
        <div class="form-group">
            <label for="fechaContratacion">Fecha de Contratación:</label>
            <input type="date" class="form-control" id="fechaContratacion" name="fechaContratacion" value="${contratacion.fechaContratacion}" required>
        </div>
        <div class="form-group">
            <label for="salario">Salario:</label>
            <input type="number" step="0.01" class="form-control" id="salario" name="salario" value="${contratacion.salario}" required>
        </div>
        <div class="form-group">
            <label for="estado">Estado:</label>
            <select class="form-control" id="estado" name="estado" required>
                <option value="true" ${contratacion.estado ? 'selected' : ''}>Activo</option>
                <option value="false" ${!contratacion.estado ? 'selected' : ''}>Inactivo</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Actualizar</button>
    </form>
</div>
</body>
</html>
