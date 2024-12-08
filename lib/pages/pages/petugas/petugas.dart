import 'package:app_kalibrasi/pages/auth/login.dart';
import 'package:flutter/material.dart';

class PetugasPage extends StatelessWidget {
  const PetugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petugas Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: Icon(Icons.logout)),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Selamat datang Petugas!'),
      ),
    );
  }
}
