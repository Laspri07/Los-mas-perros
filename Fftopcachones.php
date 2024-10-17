<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include("conexion2.php"); // Asegúrate de que este archivo conecta a la base de datos

$sql = "SELECT Nombre_usuario, cachos FROM cliente ORDER BY cachos DESC LIMIT 10";
$result = $conn->query($sql);

if ($result) {
    // Empieza la salida del HTML
    echo "<ul>";
    while ($row = $result->fetch_assoc()) {
        // Crea un elemento de lista para cada usuario
        echo "<li>{$row['Nombre_usuario']} - {$row['cachos']} Cachos</li>";
    }
    echo "</ul>";
} else {
    echo "Error en la consulta: " . $conn->error; // Mensaje de error si falla la consulta
}

$conn->close();
?>








