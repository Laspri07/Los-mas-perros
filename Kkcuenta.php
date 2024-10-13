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
    <link rel="stylesheet" href="Kkstyle.css">
    <link rel="stylesheet" href="Aastyle.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Bangers&display=swap');
      </style>
</head>
<body>

<header>
        <div class="menu container">

            <img class="logo-1" src="images/Logo.svg" alt="Logo">
            <input type="checkbox" id="menu"/>
            <label for="menu">
                <img src="images/menu.png" class="menu-icono" alt="Menu">
            </label>
            <nav class="navbar">
                <div class="menu-1">
                    <ul>
                        <li><a href="Eenosotros.html">Nosotros</a></li>
                        <li><a href="Fftopcachones.html">Top cachones</a></li>
                        <li><a href="Ggcontactanos.html">Contactanos</a></li>
                    </ul>
                </div>
                <a href="Aaprincipal.html">
                <img href="Aaprincipal.html" class="logo-2" src="images/logo.svg" alt="">
                </a>
                <div class="menu-2">
                    <ul>
                        <li><a href="Ddmenu.html">Menu</a> </li>
                    </ul>
                    <div class="barras">
                        <a href="#seccion-destino">
                            <div class="barra">
                                <img src="images/1ubi.svg" alt="">
                            </div>
                        </a>
                        
                    </div>

                    <div class="account-dropdown">
                        <img src="images/3user.svg" alt="Cuenta" id="account-icon">
                        <div class=" dropdown-content" id="dropdown-menu">
                            <a href="Kkcuenta.php" class="btn">Tu cuenta</a>
                            <a href="Bblogin.html">Iniciar sesion</a>
                        </div>
                    </div>

               

            </nav>
        </div>
    </header>


    <div class="contenedor-cuenta">
        <h1>Bienvenido(a), <?php echo $_SESSION['Nombre']; ?> <?php echo $_SESSION['Apellido']; ?></h1>
        
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
