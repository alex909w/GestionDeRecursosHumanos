package com.gestionrrhh.dao;

import com.gestionrrhh.model.Contrataciones;
import com.gestionrrhh.util.DatabaseUtil;
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

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

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

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

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

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

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

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

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
}
