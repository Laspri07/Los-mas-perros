<?php
// Conexión a la base de datos
$host = "localhost";
$user = "root";  // Cambiar si tu usuario es diferente
$password = "";  // Cambiar si tienes contraseña
$dbname = "bdgeneral";

// Crear conexión
$conn = new mysqli($host, $user, $password, $dbname);

// Verificar si la conexión fue exitosa
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si el formulario fue enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recoger los datos del formulario
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $numerodocu = $_POST['numerodocu'];
    $comentario = $_POST['comentario'];

    // Manejo de archivos
    if (isset($_FILES['archivo']) && $_FILES['archivo']['error'] == 0) {
        $archivo = file_get_contents($_FILES['archivo']['tmp_name']);
    } else {
        $archivo = NULL;
    }

    // Preparar la consulta SQL
    $stmt = $conn->prepare("INSERT INTO comentario (Comentario, Numerodocu, Archivo) VALUES (?, ?, ?)");
    $stmt->bind_param("sis", $comentario, $numerodocu, $archivo);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo "Comentario registrado correctamente.";
    } else {
        echo "Error al registrar el comentario: " . $conn->error;
    }

    // Cerrar la declaración y la conexión
    $stmt->close();
    $conn->close();
}
?>
