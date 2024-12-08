import 'package:app_kalibrasi/pages/auth/login.dart';
import 'package:app_kalibrasi/pages/pages/petugas/petugas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage()
      ),
    );
  }
}
