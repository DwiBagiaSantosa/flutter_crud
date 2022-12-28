<?php 
$conn = new mysqli("localhost", "root", "", "dbpinjambuku");
$nama = $_POST['nama'];
$nim = $_POST['nim'];
$judul_buku = $_POST['judul_buku'];
$tgl_pinjam = $_POST['tgl_pinjam'];
$tgl_kembalikan = $_POST['tgl_kembalikan'];

$data = mysqli_query($conn, "insert into tb_peminjam set nama='$nama', nim='$nim', judul_buku='$judul_buku', tgl_pinjam='$tgl_pinjam', tgl_kembalikan='$tgl_kembalikan'");

if ($data) {
	echo json_encode(['pesan' => 'sukses']);
}else {
	echo json_encode(['pesan' => 'gagal']);
}
 ?>
