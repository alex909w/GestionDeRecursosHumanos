package com.gestionrrhh.dao;

import com.gestionrrhh.model.Empleado;
import com.gestionrrhh.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    // Método para obtener todos los empleados
    public List<Empleado> obtenerTodosLosEmpleados() {
        List<Empleado> empleados = new ArrayList<>();
        String query = "SELECT * FROM empleados";
        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pst = conn.prepareStatement(query); ResultSet rs = pst.executeQuery()) {

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
            System.out.println("Error al obtener empleados: " + e.getMessage());
        }
        return empleados;
    }

    // Método para agregar un empleado
    public boolean agregarEmpleado(Empleado empleado) {
        String sql = "INSERT INTO empleados (nombre, apellido, fechaNacimiento, genero, direccion, telefono, correoElectronico) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, empleado.getNombre());
            pstmt.setString(2, empleado.getApellido());
            pstmt.setDate(3, new java.sql.Date(empleado.getFechaNacimiento().getTime()));
            pstmt.setString(4, empleado.getGenero());
            pstmt.setString(5, empleado.getDireccion());
            pstmt.setString(6, empleado.getTelefono());
            pstmt.setString(7, empleado.getCorreoElectronico());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al agregar empleado: " + e.getMessage());
            return false;
        }
    }

    // Método para actualizar un empleado
    public boolean actualizarEmpleado(Empleado empleado) {
        String sql = "UPDATE empleados SET nombre = ?, apellido = ?, fechaNacimiento = ?, genero = ?, direccion = ?, telefono = ?, correoElectronico = ? WHERE idEmpleado = ?";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, empleado.getNombre());
            pstmt.setString(2, empleado.getApellido());
            pstmt.setDate(3, new java.sql.Date(empleado.getFechaNacimiento().getTime()));
            pstmt.setString(4, empleado.getGenero());
            pstmt.setString(5, empleado.getDireccion());
            pstmt.setString(6, empleado.getTelefono());
            pstmt.setString(7, empleado.getCorreoElectronico());
            pstmt.setInt(8, empleado.getIdEmpleado());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al actualizar empleado: " + e.getMessage());
            return false;
        }
    }

    // Método para eliminar un empleado
    public boolean eliminarEmpleado(int idEmpleado) {
        String sql = "DELETE FROM empleados WHERE idEmpleado = ?";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idEmpleado);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar empleado: " + e.getMessage());
            return false;
        }
    }

    // Método para obtener un empleado por su ID
    public Empleado obtenerEmpleadoPorId(int idEmpleado) {
        Empleado empleado = null;
        String sql = "SELECT * FROM empleados WHERE idEmpleado = ?";

        try (Connection conn = ConexionBD.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idEmpleado);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    empleado = new Empleado();
                    empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                    empleado.setNombre(rs.getString("nombre"));
                    empleado.setApellido(rs.getString("apellido"));
                    empleado.setFechaNacimiento(rs.getDate("fechaNacimiento"));
                    empleado.setGenero(rs.getString("genero"));
                    empleado.setDireccion(rs.getString("direccion"));
                    empleado.setTelefono(rs.getString("telefono"));
                    empleado.setCorreoElectronico(rs.getString("correoElectronico"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener empleado por ID: " + e.getMessage());
        }
        return empleado;
    }
}
