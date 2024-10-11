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
        $archivo = NULL; // Si no se sube un archivo, se establece como NULL
    }

    // Comprobar si el número de documento existe en la tabla cliente
    $checkStmt = $conn->prepare("SELECT * FROM cliente WHERE Numerodocu = ?");
    $checkStmt->bind_param("i", $numerodocu);
    $checkStmt->execute();
    $result = $checkStmt->get_result();

    if ($result->num_rows == 0) {
        // Mensaje si el número de documento no existe
        echo "<script>alert('El número de documento no está registrado. Debe registrarse primero.');</script>";
        // Redirigir a la página de registro
        header("Location: Ccregistro.html");
        exit(); // Detener el script después de la redirección
    }

    // Preparar la consulta SQL para insertar el comentario
    $stmt = $conn->prepare("INSERT INTO comentario (Comentario, Numerodocu, Archivo) VALUES (?, ?, ?)");
    $stmt->bind_param("sis", $comentario, $numerodocu, $archivo);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo "Comentario registrado correctamente.";
    } else {
        echo "Error al registrar el comentario: " . $stmt->error; // Mensaje de error si falla la inserción
    }

    // Cerrar la declaración y la conexión
    $stmt->close();
    $checkStmt->close(); // Cerrar también la consulta de verificación
    $conn->close();
}
?>
