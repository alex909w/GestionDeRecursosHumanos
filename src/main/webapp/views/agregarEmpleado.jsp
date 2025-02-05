<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agregar Empleado - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Agregar Empleado</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para agregar empleado -->
            <form action="empleados" method="post">
                <input type="hidden" name="action" value="agregar">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre"
                           pattern="[A-Za-z\s]+" title="Solo se permiten letras y espacios" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido"
                           pattern="[A-Za-z\s]+" title="Solo se permiten letras y espacios" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" class="form-control" id="telefono" name="telefono"
                           pattern="^[0-9-]+$" title="Solo se permiten numeros y un guion" required>
                </div>
                <div class="form-group">
                    <label for="correoElectronico">Correo Electrónico:</label>
                    <input type="email" class="form-control" id="correoElectronico" name="correoElectronico" required>
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
                </div>
                <div class="form-group">
                    <label for="genero">Género:</label>
                    <select class="form-control" id="genero" name="genero" required>
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion">
                </div>
                <button type="submit" class="btn btn-primary btn-lg">Agregar</button>
                <a href="empleados" class="btn btn-secondary btn-lg">Volver a la Página Anterior</a>
                <a href="index.jsp" class="btn btn-secondary btn-lg">Volver al Menú Principal</a>
            </form>

            <!-- Botones para regresar -->
            <div class="mt-3">  

            </div>
        </div>

        <!-- Footer -->
        <footer class="footer mt-5">
            <div class="container text-center">
                <p>© 2025 Gestión RRHH. Todos los derechos reservados.</p>
            </div>
        </footer>

        <script>
            const fechaNacimiento = document.getElementById('fechaNacimiento');
            const fechaActual = new Date().toISOString().split('T')[0]; // Obtiene la fecha actual en formato YYYY-MM-DD
            fechaNacimiento.max = fechaActual;
        </script>

    </body>
</html>
