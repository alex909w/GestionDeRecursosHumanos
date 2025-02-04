package com.gestionrrhh.controller;

import com.gestionrrhh.dao.CargosDAO;
import com.gestionrrhh.model.Cargo;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cargos")
public class CargosController extends HttpServlet {

    private CargosDAO cargosDAO;

    @Override
    public void init() {
        cargosDAO = new CargosDAO();
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
                eliminarCargo(request, response);
                break;
            default:
                listarCargos(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            agregarCargo(request, response);
        } else if ("editar".equals(action)) {
            actualizarCargo(request, response);
        }
    }

    private void listarCargos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cargo> cargos = cargosDAO.obtenerTodosLosCargos();
        request.setAttribute("cargos", cargos);
        request.getRequestDispatcher("/views/listarCargos.jsp").forward(request, response);
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/agregarCargo.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCargo = Integer.parseInt(request.getParameter("idCargo"));
        Cargo cargo = cargosDAO.obtenerCargoPorId(idCargo);
        request.setAttribute("cargo", cargo);
        request.getRequestDispatcher("/views/editarCargo.jsp").forward(request, response);
    }

    private void agregarCargo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cargo cargo = new Cargo();
        cargo.setCargo(request.getParameter("cargo"));
        cargo.setDescripcionCargo(request.getParameter("descripcionCargo"));
        cargo.setJefatura(Boolean.parseBoolean(request.getParameter("jefatura")));

        cargosDAO.agregarCargo(cargo);
        response.sendRedirect("cargos");
    }

    private void actualizarCargo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idCargo = Integer.parseInt(request.getParameter("idCargo"));
        Cargo cargo = new Cargo();
        cargo.setIdCargo(idCargo);
        cargo.setCargo(request.getParameter("cargo"));
        cargo.setDescripcionCargo(request.getParameter("descripcionCargo"));
        cargo.setJefatura(Boolean.parseBoolean(request.getParameter("jefatura")));

        cargosDAO.actualizarCargo(cargo);
        response.sendRedirect("cargos");
    }

    private void eliminarCargo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idCargo = Integer.parseInt(request.getParameter("idCargo"));
        cargosDAO.eliminarCargo(idCargo);
        response.sendRedirect("cargos");
    }
}