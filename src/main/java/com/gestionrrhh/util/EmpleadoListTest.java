package com.gestionrrhh.util;

import com.gestionrrhh.dao.EmpleadoDAO;
import com.gestionrrhh.model.Empleado;
import java.util.List;

public class EmpleadoListTest {

    public static void main(String[] args) {
        // Crear instancia del DAO
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();

        try {
            // Obtener la lista de empleados
            List<Empleado> empleados = empleadoDAO.obtenerTodosLosEmpleados();

            // Verificar si se han obtenido empleados
            if (empleados != null && !empleados.isEmpty()) {
                System.out.println("Empleados obtenidos con éxito:");

                // Imprimir los detalles de cada empleado
                for (Empleado empleado : empleados) {
                    System.out.println("ID: " + empleado.getIdEmpleado() +
                            ", Nombre: " + empleado.getNombre() +
                            ", Apellido: " + empleado.getApellido() +
                            ", Fecha de Nacimiento: " + empleado.getFechaNacimiento() +
                            ", Género: " + empleado.getGenero() +
                            ", Dirección: " + empleado.getDireccion() +
                            ", Teléfono: " + empleado.getTelefono() +
                            ", Correo Electrónico: " + empleado.getCorreoElectronico());
                }
            } else {
                System.out.println("No se encontraron empleados en la base de datos.");
            }
        } catch (Exception e) {
            System.err.println("Error al obtener la lista de empleados: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
