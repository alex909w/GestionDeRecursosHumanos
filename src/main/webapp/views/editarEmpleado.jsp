<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Empleado - Gestión RRHH</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Editar Empleado</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para editar empleado -->
            <form action="empleados" method="post">
                <input type="hidden" name="action" value="editar">
                <input type="hidden" name="idEmpleado" value="${empleado.idEmpleado}">

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="${empleado.nombre}"
                           pattern="[A-Za-z\s]+" title="Solo se permiten letras y espacios" required>
                </div>

                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="${empleado.apellido}"
                           pattern="[A-Za-z\s]+" title="Solo se permiten letras y espacios" required>
                </div>

                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" class="form-control" id="telefono" name="telefono" value="${empleado.telefono}"
                           pattern="^[0-9-]+$" title="Solo se permiten numeros y un guion" required>
                </div>

                <div class="form-group">
                    <label for="correoElectronico">Correo Electrónico:</label>
                    <input type="email" class="form-control" id="correoElectronico" name="correoElectronico" value="${empleado.correoElectronico}" required>
                </div>

                <div class="form-group">
                    <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" value="${empleado.fechaNacimiento}" required>
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

                <button type="submit" class="btn btn-primary btn-lg">Actualizar</button>
                <a href="empleados" class="btn btn-secondary btn-lg">Volver a la Página Anterior</a>
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
