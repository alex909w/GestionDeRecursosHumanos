package com.gestionrrhh.controller;

import com.gestionrrhh.dao.ContratacionesDAO;
import com.gestionrrhh.model.Contrataciones;
import com.gestionrrhh.model.Departamento;
import com.gestionrrhh.model.Empleado;
import com.gestionrrhh.model.TipoContratacion;
import com.gestionrrhh.model.Cargo;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contrataciones")
public class ContratacionesController extends HttpServlet {

    private ContratacionesDAO contratacionesDAO;

    @Override
    public void init() {
        contratacionesDAO = new ContratacionesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "agregar":
                mostrarFormularioAgregar(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            case "eliminar":
                eliminarContratacion(request, response);
                break;
            default:
                listarContrataciones(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            agregarContratacion(request, response);
        } else if ("editar".equals(action)) {
            actualizarContratacion(request, response);
        }
    }

    private void listarContrataciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contrataciones> contrataciones = contratacionesDAO.obtenerTodasLasContrataciones();

        // Cargar los nombres de departamentos, empleados, cargos y tipos de contratación para cada contratacion
        for (Contrataciones contratacion : contrataciones) {
            String nombreDepartamento = contratacionesDAO.obtenerNombreDepartamento(contratacion.getIdDepartamento());
            String nombreEmpleado = contratacionesDAO.obtenerNombreEmpleado(contratacion.getIdEmpleado());
            String nombreCargo = contratacionesDAO.obtenerNombreCargo(contratacion.getIdCargo());
            String tipoContratacion = contratacionesDAO.obtenerTipoContratacion(contratacion.getIdTipoContratacion());

            // Asignar los nombres a la contratacion
            contratacion.setNombreDepartamento(nombreDepartamento);
            contratacion.setNombreEmpleado(nombreEmpleado);
            contratacion.setNombreCargo(nombreCargo);
            contratacion.setTipoContratacion(tipoContratacion);
        }

        // Pasar la lista de contrataciones al request
        request.setAttribute("contrataciones", contrataciones);

        // Mostrar la vista de lista de contrataciones
        request.getRequestDispatcher("/views/listarContrataciones.jsp").forward(request, response);
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Obtener las listas de departamentos, empleados, cargos y tipos de contratación
    List<Departamento> departamentos = contratacionesDAO.obtenerTodosDepartamentos();
    List<Empleado> empleados = contratacionesDAO.obtenerTodosEmpleados();
    List<Cargo> cargos = contratacionesDAO.obtenerTodosCargos();
    List<TipoContratacion> tiposContratacion = contratacionesDAO.obtenerTodosTiposContratacion();

    // Obtener el ID del empleado si se proporcionó
    String idEmpleadoStr = request.getParameter("idEmpleado");
    if (idEmpleadoStr != null && !idEmpleadoStr.isEmpty()) {
        try {
            int idEmpleado = Integer.parseInt(idEmpleadoStr);
            request.setAttribute("idEmpleadoSeleccionado", idEmpleado);
        } catch (NumberFormatException e) {
            // Manejar error si es necesario
        }
    }

    // Pasar los datos al request para que estén disponibles en el JSP
    request.setAttribute("departamentos", departamentos);
    request.setAttribute("empleados", empleados);
    request.setAttribute("cargos", cargos);
    request.setAttribute("tiposContratacion", tiposContratacion);

    // Redirigir a la vista de agregar
    request.getRequestDispatcher("/views/agregarContratacion.jsp").forward(request, response);
}

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idContratacion = Integer.parseInt(request.getParameter("idContratacion"));

        // Obtener la contratación por ID
        Contrataciones contratacion = contratacionesDAO.obtenerContratacionPorId(idContratacion);

        // Obtener las listas de departamentos, empleados, cargos y tipos de contratación
        List<Departamento> departamentos = contratacionesDAO.obtenerTodosDepartamentos();
        List<Empleado> empleados = contratacionesDAO.obtenerTodosEmpleados();
        List<Cargo> cargos = contratacionesDAO.obtenerTodosCargos();
        List<TipoContratacion> tiposContratacion = contratacionesDAO.obtenerTodosTiposContratacion();

        // Pasar los datos al request para que estén disponibles en el JSP
        request.setAttribute("contratacion", contratacion);
        request.setAttribute("departamentos", departamentos);
        request.setAttribute("empleados", empleados);
        request.setAttribute("cargos", cargos);
        request.setAttribute("tiposContratacion", tiposContratacion);

        // Redirigir a la vista de edición
        request.getRequestDispatcher("/views/editarContratacion.jsp").forward(request, response);
    }

    private void agregarContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Contrataciones contratacion = new Contrataciones();
        contratacion.setIdDepartamento(Integer.parseInt(request.getParameter("idDepartamento")));
        contratacion.setIdEmpleado(Integer.parseInt(request.getParameter("idEmpleado")));
        contratacion.setIdCargo(Integer.parseInt(request.getParameter("idCargo")));
        contratacion.setIdTipoContratacion(Integer.parseInt(request.getParameter("idTipoContratacion")));
        contratacion.setFechaContratacion(java.sql.Date.valueOf(request.getParameter("fechaContratacion")));
        contratacion.setSalario(Double.parseDouble(request.getParameter("salario")));
        contratacion.setEstado(Boolean.parseBoolean(request.getParameter("estado")));

        contratacionesDAO.agregarContratacion(contratacion);
        response.sendRedirect("contrataciones");
    }

    private void actualizarContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idContratacion = Integer.parseInt(request.getParameter("idContratacion"));
        Contrataciones contratacion = new Contrataciones();
        contratacion.setIdContratacion(idContratacion);
        contratacion.setIdDepartamento(Integer.parseInt(request.getParameter("idDepartamento")));
        contratacion.setIdEmpleado(Integer.parseInt(request.getParameter("idEmpleado")));
        contratacion.setIdCargo(Integer.parseInt(request.getParameter("idCargo")));
        contratacion.setIdTipoContratacion(Integer.parseInt(request.getParameter("idTipoContratacion")));
        contratacion.setFechaContratacion(java.sql.Date.valueOf(request.getParameter("fechaContratacion")));
        contratacion.setSalario(Double.parseDouble(request.getParameter("salario")));
        contratacion.setEstado(Boolean.parseBoolean(request.getParameter("estado")));

        contratacionesDAO.actualizarContratacion(contratacion);
        response.sendRedirect("contrataciones");
    }

    private void eliminarContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idContratacion = Integer.parseInt(request.getParameter("idContratacion"));
        contratacionesDAO.eliminarContratacion(idContratacion);
        response.sendRedirect("contrataciones");
    }
}
