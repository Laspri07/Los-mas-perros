<?php
header('Content-Type: application/json'); // Indica que se devuelve JSON

// Configuración de conexión a la base de datos
$host = "localhost"; // Puede variar según tu servidor
$usuario = "root"; // Usuario de la base de datos
$contraseña = ""; // Contraseña del usuario
$base_datos = "bdproveedor"; // Nombre de la base de datos

// Crear la conexión
$conn = new mysqli($host, $usuario, $contraseña, $base_datos);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Consulta para obtener las 10 personas que más cachos tienen
$sql = "SELECT Nombre, Apellido, cachos FROM cliente WHERE cachos IS NOT NULL ORDER BY cachos DESC LIMIT 10";
$result = $conn->query($sql);

// Array para almacenar los resultados
$ranking = [];
if ($result->num_rows > 0) {
    // Almacenar resultados en un array
    while ($row = $result->fetch_assoc()) {
        $ranking[] = $row;
    }
}

// Cerrar la conexión
$conn->close();

// Devolver el resultado en formato JSON
echo json_encode($ranking);
?>
