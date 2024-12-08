<?php
// Mengatur koneksi ke database MySQL
$servername = "localhost";
$username = "root";  // ganti dengan username MySQL Anda
$password = "";  // ganti dengan password MySQL Anda
$dbname = "kalibrasi";  // ganti dengan nama database Anda

$conn = new mysqli($servername, $username, $password, $dbname);

// Cek apakah koneksi berhasil
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil data yang dikirim melalui POST
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Query untuk memeriksa apakah username dan password ada di database
    $sql = "SELECT * FROM user WHERE user_username = '$username' AND user_password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Jika data ditemukan, login berhasil
        echo json_encode(["status" => "success"]);
    } else {
        // Jika data tidak ditemukan, login gagal
        echo json_encode(["status" => "failed"]);
    }
}

$conn->close();
?>
