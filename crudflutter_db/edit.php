<?php 
$conn = new mysqli("localhost", "root", "", "dbpinjambuku");
$id = $_POST['id'];
$nama = $_POST['nama'];
$nim = $_POST['nim'];
$judul_buku = $_POST['judul_buku'];
$tgl_pinjam = $_POST['tgl_pinjam'];
$tgl_kembalikan = $_POST['tgl_kembalikan'];

$data = mysqli_query($conn, "update tb_peminjam set nama='$nama', nim='$nim', judul_buku='$judul_buku', tgl_pinjam='$tgl_pinjam', tgl_kembalikan='$tgl_kembalikan' where id='$id'");

if ($data) {
	echo json_encode(['pesan' => 'sukses']);
}else {
	echo json_encode(['pesan' => 'gagal']);
}
 ?>
