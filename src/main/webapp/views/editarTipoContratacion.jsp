<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Tipo de Contratación - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Editar Tipo de Contratación</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para editar tipo de contratación -->
            <form action="tiposcontratacion" method="post">
                <input type="hidden" name="action" value="editar">
                <input type="hidden" name="idTipoContratacion" value="${tipoContratacion.idTipoContratacion}">

                <div class="form-group">
                    <label for="tipoContratacion">Tipo de Contratación:</label>
                    <input type="text" class="form-control" id="tipoContratacion" name="tipoContratacion"
                           value="${tipoContratacion.tipoContratacion}" required>
                </div>

                <button type="submit" class="btn btn-primary btn-lg">Actualizar</button>
                <a href="tiposcontratacion" class="btn btn-secondary btn-lg">Volver a la Página Anterior</a>
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
