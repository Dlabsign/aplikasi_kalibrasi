import 'package:app_kalibrasi/component/head.dart';
import 'package:app_kalibrasi/component/menu-dash/menu.dart';
import 'package:app_kalibrasi/pages/auth/login.dart';
import 'package:app_kalibrasi/pages/form/add_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class DashBoardPage extends StatefulWidget {
  final Map<String, dynamic> user; // Tambahkan parameter untuk user

  const DashBoardPage({super.key, required this.user});

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2), // Warna latar belakang putih
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              HeaderPage(user: widget.user),
              const SizedBox(height: 20),
              ExtensionMenuComp(
                user: widget.user,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
