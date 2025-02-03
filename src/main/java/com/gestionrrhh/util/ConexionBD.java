package com.gestionrrhh.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    // URL de conexión con MySQL, cambiamos el parámetro 'useSSL' a false para evitar advertencias de SSL.
    private static final String URL = "jdbc:mysql://localhost:3306/gestorcontrataciones?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";  // Usuario de MySQL
    private static final String PASSWORD = "";  // Contraseña del usuario (deja vacío si no tienes)

    // Método para obtener la conexión
    public static Connection getConnection() throws SQLException {
        try {
            // Establece la conexión a la base de datos
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new SQLException("Error al conectar con la base de datos: " + e.getMessage(), e);
        }
    }
}
