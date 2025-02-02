<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Empleados</title>
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
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h3 class="mb-0"><i class="fas fa-users mr-2"></i>Lista de Empleados</h3>
            <a href="/GestionDeRecursosHumanos_war/views/agregarEmpleado.jsp" class="btn btn-light">
                <i class="fas fa-user-plus mr-2"></i>Nuevo Empleado
            </a>
        </div>

        <div class="card-body">
            <!-- Barra de Búsqueda y Filtros -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar empleado...">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 text-right">
                    <div class="btn-group">
                        <button type="button" class="btn btn-outline-secondary">Todos</button>
                        <button type="button" class="btn btn-outline-secondary">Activos</button>
                        <button type="button" class="btn btn-outline-secondary">Inactivos</button>
                    </div>
                </div>
            </div>

            <!-- Tabla de Empleados -->
            <div class="table-responsive">
                <table class="table table-hover table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Contacto</th>
                        <th>Fecha Nacimiento</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="empleado" items="${empleados}">
                        <tr>
                            <td>${empleado.idEmpleado}</td>
                            <td>${empleado.nombre}</td>
                            <td>${empleado.apellido}</td>
                            <td>
                                <div><i class="fas fa-phone mr-2"></i>${empleado.telefono}</div>
                                <div><i class="fas fa-envelope mr-2"></i>${empleado.correoElectronico}</div>
                            </td>
                            <td>${empleado.fechaNacimiento}</td>
                            <td>
                                <span class="badge badge-success">Activo</span>
                            </td>
                            <td class="text-nowrap">
                                <a href="empleados?action=editar&idEmpleado=${empleado.idEmpleado}"
                                   class="btn btn-sm btn-warning" title="Editar">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="empleados?action=eliminar&idEmpleado=${empleado.idEmpleado}"
                                   class="btn btn-sm btn-danger" title="Eliminar"
                                   onclick="return confirm('¿Está seguro de eliminar este empleado?');">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                                <button class="btn btn-sm btn-info" title="Detalles">
                                    <i class="fas fa-info-circle"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Paginación -->
            <nav aria-label="Navegación de página">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Anterior</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </nav>
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