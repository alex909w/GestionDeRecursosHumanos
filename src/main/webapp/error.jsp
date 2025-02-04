<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error en la Aplicación</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">¡Ha ocurrido un error!</h4>
            <p>Lo sentimos, pero ha ocurrido un problema al procesar la solicitud.</p>
            <hr>
            <h5>Detalles del error:</h5>
            <ul>
                <li><strong>Mensaje:</strong> <%= exception != null ? exception.getMessage() : "Error desconocido" %></li>
                <li><strong>Tipo de error:</strong> <%= exception != null ? exception.getClass().getName() : "No disponible" %></li>
                <li><strong>Página de origen:</strong> <%= request.getRequestURI() %></li>
            </ul>

            <% if (exception != null) { %>
                <h5>Stack Trace:</h5>
                <pre><%= exception != null ? exception.getStackTrace()[0] : "No disponible" %></pre>
            <% } %>

            <a href="index.jsp" class="btn btn-primary mt-3">Volver al Inicio</a>
        </div>
    </div>
</body>
</html>
