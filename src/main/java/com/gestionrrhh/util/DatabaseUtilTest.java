package com.gestionrrhh.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseUtilTest {
    public static void main(String[] args) {
        try (Connection conn = ConexionBD.getConnection()) {
            // Verificar si la conexión es válida
            if (conn != null && !conn.isClosed()) {
                System.out.println("Conexión exitosa a la base de datos.");

                // Probar una simple consulta para confirmar que la base de datos responde
                try (Statement stmt = conn.createStatement()) {
                    String query = "SELECT 1"; // Consulta simple para verificar la conexión
                    stmt.executeQuery(query);
                    System.out.println("La base de datos respondió correctamente.");
                } catch (SQLException e) {
                    System.err.println("Error al ejecutar la consulta: " + e.getMessage());
                }
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
