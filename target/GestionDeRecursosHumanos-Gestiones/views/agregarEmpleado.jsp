<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Empleado</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100">
<!-- Header -->
<header class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/GestionDeContratacion">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/UDB_vertical_fondo_claro.png/220px-UDB_vertical_fondo_claro.png" width="40" height="40" class="d-inline-block align-top" alt="Logo RRHH">
            Gestión RRHH
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/GestionDeRecursosHumanos_war">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#empleados">Empleados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#departamentos">Departamentos</a>
                </li>
            </ul>
        </div>
    </div>
</header>


<!-- Contenido Principal -->
<main class="container my-5 flex-grow-1">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0"><i class="fas fa-user-plus mr-2"></i>Nuevo Empleado</h3>
        </div>

        <div class="card-body">
            <form action="empleados" method="post">
                <input type="hidden" name="action" value="agregar">

                <div class="row">
                    <!-- Columna Izquierda -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="nombre"><i class="fas fa-id-card mr-2"></i>Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <div class="form-group">
                            <label for="apellido"><i class="fas fa-id-card mr-2"></i>Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" required>
                        </div>

                        <div class="form-group">
                            <label for="fechaNacimiento"><i class="fas fa-birthday-cake mr-2"></i>Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
                        </div>

                        <div class="form-group">
                            <label for="genero"><i class="fas fa-venus-mars mr-2"></i>Género</label>
                            <select class="form-control" id="genero" name="genero" required>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                                <option value="O">Otro</option>
                            </select>
                        </div>
                    </div>

                    <!-- Columna Derecha -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="direccion"><i class="fas fa-map-marker-alt mr-2"></i>Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion">
                        </div>

                        <div class="form-group">
                            <label for="telefono"><i class="fas fa-phone mr-2"></i>Teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" required>
                        </div>

                        <div class="form-group">
                            <label for="correoElectronico"><i class="fas fa-envelope mr-2"></i>Correo Electrónico</label>
                            <input type="email" class="form-control" id="correoElectronico" name="correoElectronico" required>
                        </div>

                        <div class="form-group">
                            <label for="departamento"><i class="fas fa-building mr-2"></i>Departamento</label>
                            <select class="form-control" id="departamento" name="departamento">
                                <option value="1">Recursos Humanos</option>
                                <option value="2">Tecnología</option>
                                <option value="3">Ventas</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Botones -->
                <div class="text-right mt-4">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="fas fa-save mr-2"></i>Guardar
                    </button>
                    <a href="empleados" class="btn btn-secondary btn-lg">
                        <i class="fas fa-times-circle mr-2"></i>Cancelar
                    </a>
                </div>
            </form>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-dark text-white mt-5">
    <div class="container py-4">
        <div class="row">
            <div class="col-md-4">
                <h5>Contacto</h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-phone mr-2"></i>2251-8200</li>
                    <li><i class="fas fa-envelope mr-2 "></i><a href="mailto:rrhh@udb.edu.sv" class="text-white">rrhh@udb.edu.sv</a></li>
                </ul>
            </div>

            <div class="col-md-4">
                <h5>Enlaces Rápidos</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Políticas de Privacidad</a></li>
                    <li><a href="#" class="text-white">Términos de Uso</a></li>
                </ul>
            </div>

            <div class="col-md-4">
                <h5>Síguenos</h5>
                <div class="social-links">
                    <a href="https://www.facebook.com/UDBelsalvador" class="text-white mr-3"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.linkedin.com/school/udbelsalvador/posts/?feedView=all" class="text-white mr-3"><i class="fab fa-linkedin"></i></a>
                    <a href="https://x.com/UDBelsalvador" class="text-white"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
        <div class="text-center mt-3 border-top pt-3">
            <p>&copy; 2025 Gestión RRHH. Todos los derechos reservados.</p>
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>