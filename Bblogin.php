<?php
session_start(); // Iniciar la sesión

// Habilitar la visualización de errores
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Parámetros de conexión a la base de datos
$servername = "localhost"; // O el host donde está tu base de datos
$username = "root"; // Cambia si es necesario
$password = ""; // Cambia si es necesario
$dbname = "bdgeneral"; // Nombre de la base de datos

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Comprobar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recoger los datos del formulario
$usuario = $_POST['usuario'];
$contrasena = $_POST['contrasena'];

// Preparar la consulta SQL para verificar las credenciales
$stmt = $conn->prepare("SELECT * FROM cliente WHERE Nombre_usuario = ? AND Contraseña = ?");
$stmt->bind_param("ss", $usuario, $contrasena);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 1) {
    // Usuario autenticado
    $row = $result->fetch_assoc();
    
    // Guardar datos en la sesión
    $_SESSION['Nombre'] = $row['Nombre'];
    $_SESSION['Apellido'] = $row['Apellido'];
    $_SESSION['Telefono'] = $row['Telefono'];
    $_SESSION['Correo'] = $row['Correo'];
    $_SESSION['Numero_documento'] = $row['Numerodocu'];
    $_SESSION['Cachos'] = $row['cachos'];

    // Redirigir a Kkcuenta.php en caso de éxito
    header("Location: Kkcuenta.php");
    exit(); // Asegúrate de detener el script después de redirigir
} else {
    // Mostrar mensaje de error en caso de fallo
    echo "Usuario o contraseña incorrectos.";
}

// Cerrar la conexión
$stmt->close();
$conn->close();
?>
