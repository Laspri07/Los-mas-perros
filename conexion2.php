<?php
// Configuración de conexión a la base de datos
$host = "localhost"; // Puede variar según tu servidor
$usuario = "root"; // Usuario de la base de datos
$contraseña = ""; // Contraseña del usuario
$base_datos = "bdgeneral"; // Nombre de la base de datos

// Crear la conexión
$conn = new mysqli($host, $usuario, $contraseña, $base_datos);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>