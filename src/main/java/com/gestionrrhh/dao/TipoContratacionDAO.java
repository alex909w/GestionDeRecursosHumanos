package com.gestionrrhh.dao;

import com.gestionrrhh.model.TipoContratacion;
import com.gestionrrhh.util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoContratacionDAO {

    // Método para obtener todos los tipos de contratación
    public List<TipoContratacion> obtenerTodosLosTiposContratacion() {
        List<TipoContratacion> tiposContratacion = new ArrayList<>();
        String sql = "SELECT * FROM TipoContratacion";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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

    // Método para agregar un tipo de contratación
    public boolean agregarTipoContratacion(TipoContratacion tipoContratacion) {
        String sql = "INSERT INTO TipoContratacion (tipoContratacion) VALUES (?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tipoContratacion.getTipoContratacion());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para actualizar un tipo de contratación
    public boolean actualizarTipoContratacion(TipoContratacion tipoContratacion) {
        String sql = "UPDATE TipoContratacion SET tipoContratacion = ? WHERE idTipoContratacion = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tipoContratacion.getTipoContratacion());
            pstmt.setInt(2, tipoContratacion.getIdTipoContratacion());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un tipo de contratación
    public boolean eliminarTipoContratacion(int idTipoContratacion) {
        String sql = "DELETE FROM TipoContratacion WHERE idTipoContratacion = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idTipoContratacion);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener un tipo de contratación por su ID
    public TipoContratacion obtenerTipoContratacionPorId(int idTipoContratacion) {
        TipoContratacion tipoContratacion = null;
        String sql = "SELECT * FROM TipoContratacion WHERE idTipoContratacion = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idTipoContratacion);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    tipoContratacion = new TipoContratacion();
                    tipoContratacion.setIdTipoContratacion(rs.getInt("idTipoContratacion"));
                    tipoContratacion.setTipoContratacion(rs.getString("tipoContratacion"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tipoContratacion;
    }
}