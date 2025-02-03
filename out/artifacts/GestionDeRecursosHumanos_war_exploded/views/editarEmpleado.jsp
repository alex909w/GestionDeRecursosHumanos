<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Empleado</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Editar Empleado</h1>
    <form action="empleados" method="post">
        <input type="hidden" name="action" value="editar">
        <input type="hidden" name="idEmpleado" value="${empleado.idEmpleado}">

        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" value="${empleado.nombre}" required>
        </div>

        <div class="form-group">
            <label for="apellido">Apellido:</label>
            <input type="text" class="form-control" id="apellido" name="apellido" value="${empleado.apellido}" required>
        </div>

        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="text" class="form-control" id="telefono" name="telefono" value="${empleado.telefono}" required>
        </div>

        <div class="form-group">
            <label for="correoElectronico">Correo Electrónico:</label>
            <input type="email" class="form-control" id="correoElectronico" name="correoElectronico"
                   value="${empleado.correoElectronico}" required>
        </div>

        <div class="form-group">
            <label for="fechaNacimiento">Fecha de Nacimiento:</label>
            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento"
                   value="${empleado.fechaNacimiento}" required>
        </div>

        <div class="form-group">
            <label for="genero">Género:</label>
            <select class="form-control" id="genero" name="genero" required>
                <option value="M" ${empleado.genero == 'M' ? 'selected' : ''}>Masculino</option>
                <option value="F" ${empleado.genero == 'F' ? 'selected' : ''}>Femenino</option>
                <option value="O" ${empleado.genero == 'O' ? 'selected' : ''}>Otro</option>
            </select>
        </div>

        <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" class="form-control" id="direccion" name="direccion" value="${empleado.direccion}">
        </div>

        <button type="submit" class="btn btn-primary">Actualizar</button>
    </form>
</div>
</body>
</html>
