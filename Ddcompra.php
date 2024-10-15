<?php 
// Configuración de conexión a la base de datos
$host = "localhost";
$usuario = "root";
$contraseña = "";
$base_datos = "bdproveedor";

// Crear la conexión
$conn = new mysqli($host, $usuario, $contraseña, $base_datos);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['Nombre'])) {
    // Si no ha iniciado sesión, redirigir al login
    header("Location: Bblogin.html");
    exit();
}

// Obtener el nombre de usuario de la sesión
$nombre_usuario = $_SESSION['Nombre'];

// Consultar los datos del cliente basado en el nombre de usuario
$sql = "SELECT cachos FROM cliente WHERE Nombre = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $nombre_usuario);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Actualizar el contador de cachos
    $row = $result->fetch_assoc();
    $cachos_actuales = $row['cachos'];
    
    // Incrementar el número de cachos
    $nuevos_cachos = $cachos_actuales + 1;

    // Actualizar la base de datos con los nuevos cachos
    $sql_update = "UPDATE cliente SET cachos = ? WHERE Nombre = ?";
    $stmt_update = $conn->prepare($sql_update);
    $stmt_update->bind_param("is", $nuevos_cachos, $nombre_usuario);
    $stmt_update->execute();

    echo "success"; // Devuelve una respuesta de éxito al cliente
} else {
    echo "error"; // Error si no se encuentra el cliente
}

// Cerrar conexión
$conn->close();
?>

