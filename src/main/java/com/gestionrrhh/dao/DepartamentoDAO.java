package com.gestionrrhh.dao;

import com.gestionrrhh.model.Departamento;
import com.gestionrrhh.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO {

    // Método para obtener todos los departamentos
    public List<Departamento> obtenerTodosLosDepartamentos() {
        List<Departamento> departamentos = new ArrayList<>();
        String sql = "SELECT * FROM Departamento";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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

    // Método para agregar un departamento
    public boolean agregarDepartamento(Departamento departamento) {
        String sql = "INSERT INTO Departamento (nombreDepartamento, descripcionDepartamento) VALUES (?, ?)";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, departamento.getNombreDepartamento());
            pstmt.setString(2, departamento.getDescripcionDepartamento());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para actualizar un departamento
    public boolean actualizarDepartamento(Departamento departamento) {
        String sql = "UPDATE Departamento SET nombreDepartamento = ?, descripcionDepartamento = ? WHERE idDepartamento = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, departamento.getNombreDepartamento());
            pstmt.setString(2, departamento.getDescripcionDepartamento());
            pstmt.setInt(3, departamento.getIdDepartamento());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un departamento
    public boolean eliminarDepartamento(int idDepartamento) {
        String sql = "DELETE FROM Departamento WHERE idDepartamento = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idDepartamento);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener un departamento por su ID
    public Departamento obtenerDepartamentoPorId(int idDepartamento) {
        Departamento departamento = null;
        String sql = "SELECT * FROM Departamento WHERE idDepartamento = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idDepartamento);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    departamento = new Departamento();
                    departamento.setIdDepartamento(rs.getInt("idDepartamento"));
                    departamento.setNombreDepartamento(rs.getString("nombreDepartamento"));
                    // Si hay más columnas, agrega los setters correspondientes
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departamento;
    }
}