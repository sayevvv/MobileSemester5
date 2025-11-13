import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/pages/simple_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = '';
  String sandi = '';

  void login(BuildContext context) {
    // Validasi input tidak kosong
    if (namaPengguna.isEmpty || sandi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan password harus diisi!'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Cek kredensial - bisa menggunakan 'guru' atau 'shamil@mydj.com'
    if ((namaPengguna == 'guru' && sandi == 'guru') ||
        (namaPengguna == 'shamil@mydj.com' && sandi == 'password123')) {
      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );

      // Navigasi ke home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleHomePage(title: 'Beranda'),
        ),
      );
    } else {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau password salah!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDJ Welcome'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      namaPengguna = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                PasswordField(
                  onChanged: (value) {
                    setState(() {
                      sandi = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => login(context),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
