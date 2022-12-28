import 'package:flutter/material.dart';
import 'package:flutter_crud/homepage.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final Map ListData;

  const EditData({Key? key, required this.ListData}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController nim = TextEditingController();
  TextEditingController judul_buku = TextEditingController();
  TextEditingController tgl_pinjam = TextEditingController();
  TextEditingController tgl_kembalikan = TextEditingController();

  Future _update() async {
    final response = await http.post(Uri.parse('http://192.168.0.105/crudflutter/edit.php'),
    body: {
      "id" : id.text,
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
    id.text = widget.ListData["id"];
    nama.text = widget.ListData["nama"];
    nim.text = widget.ListData["nim"];
    tgl_pinjam.text = widget.ListData["tgl_pinjam"];
    tgl_kembalikan.text = widget.ListData["tgl_kembalikan"];


    return Scaffold(
      appBar: AppBar(
        title: Text("Edit  Data "),
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
                  _update().then((value) {
                    if (value){
                      final snackBar = SnackBar(content: const Text("Data berhasil di Update"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(content: const Text("Data gagal di Update"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => HomePage())), (route) => false);
                }
              }, child: Text("Update"))
          ],
        ),
      )),
    );
  }
}
