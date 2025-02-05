<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Departamento - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Editar Departamento</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para editar departamento -->
            <form action="departamentos" method="post">
                <input type="hidden" name="action" value="editar">
                <input type="hidden" name="idDepartamento" value="${departamento.idDepartamento}">

                <div class="form-group">
                    <label for="nombreDepartamento">Nombre:</label>
                    <input type="text" class="form-control" id="nombreDepartamento" name="nombreDepartamento" 
                           value="${departamento.nombreDepartamento}" pattern="[A-Za-z\s]+"
                           title="Solo se permiten letras y espacios" required>
                </div>

                <div class="form-group">
                    <label for="descripcionDepartamento">Descripción:</label>
                    <textarea class="form-control" id="descripcionDepartamento" name="descripcionDepartamento" required>
                        ${departamento.descripcionDepartamento != null ? departamento.descripcionDepartamento : ''}
                    </textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-lg">Actualizar</button>
                <a href="departamentos" class="btn btn-secondary btn-lg">Volver a la Página Anterior</a>
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
