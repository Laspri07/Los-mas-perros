<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "bdgeneral"; 

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener los datos del formulario
$usuario = $_POST['usuario'];
$email = $_POST['email'];
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$documento1 = $_POST['documento1']; // Tipo de documento
$documento2 = $_POST['documento2']; // Número de documento
$numero = $_POST['numero'];
$contrasena = $_POST['contrasena'];

// Validar que los campos no estén vacíos (opcional, puedes hacer validaciones adicionales)
if(empty($usuario) || empty($email) || empty($nombre) || empty($apellido) || empty($documento1) || empty($documento2) || empty($numero) || empty($contrasena)) {
    die("Por favor, completa todos los campos.");
}

// Insertar datos en la base de datos
$sql = "INSERT INTO usuarios (usuario, email, nombre, apellido, tipo_documento, numero_documento, numero_telefono, contrasena) 
        VALUES ('$usuario', '$email', '$nombre', '$apellido', '$documento1', '$documento2', '$numero', '$contrasena')";

if ($conn->query($sql) === TRUE) {
    echo "Registro exitoso.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>
