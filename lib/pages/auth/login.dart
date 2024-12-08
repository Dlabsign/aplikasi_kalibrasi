import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8ECEF),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.all(30.0), // Padding luar untuk jarak dari sisi
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 30), // Padding dalam untuk konten
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Opacity(
                  opacity: 0.20,
                  child: Container(
                    width: 267,
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
                SizedBox(height: 24),
                Column(
                  children: [
                    Text(
                      "Login Admin",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "Kalibrasi",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF007AFF),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
