import 'package:app_kalibrasi/pages/pages/petugas/petugas.dart';
import 'package:app_kalibrasi/pages/pages/admin/admin.dart';
import 'package:app_kalibrasi/pages/pages/superadmin/superadmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  String _msg = "";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void loginfunction() async {
    String url = "http://192.168.1.5/flutter/login.php"; // URL ke server Anda

    try {
      // Melakukan POST request untuk mengirim username dan password
      http.Response response = await http.post(
        Uri.parse(url),
        body: {
          "username": _usernameController.text,
          "password": _passwordController.text,
        },
      );

      // Memeriksa status kode HTTP
      if (response.statusCode == 200) {
        // Mendekodekan data JSON yang diterima
        var users = jsonDecode(response.body);

        // Mencari user yang cocok berdasarkan username dan password
        var user = users.firstWhere(
          (user) =>
              user['user_username'] == _usernameController.text &&
              user['user_password'] == _passwordController.text,
          orElse: () => null,
        );

        if (user != null) {
          setState(() {
            _msg = "Welcome, ${user['user_nama']}!";
          });

          // Debugging: print role user
          print("User Role: ${user['user_akses']}");

          // Menavigasi berdasarkan peran (user_akses)
          if (user['user_akses'] == 'admin') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminPage()),
            );
          } else if (user['user_akses'] == 'petugas') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PetugasPage()),
            );
          } else if (user['user_akses'] == 'superadmin') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SuperadminPage()),
            );
          } else {
            setState(() {
              _msg = "Invalid Role.";
            });
          }
        } else {
          setState(() {
            _msg = "Invalid Username or Password.";
          });
        }
      } else {
        setState(() {
          _msg = "Failed to connect to server: ${response.statusCode}";
        });
      }
    } catch (error) {
      setState(() {
        _msg = "Error: $error";
      });
    }
  }

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
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 50, vertical: 30), // Padding dalam untuk konten
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Image(image: AssetImage("assets/images/logo.png")),
                ),
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
                const SizedBox(height: 24),
                Column(
                  children: [
                    Text(
                      "ADMIN LOGIN",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
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
                const SizedBox(height: 24),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 5),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(255, 122, 120, 120)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _usernameController,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.person,
                            color: Color(0xFF9D9999),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 5),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(255, 122, 120, 120)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              obscureText:
                                  _isObscured, // Mengontrol visibilitas teks
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscured =
                                    !_isObscured; // Mengubah state visibilitas
                              });
                            },
                            child: Icon(
                              _isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xFF9D9999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF007AFF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    onPressed: () {
                      loginfunction();
                    },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _msg,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: _msg.contains("Invalid")
                            ? Colors.red
                            : Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
