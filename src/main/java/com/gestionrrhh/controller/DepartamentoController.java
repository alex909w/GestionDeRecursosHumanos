package com.gestionrrhh.controller;

import com.gestionrrhh.dao.DepartamentoDAO;
import com.gestionrrhh.model.Departamento;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/departamentos")
public class DepartamentoController extends HttpServlet {

    private DepartamentoDAO departamentoDAO;

    @Override
    public void init() {
        departamentoDAO = new DepartamentoDAO();
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
                eliminarDepartamento(request, response);
                break;
            default:
                listarDepartamentos(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            agregarDepartamento(request, response);
        } else if ("editar".equals(action)) {
            actualizarDepartamento(request, response);
        }
    }

    private void listarDepartamentos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Departamento> departamentos = departamentoDAO.obtenerTodosLosDepartamentos();
            request.setAttribute("departamentos", departamentos);
            request.getRequestDispatcher("/views/listarDepartamentos.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "No se pudo cargar la lista de departamentos.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/agregarDepartamento.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int idDepartamento = Integer.parseInt(request.getParameter("idDepartamento"));
            Departamento departamento = departamentoDAO.obtenerDepartamentoPorId(idDepartamento);

            if (departamento == null) {
                request.setAttribute("error", "Departamento no encontrado.");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
                return;
            }

            // Verifica que el departamento tiene la descripción correctamente cargada
            System.out.println("Descripcion Departamento: " + departamento.getDescripcionDepartamento()); // Depuración

            // Pasa el objeto Departamento al JSP
            request.setAttribute("departamento", departamento);
            request.getRequestDispatcher("/views/editarDepartamento.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID de departamento inválido.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    private void agregarDepartamento(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Departamento departamento = new Departamento();
        departamento.setNombreDepartamento(request.getParameter("nombreDepartamento"));
        departamento.setDescripcionDepartamento(request.getParameter("descripcionDepartamento"));

        try {
            boolean success = departamentoDAO.agregarDepartamento(departamento);
            if (success) {
                response.sendRedirect("departamentos");
            } else {
                request.setAttribute("error", "Error al agregar el departamento.");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al agregar el departamento.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    private void actualizarDepartamento(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int idDepartamento = Integer.parseInt(request.getParameter("idDepartamento"));
        Departamento departamento = new Departamento();
        departamento.setIdDepartamento(idDepartamento);
        departamento.setNombreDepartamento(request.getParameter("nombreDepartamento"));
        departamento.setDescripcionDepartamento(request.getParameter("descripcionDepartamento"));

        try {
            boolean success = departamentoDAO.actualizarDepartamento(departamento);
            if (success) {
                response.sendRedirect("departamentos");
            } else {
                request.setAttribute("error", "Error al actualizar el departamento.");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al actualizar el departamento.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    private void eliminarDepartamento(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int idDepartamento = Integer.parseInt(request.getParameter("idDepartamento"));

        try {
            boolean success = departamentoDAO.eliminarDepartamento(idDepartamento);
            if (success) {
                response.sendRedirect("departamentos");
            } else {
                request.setAttribute("error", "Error al eliminar el departamento.");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al eliminar el departamento.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }
}
