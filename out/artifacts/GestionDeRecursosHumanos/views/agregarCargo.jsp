<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Cargo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Agregar Cargo</h1>
    <form action="cargos" method="post">
        <input type="hidden" name="action" value="agregar">
        <div class="form-group">
            <label for="cargo">Cargo:</label>
            <input type="text" class="form-control" id="cargo" name="cargo" required>
        </div>
        <div class="form-group">
            <label for="descripcionCargo">Descripción:</label>
            <textarea class="form-control" id="descripcionCargo" name="descripcionCargo" required></textarea>
        </div>
        <div class="form-group">
            <label for="jefatura">Jefatura:</label>
            <select class="form-control" id="jefatura" name="jefatura" required>
                <option value="true">Sí</option>
                <option value="false">No</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Agregar</button>
    </form>
</div>
</body>
</html>
