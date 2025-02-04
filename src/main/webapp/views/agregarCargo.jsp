<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agregar Cargo - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Agregar Cargo</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para agregar cargo -->
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

                <button type="submit" class="btn btn-primary btn-lg">Agregar</button>
                <a href="cargos" class="btn btn-secondary btn-lg">Volver a la Página Anterior</a>
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
