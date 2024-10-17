<?php
session_start(); // Iniciar la sesión

// Verificar si la sesión contiene el 'Numero_documento'
if (!isset($_SESSION['Numero_documento'])) {
    header('Location: Bblogin.html'); // Redirigir si no ha iniciado sesión
    exit(); // Terminar el script
}

// Conectar a la base de datos
$host = 'localhost'; // Cambia esto si es necesario
$dbname = 'bdgeneral';
$username = 'root'; // Cambia esto si es necesario
$password = ''; // Cambia esto si es necesario

try {
    // Conexión a la base de datos
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Recuperar el ID del usuario desde la sesión
    $userId = $_SESSION['Numero_documento'];

    // Incrementar "cachos" del usuario
    $sql = "UPDATE cliente SET cachos = IFNULL(cachos, 0) + 1 WHERE Numerodocu = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$userId]);

    // Comprobar si la actualización fue exitosa
    if ($stmt->rowCount() > 0) {
        echo "<script>alert('Compra exitosa! Cachos incrementados.'); window.location.href = 'Kkcuenta.php';</script>"; // Mensaje de éxito y redirección
    } else {
        echo "<script>alert('Error al finalizar la compra.'); window.location.href = 'Kkcuenta.php';</script>";
    }
} catch (PDOException $e) {
    echo "<script>alert('Error de conexión a la base de datos.'); window.location.href = 'Kkcuenta.php';</script>";
}
?>
