<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Departamento</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Agregar Departamento</h1>
    <form action="departamentos" method="post">
        <input type="hidden" name="action" value="agregar">
        <div class="form-group">
            <label for="nombreDepartamento">Nombre:</label>
            <input type="text" class="form-control" id="nombreDepartamento" name="nombreDepartamento" required>
        </div>
        <div class="form-group">
            <label for="descripcionDepartamento">Descripción:</label>
            <textarea class="form-control" id="descripcionDepartamento" name="descripcionDepartamento"
                      required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Agregar</button>
    </form>
</div>
</body>
</html>