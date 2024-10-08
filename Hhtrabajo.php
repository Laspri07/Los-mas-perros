<?php
// Datos de conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = ""; // Cambia si tienes una contraseña para MySQL
$dbname = "bdempleado";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener los datos enviados desde el formulario
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$correo = $_POST['correo'];
$ciudad = $_POST['ciudad'];
$area = isset($_POST['area']) ? $_POST['area'] : '';

// Manejar la subida del archivo de hoja de vida
$archivo = $_FILES['hoja-vida'];
$nombreArchivo = $archivo['name'];
$archivoTmp = $archivo['tmp_name'];
$tipoArchivo = $archivo['type'];

// Validar el tipo de archivo (debe ser PDF, DOC o DOCX)
$extensionesPermitidas = array("application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
if (in_array($tipoArchivo, $extensionesPermitidas)) {
    // Leer el contenido del archivo
    $contenidoArchivo = file_get_contents($archivoTmp);

    // Preparar la consulta para insertar los datos en la tabla `empleado`
    $stmt = $conn->prepare("INSERT INTO empleado (Nombre1, Apellido1, Correo, Ciudad, Area, Hojadevida) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssss", $nombre, $apellido, $correo, $ciudad, $area, $contenidoArchivo);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo "Datos insertados correctamente.";
    } else {
        echo "Error al insertar los datos: " . $stmt->error;
    }

    // Cerrar la consulta
    $stmt->close();
} else {
    echo "Error: Solo se permiten archivos PDF, DOC o DOCX.";
}

// Cerrar la conexión
$conn->close();
?>
