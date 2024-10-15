<?php
session_start(); // Iniciar sesión

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['user'])) {
    // Si no hay sesión, redirigir a la página de inicio de sesión
    header("Location: Bblogin.html");
    exit();
}

// Conectar a la base de datos
$servername = "localhost"; // Cambia esto si es necesario
$username = "root"; // Reemplaza con tu usuario de MySQL
$password = ""; // Reemplaza con tu contraseña de MySQL
$dbname = "bdgeneral"; // Nombre de tu base de datos

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener los datos de la compra desde el cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);
$items = $data['items']; // Se puede utilizar para registrar productos comprados si es necesario
$total_price = $data['total_price'];

// Obtener el usuario de la sesión
$user = $_SESSION['user']; // Supongamos que el nombre de usuario está guardado en la sesión

// Actualizar el contador de 'cachos' del usuario
$sql = "UPDATE cliente SET cachos = IFNULL(cachos, 0) + 1 WHERE Nombre_usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $user);

if ($stmt->execute()) {
    // Respuesta de éxito
    echo "Compra procesada. Tu cuenta ha sido actualizada.";
} else {
    echo "Error al procesar la compra: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
