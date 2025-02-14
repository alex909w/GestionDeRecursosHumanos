package com.gestionrrhh.controller;

import com.gestionrrhh.dao.EmpleadoDAO;
import com.gestionrrhh.model.Empleado;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/empleados")
public class EmpleadoController extends HttpServlet {

    private EmpleadoDAO empleadoDAO;

    @Override
    public void init() {
        empleadoDAO = new EmpleadoDAO();  // Aseguramos que el DAO se inicializa correctamente
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar";  // Default action to list empleados
        }

        switch (action) {
            case "agregar":
                mostrarFormularioAgregar(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            case "info":
                infoEmpleado(request, response);
                break;
            case "eliminar":
                eliminarEmpleado(request, response);
                break;
            default:
                listarEmpleados(request, response);  // Listar empleados si no se recibe una acción
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            agregarEmpleado(request, response);
        } else if ("editar".equals(action)) {
            actualizarEmpleado(request, response);
        }
    }

    private void listarEmpleados(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtención de todos los empleados desde la base de datos
        List<Empleado> empleados = empleadoDAO.obtenerTodosLosEmpleados();
        System.out.println("Empleados obtenidos: " + empleados.size());  // Verifica cuántos empleados fueron recuperados

        // Verificar si se están obteniendo empleados
        if (empleados.isEmpty()) {
            System.out.println("No se encontraron empleados en la base de datos.");
        }

        // Pasamos la lista de empleados a la vista JSP
        request.setAttribute("empleados", empleados);
        request.getRequestDispatcher("views/listarEmpleados.jsp").forward(request, response);
    }
    
        private void infoEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            Empleado empleado = empleadoDAO.obtenerEmpleadoPorId(idEmpleado);
            if (empleado != null) {
                request.setAttribute("empleado", empleado);
                request.getRequestDispatcher("/views/infoEmpleado.jsp").forward(request, response);
            } else {
                response.sendRedirect("empleados");  // Redirigir si no se encuentra el empleado
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("empleados");  // Redirigir si el ID es inválido
        }
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/agregarEmpleado.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            Empleado empleado = empleadoDAO.obtenerEmpleadoPorId(idEmpleado);
            if (empleado != null) {
                request.setAttribute("empleado", empleado);
                request.getRequestDispatcher("/views/editarEmpleado.jsp").forward(request, response);
            } else {
                response.sendRedirect("empleados");  // Redirigir si no se encuentra el empleado
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("empleados");  // Redirigir si el ID es inválido
        }
    }

    private void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Empleado empleado = new Empleado();
        empleado.setNombre(request.getParameter("nombre"));
        empleado.setApellido(request.getParameter("apellido"));
        empleado.setFechaNacimiento(java.sql.Date.valueOf(request.getParameter("fechaNacimiento")));
        empleado.setGenero(request.getParameter("genero"));
        empleado.setDireccion(request.getParameter("direccion"));
        empleado.setTelefono(request.getParameter("telefono"));
        empleado.setCorreoElectronico(request.getParameter("correoElectronico"));

        if (empleadoDAO.agregarEmpleado(empleado)) {
            int idEmpleado = empleado.getIdEmpleado(); // Asegúrate de que tu DAO devuelva el ID generado
        
        // Redirigir al formulario de contratación con el ID del empleado
            response.sendRedirect("contrataciones?action=agregar&idEmpleado=" + idEmpleado);  // Redirigir al servlet para refrescar la lista
        } else {
            response.sendRedirect("error.jsp");  // Si hay error, redirigir a error.jsp
        }
    }

    private void actualizarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        Empleado empleado = new Empleado();
        empleado.setIdEmpleado(idEmpleado);
        empleado.setNombre(request.getParameter("nombre"));
        empleado.setApellido(request.getParameter("apellido"));
        empleado.setFechaNacimiento(java.sql.Date.valueOf(request.getParameter("fechaNacimiento")));
        empleado.setGenero(request.getParameter("genero"));
        empleado.setDireccion(request.getParameter("direccion"));
        empleado.setTelefono(request.getParameter("telefono"));
        empleado.setCorreoElectronico(request.getParameter("correoElectronico"));

        if (empleadoDAO.actualizarEmpleado(empleado)) {
            response.sendRedirect("empleados");  // Redirigir al servlet para refrescar la lista
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            if (empleadoDAO.eliminarEmpleado(idEmpleado)) {
                response.sendRedirect("empleados");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("empleados");  // Redirigir si el ID es inválido
        }
    }
}
