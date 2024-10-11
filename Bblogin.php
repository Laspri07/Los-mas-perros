<?php
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
$sql = "SELECT * FROM cliente WHERE Nombre_usuario = '$usuario' AND Contraseña = '$contrasena'";
$result = $conn->query($sql);

if (mysqli_num_rows($result) == 1) {
    // Usuario autenticado
    $row = mysqli_fetch_assoc($result);
    
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
$conn->close();
?>
