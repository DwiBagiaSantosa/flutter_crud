import 'package:flutter/material.dart';
import 'package:flutter_crud/homepage.dart';
import 'package:http/http.dart' as http;

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController nim = TextEditingController();
  TextEditingController judul_buku = TextEditingController();
  TextEditingController tgl_pinjam = TextEditingController();
  TextEditingController tgl_kembalikan = TextEditingController();

  Future _simpan() async {
    final response = await http.post(Uri.parse('http://192.168.0.105/crudflutter/create.php'),
    body: {
      "nama" : nama.text,
      "nim" : nim.text,
      "judul_buku" : judul_buku.text,
      "tgl_pinjam" : tgl_pinjam.text,
      "tgl_kembalikan" : tgl_kembalikan.text,
    }
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data "),
      ),
      body: Form(
        key: formKey,
        child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: nama,
              decoration: InputDecoration(
                hintText: "Nama",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama tidak boleh kosong";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: nim,
              decoration: InputDecoration(
                hintText: "NIM",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "NIM tidak boleh kosong";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: judul_buku,
              decoration: InputDecoration(
                hintText: "Judul Buku",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Judul Buku tidak boleh kosong";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: tgl_pinjam,
              decoration: InputDecoration(
                hintText: "Tanggal Pinjam",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tanggal Pinjam tidak boleh kosong";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: tgl_kembalikan,
              decoration: InputDecoration(
                hintText: "Tanggal Dikembalikan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tanggal Dikembalikan tidak boleh kosong";
                }
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: (){
                if (formKey.currentState!.validate()){
                  _simpan().then((value) {
                    if (value){
                      final snackBar = SnackBar(content: const Text("Data berhasil di simpan"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(content: const Text("Data gagal di simpan"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => HomePage())), (route) => false);
                }
              }, child: Text("Simpan"))
          ],
        ),
      )),
    );
  }
}
