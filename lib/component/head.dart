import 'package:flutter/material.dart';
import 'package:app_kalibrasi/pages/auth/login.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan package ini diimport

class HeaderPage extends StatelessWidget {
  final Map<String, dynamic> user; // Tambahkan parameter untuk user

  const HeaderPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 49),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        border: Border.all(
          color: const Color.fromARGB(255, 215, 215, 215),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section: Greeting
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Selamat Datang,',
                style: GoogleFonts.jost(
                  color: const Color.fromARGB(255, 130, 130, 130),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                user['user_nama'],
                style: const TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Section: Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button: Settings
              ElevatedButton.icon(
                onPressed: () {
                  // Tambahkan logika untuk tombol Settings di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(39), // Sudut melengkung
                    side: const BorderSide(
                        width: 1, color: Color(0x331D1D1D)), // Border
                  ),
                ),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black.withOpacity(0.66), // Warna ikon
                  size: 16,
                ),
                label: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.66), // Warna teks
                    fontSize: 12.5,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Button: Keluar
              ElevatedButton.icon(
                onPressed: () {
                  // Tambahkan logika untuk navigasi ke LoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6A6A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(39), // Sudut melengkung
                    side: const BorderSide(
                        width: 1, color: Color(0x331D1D1D)), // Border
                  ),
                ),
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFFAFAFA), // Warna ikon
                  size: 16,
                ),
                label: const Text(
                  'Keluar',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA), // Warna teks
                    fontSize: 12.5,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
