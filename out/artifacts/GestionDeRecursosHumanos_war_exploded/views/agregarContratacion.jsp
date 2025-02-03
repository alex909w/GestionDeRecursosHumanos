<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Contratación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Agregar Contratación</h1>
    <form action="contrataciones" method="post">
        <input type="hidden" name="action" value="agregar">

        <div class="form-group">
            <label for="idDepartamento">ID Departamento:</label>
            <input type="number" class="form-control" id="idDepartamento" name="idDepartamento" required>
        </div>

        <div class="form-group">
            <label for="idEmpleado">ID Empleado:</label>
            <input type="number" class="form-control" id="idEmpleado" name="idEmpleado" required>
        </div>

        <div class="form-group">
            <label for="idCargo">ID Cargo:</label>
            <input type="number" class="form-control" id="idCargo" name="idCargo" required>
        </div>

        <div class="form-group">
            <label for="idTipoContratacion">ID Tipo Contratación:</label>
            <input type="number" class="form-control" id="idTipoContratacion" name="idTipoContratacion" required>
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
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>
