<?php
session_start(); // Iniciar la sesión

// Verifica si el usuario ha iniciado sesión
if (!isset($_SESSION['Numerodocu'])) {
    header('Location: Bblogin.html'); // Redirigir si no ha iniciado sesión
    exit(); // Terminar el script
} else {
    // Solo se ejecuta si 'Numerodocu' está definida
    $userId = $_SESSION['Numerodocu'];
    
    // Conectar a la base de datos
    $host = 'localhost';
    $dbname = 'bdgeneral';
    $username = 'root'; 
    $password = '';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Incrementar "cachos" del usuario
        $sql = "UPDATE cliente SET cachos = cachos + 1 WHERE Numerodocu = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$userId]);

        // Comprobar si la actualización fue exitosa
        if ($stmt->rowCount() > 0) {
            echo "success"; // Si todo ha ido bien
        } else {
            echo "error"; // Si no se actualizó nada
        }
    } catch (PDOException $e) {
        echo "error"; // Devolver un mensaje de error si hay un problema de conexión
    }
}
?>