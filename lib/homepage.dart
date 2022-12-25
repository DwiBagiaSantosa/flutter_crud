import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listdata = [];
  Future _getdata() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.0.105/crudflutter/read.php'));
      if (response.statusCode == 200) {
        // print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pinjam Buku Mahasiswa"),
      ),
      body: ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text('Nama : ${_listdata[index]['nama']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text('NIM : ${_listdata[index]['nim']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text('Judul Buku : ${_listdata[index]['judul_buku']}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text('Tanggal Pinjam : ${_listdata[index]['tgl_pinjam']}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text('Tanggal Dikembalikan : ${_listdata[index]['tgl_kembalikan']}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ) 
        );
      })),
    );
  }
}
