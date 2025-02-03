<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Tipo de Contratación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Editar Tipo de Contratación</h1>
    <form action="tiposcontratacion" method="post">
        <input type="hidden" name="action" value="editar">
        <input type="hidden" name="idTipoContratacion" value="${tipoContratacion.idTipoContratacion}">

        <div class="form-group">
            <label for="tipoContratacion">Tipo de Contratación:</label>
            <input type="text" class="form-control" id="tipoContratacion" name="tipoContratacion"
                   value="${tipoContratacion.tipoContratacion}" required>
        </div>

        <button type="submit" class="btn btn-primary">Actualizar</button>
    </form>
</div>
</body>
</html>
