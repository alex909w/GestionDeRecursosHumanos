<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Página Principal - Gestión RRHH</title>

        <!-- Bootstrap 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <!-- Iconos Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

        <!-- CSS Personalizado -->
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>

        <!-- Encabezado -->
        <div class="header">
            <h1 class="fw-bold">Gestión de Recursos Humanos</h1>
            <p class="lead">Administra empleados, departamentos y más de manera eficiente</p>
        </div>

        <!-- Contenedor principal -->
        <div class="container mt-5">
            <div class="row g-4">

                <!-- Gestión de Empleados -->
                <div class="col-md-4">
                    <a href="empleados" class="text-decoration-none">
                        <div class="card card-custom shadow-sm p-3">
                            <div class="card-body text-center">
                                <i class="bi bi-people-fill fs-1 text-primary"></i>
                                <h5 class="card-title mt-3">Gestión de Empleados</h5>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Gestión de Departamentos -->
                <div class="col-md-4">
                    <a href="departamentos" class="text-decoration-none">
                        <div class="card card-custom shadow-sm p-3">
                            <div class="card-body text-center">
                                <i class="bi bi-building fs-1 text-danger"></i>
                                <h5 class="card-title mt-3">Gestión de Departamentos</h5>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Gestión de Contrataciones -->
                <div class="col-md-4">
                    <a href="contrataciones" class="text-decoration-none">
                        <div class="card card-custom shadow-sm p-3">
                            <div class="card-body text-center">
                                <i class="bi bi-file-earmark-text fs-1 text-success"></i>
                                <h5 class="card-title mt-3">Gestión de Contrataciones</h5>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Gestión de Cargos -->
                <div class="col-md-4">
                    <a href="cargos" class="text-decoration-none">
                        <div class="card card-custom shadow-sm p-3">
                            <div class="card-body text-center">
                                <i class="bi bi-briefcase-fill fs-1 text-info"></i>
                                <h5 class="card-title mt-3">Gestión de Cargos</h5>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <div class="container text-center">
                <p>© 2025 Gestión RRHH. Todos los derechos reservados.</p>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
