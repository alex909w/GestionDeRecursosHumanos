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
            <h1 class="fw-bold">Info Empleado</h1>
        </div>

        <div class="container mt-5">
            <!-- Formulario para editar empleado -->
            <form action="empleados" method="post">
                <input type="hidden" name="action" value="editar">
                <input type="hidden" name="idEmpleado" value="${empleado.idEmpleado}">
                
                <div class="card">
                <div class="row g-0">
                  <div class="col-5 col-sm-4">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2NKq73WMdpiUwfNg4DQZ8steAMJNxc-YW7Q&s" class="img-fluid w-100" alt="card-horizontal-image">
                  </div>
                  <div class="col-7 col-sm-8">
                    <div class="card-body">
                      <h5 class="card-title">${empleado.nombre} ${empleado.apellido}</h5>
                      <p class="card-text">Correo Electrónico: ${empleado.correoElectronico}</p>
                      <p class="card-text">Teléfono: ${empleado.telefono}</p>
                      <p class="card-text">Fecha de Nacimiento: ${empleado.fechaNacimiento}</p>
                      <p class="card-text">Teléfono: ${empleado.telefono}</p>
                      <p class="card-text">Género: ${empleado.genero}</p>
                      <p class="card-text">Dirección: ${empleado.direccion}</p>
                    </div>
                  </div>
                </div>
              </div>
                
                      <div class="mt-5">
                <a href="contrataciones" class="btn btn-primary btn-lg mt-">Volver a la Página Anterior</a>
                <a href="index.jsp" class="btn btn-secondary btn-lg">Volver al Menú Principal</a>
                    </div>
            </form>
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
