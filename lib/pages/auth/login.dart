import 'package:app_kalibrasi/pages/pages/Dashboard2.dart';
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
    String url = "http://192.168.1.8/flutter/kalibrasi/login.php";

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: {
          "username": _usernameController.text,
          "password": _passwordController.text,
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Cek apakah respons berhasil
        if (data['status'] == 'success') {
          var user = data['user'];
          setState(() {
            _msg = "Welcome, ${user['user_nama']}!";
          });

          // Menavigasi berdasarkan role pengguna
          if (user['user_akses'] == 'petugas') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashBoardPage(user: user),
              ),
            );
          } else {
            setState(() {
              _msg = "Invalid Role.";
            });
          }
        } else {
          setState(() {
            _msg = data['message']; // Menampilkan pesan error dari server
          });
        }
      } else {
        setState(() {
          _msg = "Failed to connect to server: ${response.statusCode}";
        });
      }
    } catch (error) {
      setState(() {
        _msg = "Error: Unable to connect to server.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2), // Warna latar belakang putih
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 39),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 154,
                        height: 154,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Sistem Informasi",
                        style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(250, 112, 112, 1)),
                        ),
                      ),
                      Text(
                        "Manajemen Kalibrasi",
                        style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF428BCA)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
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
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 9),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.50,
                                color: Color.fromARGB(255, 188, 188, 188)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 63, 63, 63),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 63, 63, 63),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 5,
                                    ),
                                  ),
                                  counterStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 63, 63, 63),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.person, // Ikon user
                              color:
                                  Color.fromARGB(255, 63, 63, 63), // Warna ikon
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Form input Password
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.50,
                            color: Color.fromARGB(255, 188, 188, 188)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                color: const Color.fromARGB(255, 63, 63, 63),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            controller: _passwordController,
                            obscureText: _isObscured,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 5,
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _msg,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Tombol Sign In
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        loginfunction();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Masuk",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.56,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),

              // Footer dengan teks copyright
              Text(
                "Nashroh Medika Indonesia © 2024",
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF428BCA)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
