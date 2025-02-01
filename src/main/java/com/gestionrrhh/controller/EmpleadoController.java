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

        // Verificar si se cargaron empleados
        if (empleados.isEmpty()) {
            System.out.println("No se encontraron empleados.");
        } else {
            System.out.println("Se encontraron " + empleados.size() + " empleados.");
            for (Empleado empleado : empleados) {
                System.out.println("Empleado ID: " + empleado.getIdEmpleado() + ", Nombre: " + empleado.getNombre());
            }
        }

        // Pasamos la lista de empleados a la vista JSP
        request.setAttribute("empleados", empleados);  // Pasamos los datos a la vista
        request.getRequestDispatcher("/views/listarEmpleados.jsp").forward(request, response);  // Redirigimos a la vista JSP
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
            response.sendRedirect("empleados");  // Redirigir al servlet para refrescar la lista
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