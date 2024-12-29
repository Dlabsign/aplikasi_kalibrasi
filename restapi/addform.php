<?php

include 'mobile_conn.php';

$alat_input_halaman = $_POST['alat_input_halaman'];
$alat_input_urutan = $_POST['alat_input_urutan'];
$alat_input_jenis = $_POST['alat_input_jenis'];
$alat_input_satuan = $_POST['alat_input_satuan'];

$connect->query("INSERT INTO tb_item (alat_input_halaman,alat_input_urutan,alat_input_jenis,alat_input_satuan) VALUES ('" . $alat_input_halaman . "','" . $alat_input_urutan . "','" . $alat_input_jenis . "','" . $alat_input_satuan . "')")

    ?>