<?php 

$conn = new mysqli("localhost", "root", "", "dbpinjambuku");
$query = mysqli_query($conn, "select * from tb_peminjam");
$data = mysqli_fetch_all($query, MYSQLI_ASSOC);

echo json_encode($data);


?>