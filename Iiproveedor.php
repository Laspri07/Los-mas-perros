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

// Verificar que el formulario haya sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Recibir los datos del formulario
    $nombre_empresa = $_POST['nombre-empresa'];
    $telefono = $_POST['telefono'];
    $nit = $_POST['nit'];
    $correo = $_POST['correo'];
    $producto = $_POST['producto'];
    $comentarios = $_POST['comentarios'];
    
    // Manejar el archivo subido (hoja de vida)
    if (isset($_FILES['hoja-vida']) && $_FILES['hoja-vida']['error'] === UPLOAD_ERR_OK) {
        $archivo = file_get_contents($_FILES['hoja-vida']['tmp_name']);
    } else {
        $archivo = NULL;
    }
    
    // Preparar la consulta SQL para insertar los datos
    $sql = "INSERT INTO proveedor (Nombre, Telefono, NIT, Correo, PyS, Comentario, Archivo) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    // Preparar la sentencia
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("siissss", $nombre_empresa, $telefono, $nit, $correo, $producto, $comentarios, $archivo);
    
    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo "¡Datos enviados correctamente!";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Cerrar la conexión
    $stmt->close();
    $conn->close();
}
?>