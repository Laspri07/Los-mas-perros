<?php
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

session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['Nombre'])) {
    // Si no ha iniciado sesión, redirigir al login
    header("Location: Bblogin.html");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Cuenta</title>
    <link rel="stylesheet" href="Kkcuenta.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bangers&display=swap');
      </style>
</head>
<body>

    <div class="container">
        <h1>Bienvenido, <?php echo $_SESSION['Nombre']; ?> <?php echo $_SESSION['Apellido']; ?></h1>
        
        <div class="profile-section">
            <h2>Datos Personales</h2>
            <ul class="profile-info">
                <li><strong>Nombre:</strong> <?php echo $_SESSION['Nombre']; ?></li>
                <li><strong>Apellido:</strong> <?php echo $_SESSION['Apellido']; ?></li>
                <li><strong>Teléfono:</strong> <?php echo $_SESSION['Telefono']; ?></li>
                <li><strong>Correo:</strong> <?php echo $_SESSION['Correo']; ?></li>
                <li><strong>Número de documento:</strong> <?php echo $_SESSION['Numero_documento']; ?></li>
                <li><strong>Número de cachos (compras):</strong> <?php echo $_SESSION['Cachos'] ?: '0'; ?></li>
            </ul>
        </div>

        <div class="actions">
            <a href="Kkcerrar_sesion.php" class="button">Cerrar Sesión</a>
        </div>
    </div>
</body>
</html>
