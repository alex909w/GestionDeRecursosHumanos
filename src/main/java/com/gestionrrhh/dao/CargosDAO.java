package com.gestionrrhh.dao;

import com.gestionrrhh.model.Cargos;
import com.gestionrrhh.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CargosDAO {

    // Método para obtener todos los cargos
    public List<Cargos> obtenerTodosLosCargos() {
        List<Cargos> cargos = new ArrayList<>();
        String sql = "SELECT * FROM Cargos";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Cargos cargo = new Cargos();
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

    // Método para agregar un cargo
    public boolean agregarCargo(Cargos cargo) {
        String sql = "INSERT INTO Cargos (cargo, descripcionCargo, jefatura) VALUES (?, ?, ?)";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, cargo.getCargo());
            pstmt.setString(2, cargo.getDescripcionCargo());
            pstmt.setBoolean(3, cargo.isJefatura());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para actualizar un cargo
    public boolean actualizarCargo(Cargos cargo) {
        String sql = "UPDATE Cargos SET cargo = ?, descripcionCargo = ?, jefatura = ? WHERE idCargo = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, cargo.getCargo());
            pstmt.setString(2, cargo.getDescripcionCargo());
            pstmt.setBoolean(3, cargo.isJefatura());
            pstmt.setInt(4, cargo.getIdCargo());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un cargo
    public boolean eliminarCargo(int idCargo) {
        String sql = "DELETE FROM Cargos WHERE idCargo = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCargo);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener un cargo por su ID
    public Cargos obtenerCargoPorId(int idCargo) {
        Cargos cargo = null;
        String sql = "SELECT * FROM Cargos WHERE idCargo = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCargo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cargo = new Cargos();
                    cargo.setIdCargo(rs.getInt("idCargo"));
                    cargo.setCargo(rs.getString("cargo"));
                    cargo.setDescripcionCargo(rs.getString("descripcionCargo"));
                    cargo.setJefatura(rs.getBoolean("jefatura"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cargo;
    }
}