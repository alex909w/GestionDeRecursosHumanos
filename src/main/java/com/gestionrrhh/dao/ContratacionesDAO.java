package com.gestionrrhh.dao;

import com.gestionrrhh.model.Cargo;
import com.gestionrrhh.model.Contrataciones;
import com.gestionrrhh.model.Departamento;
import com.gestionrrhh.model.Empleado;
import com.gestionrrhh.model.TipoContratacion;
import com.gestionrrhh.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContratacionesDAO {

    // Método para obtener todas las contrataciones
    public List<Contrataciones> obtenerTodasLasContrataciones() {
        List<Contrataciones> contrataciones = new ArrayList<>();
        String sql = "SELECT * FROM contrataciones";  // Cambié el nombre a minúsculas como en la base de datos.

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Contrataciones contratacion = new Contrataciones();
                contratacion.setIdContratacion(rs.getInt("idContratacion"));
                contratacion.setIdDepartamento(rs.getInt("idDepartamento"));
                contratacion.setIdEmpleado(rs.getInt("idEmpleado"));
                contratacion.setIdCargo(rs.getInt("idCargo"));
                contratacion.setIdTipoContratacion(rs.getInt("idTipoContratacion"));
                contratacion.setFechaContratacion(rs.getDate("fechaContratacion"));
                contratacion.setSalario(rs.getDouble("salario"));
                contratacion.setEstado(rs.getBoolean("estado"));  // Ahora usa 'estado' para coincidir con la base de datos.
                contrataciones.add(contratacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contrataciones;
    }

    // Método para agregar una contratación
    public boolean agregarContratacion(Contrataciones contratacion) {
        String sql = "INSERT INTO contrataciones (idDepartamento, idEmpleado, idCargo, idTipoContratacion, fechaContratacion, salario, estado) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, contratacion.getIdDepartamento());
            pstmt.setInt(2, contratacion.getIdEmpleado());
            pstmt.setInt(3, contratacion.getIdCargo());
            pstmt.setInt(4, contratacion.getIdTipoContratacion());
            pstmt.setDate(5, new java.sql.Date(contratacion.getFechaContratacion().getTime()));
            pstmt.setDouble(6, contratacion.getSalario());
            pstmt.setBoolean(7, contratacion.isEstado());  // Usamos 'estado' ahora en lugar de 'gestado'.

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para actualizar una contratación
    public boolean actualizarContratacion(Contrataciones contratacion) {
        String sql = "UPDATE contrataciones SET idDepartamento = ?, idEmpleado = ?, idCargo = ?, idTipoContratacion = ?, fechaContratacion = ?, salario = ?, estado = ? WHERE idContratacion = ?";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, contratacion.getIdDepartamento());
            pstmt.setInt(2, contratacion.getIdEmpleado());
            pstmt.setInt(3, contratacion.getIdCargo());
            pstmt.setInt(4, contratacion.getIdTipoContratacion());
            pstmt.setDate(5, new java.sql.Date(contratacion.getFechaContratacion().getTime()));
            pstmt.setDouble(6, contratacion.getSalario());
            pstmt.setBoolean(7, contratacion.isEstado());  // Usamos 'estado' ahora en lugar de 'gestado'.
            pstmt.setInt(8, contratacion.getIdContratacion());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para eliminar una contratación
    public boolean eliminarContratacion(int idContratacion) {
        String sql = "DELETE FROM contrataciones WHERE idContratacion = ?";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idContratacion);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener una contratación por su ID
    public Contrataciones obtenerContratacionPorId(int idContratacion) {
        Contrataciones contratacion = null;
        String sql = "SELECT * FROM contrataciones WHERE idContratacion = ?";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idContratacion);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    contratacion = new Contrataciones();
                    contratacion.setIdContratacion(rs.getInt("idContratacion"));
                    contratacion.setIdDepartamento(rs.getInt("idDepartamento"));
                    contratacion.setIdEmpleado(rs.getInt("idEmpleado"));
                    contratacion.setIdCargo(rs.getInt("idCargo"));
                    contratacion.setIdTipoContratacion(rs.getInt("idTipoContratacion"));
                    contratacion.setFechaContratacion(rs.getDate("fechaContratacion"));
                    contratacion.setSalario(rs.getDouble("salario"));
                    contratacion.setEstado(rs.getBoolean("estado"));  // Usamos 'estado' ahora en lugar de 'gestado'.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contratacion;
    }

    // Método para obtener el nombre del departamento por su ID
    public String obtenerNombreDepartamento(int idDepartamento) {
        String sql = "SELECT nombreDepartamento FROM departamento WHERE idDepartamento = ?";
        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idDepartamento);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombreDepartamento");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Método para obtener el nombre del empleado por su ID
    public String obtenerNombreEmpleado(int idEmpleado) {
        String sql = "SELECT nombre, apellido FROM empleados WHERE idEmpleado = ?";
        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idEmpleado);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombre") + " " + rs.getString("apellido");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Método para obtener el nombre del cargo por su ID
    public String obtenerNombreCargo(int idCargo) {
        String sql = "SELECT cargo FROM cargos WHERE idCargo = ?";
        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCargo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("cargo");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Método para obtener el tipo de contratación por su ID
    public String obtenerTipoContratacion(int idTipoContratacion) {
        String sql = "SELECT tipoContratacion FROM tipoContratacion WHERE idTipoContratacion = ?";
        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idTipoContratacion);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("tipoContratacion");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Departamento> obtenerTodosDepartamentos() {
        List<Departamento> departamentos = new ArrayList<>();
        String sql = "SELECT idDepartamento, nombreDepartamento, descripcionDepartamento FROM departamento";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Departamento departamento = new Departamento();
                departamento.setIdDepartamento(rs.getInt("idDepartamento"));
                departamento.setNombreDepartamento(rs.getString("nombreDepartamento"));
                departamento.setDescripcionDepartamento(rs.getString("descripcionDepartamento"));
                departamentos.add(departamento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departamentos;
    }

    public List<Empleado> obtenerTodosEmpleados() {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT idEmpleado, nombre, apellido, fechaNacimiento, genero, direccion, telefono, correoElectronico FROM empleados";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Empleado empleado = new Empleado();
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setNombre(rs.getString("nombre"));
                empleado.setApellido(rs.getString("apellido"));
                empleado.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                empleado.setGenero(rs.getString("genero"));
                empleado.setDireccion(rs.getString("direccion"));
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setCorreoElectronico(rs.getString("correoElectronico"));
                empleados.add(empleado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return empleados;
    }

    public List<Cargo> obtenerTodosCargos() {
        List<Cargo> cargos = new ArrayList<>();
        String sql = "SELECT idCargo, cargo, descripcionCargo, jefatura FROM cargos";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Cargo cargo = new Cargo();
                cargo.setIdCargo(rs.getInt("idCargo"));
                cargo.setCargo(rs.getString("cargo"));
                cargo.setDescripcionCargo(rs.getString("descripcionCargo"));
                cargo.setJefatura(rs.getBoolean("jefatura"));
                cargos.add(cargo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cargos;
    }

    public List<TipoContratacion> obtenerTodosTiposContratacion() {
        List<TipoContratacion> tiposContratacion = new ArrayList<>();
        String sql = "SELECT idTipoContratacion, tipoContratacion FROM tipocontratacion";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                TipoContratacion tipoContratacion = new TipoContratacion();
                tipoContratacion.setIdTipoContratacion(rs.getInt("idTipoContratacion"));
                tipoContratacion.setTipoContratacion(rs.getString("tipoContratacion"));
                tiposContratacion.add(tipoContratacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tiposContratacion;
    }

}
