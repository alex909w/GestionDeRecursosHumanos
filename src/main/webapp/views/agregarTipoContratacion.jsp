<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Tipo de Contratación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Agregar Tipo de Contratación</h1>
    <form action="tiposcontratacion" method="post">
        <input type="hidden" name="action" value="agregar">
        <div class="form-group">
            <label for="tipoContratacion">Tipo de Contratación:</label>
            <input type="text" class="form-control" id="tipoContratacion" name="tipoContratacion" required>
        </div>
        <button type="submit" class="btn btn-primary">Agregar</button>
    </form>
</div>
</body>
</html>