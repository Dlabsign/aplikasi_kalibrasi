import 'package:app_kalibrasi/pages/pages/Dashboard2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class AddAlat extends StatefulWidget {
  final Map<String, dynamic> user; // Tambahkan parameter untuk user

  const AddAlat({super.key, required this.user});

  @override
  _AddAlatState createState() => _AddAlatState();
}

class _AddAlatState extends State<AddAlat> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController urutanController = TextEditingController();
  final TextEditingController halamanController = TextEditingController();

  List<dynamic> alatOptions = [];
  List<dynamic> satuanOptions = [];
  String? selectedAlatId;
  String? selectedSatuanId;

  @override
  void initState() {
    super.initState();
    fetchAlatOptions();
    fetchSatuanOptions();
  }

  Future<void> fetchAlatOptions() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.8/flutter/kalibrasi/add.php'),
      body: {'action': 'get_alat'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List) {
        setState(() {
          alatOptions = data; // Simpan data ke dalam alatOptions
        });
      }
    }
  }

  Future<void> fetchSatuanOptions() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.8/flutter/kalibrasi/add.php'),
      body: {'action': 'get_satuan'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List) {
        setState(() {
          satuanOptions = data; // Simpan data ke dalam satuanOptions
        });
      }
    }
  }

  Future<bool> _addAlat() async {
    final respon = await http.post(
      Uri.parse('http://192.168.1.8/flutter/kalibrasi/add.php'),
      body: {
        'action': 'insert',
        'alat_input_jenis': jenisController.text,
        'alat_id': selectedAlatId,
        'alat_input_satuan': selectedSatuanId,
        'alat_input_urutan': urutanController.text,
        'alat_input_halaman': halamanController.text,
      },
    );

    return respon.statusCode == 200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Alat'),
      ),
      backgroundColor: Color(0xFFF2F2F2), // Warna latar belakang putih

      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedSatuanId,
                items: satuanOptions.isNotEmpty
                    ? satuanOptions.map<DropdownMenuItem<String>>((satuan) {
                        return DropdownMenuItem<String>(
                          value: satuan['satuan_id'].toString(),
                          child: Text(
                              satuan['satuan_nama']), // Tampilkan nama satuan
                        );
                      }).toList()
                    : [
                        DropdownMenuItem(
                          value: null,
                          child: Text("Tidak Ada Data"),
                        ),
                      ],
                decoration: InputDecoration(
                  labelText: "Pilih Alat",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 188, 188, 188),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedSatuanId = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Pilih satuan terlebih dahulu' : null,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedAlatId,
                items: alatOptions.isNotEmpty
                    ? alatOptions.map<DropdownMenuItem<String>>((alat) {
                        return DropdownMenuItem<String>(
                          value: alat['alat_id'].toString(),
                          child: Text(alat['alat_nama']),
                        );
                      }).toList()
                    : [
                        DropdownMenuItem(
                          value: null,
                          child: Text("Tidak Ada Data"),
                        ),
                      ],
                decoration: InputDecoration(
                  labelText: "Pilih Alat",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 188, 188, 188),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedAlatId = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Pilih alat terlebih dahulu' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: jenisController,
                decoration: InputDecoration(
                  labelText: "Masukkan Jenis",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 188, 188, 188),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Jenis satuan tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: urutanController,
                decoration: InputDecoration(
                  labelText: "Urutan",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 188, 188, 188),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Hanya angka yang bisa dimasukkan
                ],
                validator: (value) =>
                    value!.isEmpty ? 'Urutan tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: halamanController,
                decoration: InputDecoration(
                  labelText: "Halaman",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 188, 188, 188),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Hanya angka yang bisa dimasukkan
                ],
                validator: (value) =>
                    value!.isEmpty ? 'Halaman tidak boleh kosong' : null,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _addAlat().then((success) {
                      final snackBar = SnackBar(
                        content: Text(success
                            ? 'Data berhasil ditambahkan'
                            : 'Data gagal ditambahkan'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DashBoardPage(user: widget.user),
                          ),
                        );
                      }
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
