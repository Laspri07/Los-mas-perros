<?php
// Configuración de la conexión a la base de datos
$servername = "localhost"; // Cambia esto si usas otro servidor
$username = "root";        // Tu usuario de la base de datos
$password = "";            // Tu contraseña de la base de datos
$dbname = "bdgeneral";     // Nombre de la base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar si la conexión fue exitosa
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si los datos se enviaron correctamente desde el formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Recoger los datos del formulario usando $_POST
    $nombre_usuario = $_POST['usuario'];
    $email = $_POST['email'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $tipo_documento = $_POST['documento1'];
    $numero_documento = $_POST['documento2'];
    $telefono = $_POST['numero'];
    $contrasena = $_POST['contrasena'];

    // Verificar si hay datos faltantes
    if (empty($nombre_usuario) || empty($email) || empty($nombre) || empty($apellido) ||
        empty($tipo_documento) || empty($numero_documento) || empty($telefono) || empty($contrasena)) {
        echo "Por favor, rellena todos los campos.";
    } else {
        // Preparar la consulta SQL para insertar los datos
        $sql = "INSERT INTO cliente (Telefono, Nombre, Apellido, Correo, Tipodocu, Numerodocu, Contraseña, cachos, Nombre_usuario)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Preparar la declaración SQL
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            die("Error en la preparación: " . $conn->error);
        }

        // Vincular los parámetros con los valores
        $cachos = 0; // Valor predeterminado de cachos (puede cambiarse luego)
        $stmt->bind_param("issssiiss", $telefono, $nombre, $apellido, $email, $tipo_documento, $numero_documento, $contrasena, $cachos, $nombre_usuario);

        // Ejecutar la declaración
        if ($stmt->execute()) {
                // Redirigir a Bblogin.html en lugar de mostrar un mensaje
              header("Location: Bblogin.html");
             exit(); // Asegúrate de detener el script después de redirigir
        } else {
            echo "Error en el registro: " . $stmt->error;
        }

        // Cerrar la declaración
        $stmt->close();
    }
}

// Cerrar la conexión
$conn->close();
?>
