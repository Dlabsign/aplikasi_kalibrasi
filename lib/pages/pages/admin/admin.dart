import 'package:app_kalibrasi/pages/auth/login.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
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
        child: Text('Selamat datang Admin!'),
      ),
    );
  }
}
