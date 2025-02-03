package com.gestionrrhh.controller;

import com.gestionrrhh.dao.TipoContratacionDAO;
import com.gestionrrhh.model.TipoContratacion;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tiposcontratacion")
public class TipoContratacionController extends HttpServlet {

    private TipoContratacionDAO tipoContratacionDAO;

    @Override
    public void init() {
        tipoContratacionDAO = new TipoContratacionDAO();
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
                eliminarTipoContratacion(request, response);
                break;
            default:
                listarTiposContratacion(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            agregarTipoContratacion(request, response);
        } else if ("editar".equals(action)) {
            actualizarTipoContratacion(request, response);
        }
    }

    private void listarTiposContratacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TipoContratacion> tiposContratacion = tipoContratacionDAO.obtenerTodosLosTiposContratacion();
        request.setAttribute("tiposContratacion", tiposContratacion);
        request.getRequestDispatcher("/views/listarTiposContratacion.jsp").forward(request, response);
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/agregarTipoContratacion.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idTipoContratacion = Integer.parseInt(request.getParameter("idTipoContratacion"));
        TipoContratacion tipoContratacion = tipoContratacionDAO.obtenerTipoContratacionPorId(idTipoContratacion);
        request.setAttribute("tipoContratacion", tipoContratacion);
        request.getRequestDispatcher("/views/editarTipoContratacion.jsp").forward(request, response);
    }

    private void agregarTipoContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TipoContratacion tipoContratacion = new TipoContratacion();
        tipoContratacion.setTipoContratacion(request.getParameter("tipoContratacion"));

        tipoContratacionDAO.agregarTipoContratacion(tipoContratacion);
        response.sendRedirect("tiposcontratacion");
    }

    private void actualizarTipoContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idTipoContratacion = Integer.parseInt(request.getParameter("idTipoContratacion"));
        TipoContratacion tipoContratacion = new TipoContratacion();
        tipoContratacion.setIdTipoContratacion(idTipoContratacion);
        tipoContratacion.setTipoContratacion(request.getParameter("tipoContratacion"));

        tipoContratacionDAO.actualizarTipoContratacion(tipoContratacion);
        response.sendRedirect("tiposcontratacion");
    }

    private void eliminarTipoContratacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idTipoContratacion = Integer.parseInt(request.getParameter("idTipoContratacion"));
        tipoContratacionDAO.eliminarTipoContratacion(idTipoContratacion);
        response.sendRedirect("tiposcontratacion");
    }
}