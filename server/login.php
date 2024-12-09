<?php
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'kalibrasi';

$conn = mysqli_connect($host, $username, $password, $database);
if (!$conn) {
    die("Koneksi ke database gagal: " . mysqli_connect_error());
}

$query = mysqli_query($conn, "SELECT * FROM user");
$tampil = mysqli_fetch_all($query, MYSQLI_ASSOC);
echo json_encode($tampil);

?>