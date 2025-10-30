import 'package:flutter/material.dart';
import 'lihat_jurnal_page.dart';
import 'buat_jurnal_page.dart';
import 'akun_page.dart';
import 'tentang_aplikasi_page.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SimpleHomePageState();
  }
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  void _openLihatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LihatJurnalPage(title: 'Lihat Jurnal'), // Pindah ke halaman ini
      ),
    );
  }
// ABDULLAH SHAMIL BASAYEV TI 3B | 2341720166
  void _openBuatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuatJurnalPage(title: 'Buat Jurnal'), // Pindah ke halaman Buat Jurnal
      ),
    );
  }

  void _openAkunPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AkunPage(title: 'Akun'), // Pindah ke halaman Akun
      ),
    );
  }

  void _openTentangAplikasiPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TentangAplikasiPage(title: 'Tentang Aplikasi'), // Pindah ke halaman Tentang Aplikasi
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( // Ganti Row utama menjadi Column
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan Column ini di tengah layar
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20), // Beri jarak vertikal antara logo dan tombol)
            // Baris tombol pertama
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Pusatkan Row ini
              children: [
                ElevatedButton(
                  onPressed: () => _openLihatJurnalPage(context),
                  child: Text('Lihat Jurnal'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _openBuatJurnalPage(context),
                  child: Text('Buat Jurnal'),
                ),
              ],
            ),
            SizedBox(height: 10), // Beri jarak vertikal antar baris
            // Baris tombol kedua (Latihan)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Pusatkan Row ini
              children: [
                ElevatedButton(
                  onPressed: () => _openAkunPage(context),
                  child: Text('Akun'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _openTentangAplikasiPage(context),
                  child: Text('Tentang Aplikasi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
