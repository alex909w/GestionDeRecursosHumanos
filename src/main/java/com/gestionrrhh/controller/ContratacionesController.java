package com.gestionrrhh.controller;

import com.gestionrrhh.dao.ContratacionesDAO;
import com.gestionrrhh.model.Contrataciones;
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
        request.setAttribute("contrataciones", contrataciones);
        request.getRequestDispatcher("/views/listarContrataciones.jsp").forward(request, response);
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/agregarContratacion.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idContratacion = Integer.parseInt(request.getParameter("idContratacion"));
        Contrataciones contratacion = contratacionesDAO.obtenerContratacionPorId(idContratacion);
        request.setAttribute("contratacion", contratacion);
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
        contratacion.setEstado(Boolean.parseBoolean(request.getParameter("estado")));  // Usamos 'estado' ahora en lugar de 'gestado'.

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
        contratacion.setEstado(Boolean.parseBoolean(request.getParameter("estado")));  // Usamos 'estado' ahora en lugar de 'gestado'.

        contratacionesDAO.actualizarContratacion(contratacion);
        response.sendRedirect("contrataciones");
    }

    private void eliminarContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idContratacion = Integer.parseInt(request.getParameter("idContratacion"));
        contratacionesDAO.eliminarContratacion(idContratacion);
        response.sendRedirect("contrataciones");
    }
}
