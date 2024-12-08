<?php
// Mulai sesi
session_start();

// Hancurkan sesi untuk logout
session_destroy();

// Mengirim respons bahwa logout berhasil
echo json_encode(["status" => "logged_out"]);
?>
