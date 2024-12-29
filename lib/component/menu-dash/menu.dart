import 'package:app_kalibrasi/pages/form/add_form.dart';
import 'package:flutter/material.dart';
import 'dart:math'; // Pastikan Anda mengimpor ini jika menggunakan math.max
import 'package:google_fonts/google_fonts.dart'; // Pastikan package ini diimport

class ExtensionMenuComp extends StatefulWidget {
  final Map<String, dynamic> user; // Tambahkan parameter untuk user

  const ExtensionMenuComp({super.key, required this.user});

  @override
  State<ExtensionMenuComp> createState() => ExtensionMenuCompState();
}

class ExtensionMenuCompState extends State<ExtensionMenuComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: max(MediaQuery.of(context).size.height * 0.7,
          500), // Tinggi dinamis dengan batas minimum 500
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color.fromARGB(255, 215, 215, 215),
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Daftar Alat Nasroh Medika Indonesia",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.30,
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAlat(
                              user: widget.user,
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tambah Data Alat",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CrudComp(),
            const SizedBox(height: 10),
            CrudComp(),
            const SizedBox(height: 10),
            CrudComp(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CrudComp extends StatelessWidget {
  const CrudComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(50, 0, 0, 0), // Warna garis
            width: 1.5, // Ketebalan garis
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thermohygrometer',
                style: GoogleFonts.jost(
                  color: const Color.fromARGB(255, 74, 74, 74),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Kategori',
                style: GoogleFonts.jost(
                  color: const Color.fromARGB(255, 74, 74, 74),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.orange,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.all(
                      10), // Atur padding tombol agar seragam
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
