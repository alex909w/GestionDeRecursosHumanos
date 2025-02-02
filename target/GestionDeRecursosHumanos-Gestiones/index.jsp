<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Constantes
    final String LOGO_URL = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/UDB_vertical_fondo_claro.png/220px-UDB_vertical_fondo_claro.png";
    final String[] STATISTICS = {
            "bg-info|fas fa-users|1,240|Empleados Activos",
            "bg-success|fas fa-building|24|Departamentos",
            "bg-warning|fas fa-file-contract|356|Contratos Activos",
            "bg-danger|fas fa-briefcase|15|Posiciones Abiertas"
    };
    final String[] MODULES = {
            "Gestión de Empleados|fas fa-user-tie|text-primary|empleados|btn-primary|Administración completa de información personal, laboral y contractual|Acceder",
            "Estructura Organizacional|fas fa-sitemap|text-success|departamentos|btn-success|Gestión de departamentos, cargos y estructura jerárquica|Explorar",
            "Contrataciones|fas fa-file-signature|text-warning|contrataciones|btn-warning|Procesos de reclutamiento, selección y tipos de contratación|Gestionar"
    };
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>RRHH UDB</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .feature-card { transition: transform 0.3s; }
        .feature-card:hover { transform: translateY(-5px); }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<header class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/GestionDeContratacion">
            <img src="<%= LOGO_URL %>" width="40" height="40" class="d-inline-block align-top" alt="Logo RRHH">
            Gestión RRHH
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/GestionDeRecursosHumanos_war/views/listarEmpleados.jsp">Empleados</a>
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
    <div class="text-center mb-5">
        <h1 class="display-4 mb-3">Gestión Integral de Recursos Humanos</h1>
        <p class="lead text-muted">Sistema completo para la administración de personal y estructura organizacional</p>
    </div>

    <!-- Estadísticas Rápidas -->
    <div class="row mb-5">
        <% for (String stat : STATISTICS) {
            String[] parts = stat.split("\\|");
        %>
        <div class="col-md-3 mb-4">
            <div class="card <%= parts[0] %> text-center shadow">
                <div class="card-body text-white">
                    <h5><i class="<%= parts[1] %> fa-3x mb-3"></i></h5>
                    <h3><%= parts[2] %></h3>
                    <p class="mb-0"><%= parts[3] %></p>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Módulos Principales -->
    <div class="row">
        <% for (String module : MODULES) {
            String[] parts = module.split("\\|");
        %>
        <div class="col-md-4 mb-4">
            <div class="card feature-card h-100 shadow">
                <div class="card-body text-center">
                    <i class="<%= parts[1] %> fa-4x <%= parts[2] %> mb-4"></i>
                    <h3 class="card-title"><%= parts[0] %></h3>
                    <p class="card-text"><%= parts[5] %></p>
                    <a href="<%= parts[3] %>" class="btn <%= parts[4] %> mt-3"><%= parts[6] %></a>
                </div>
            </div>
        </div>
        <% } %>
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

<!-- Scripts Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>