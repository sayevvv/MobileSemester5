import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/data/jurnal.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key, required this.title});
  final String title;

  @override
  State<LihatJurnalPage> createState() => _LihatJurnalPageState();
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, child) {
          final daftarJurnal = dataProvider.jurnalTersimpan;

          if (daftarJurnal.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'Belum ada jurnal tersimpan',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Kembali ke Home'),
                  )
                ],
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final jurnal = daftarJurnal[index];
                      return ListTile(
                        title: Text('${jurnal.kelas} - ${jurnal.mapel}'),
                        subtitle: Text('Jam ke-${jurnal.jam}'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          _showDetailDialog(context, jurnal);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: daftarJurnal.length
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Jurnal jurnal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detail Jurnal'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Kelas', jurnal.kelas),
              _buildDetailRow('Mata Pelajaran', jurnal.mapel),
              _buildDetailRow('Jam Ke', jurnal.jam),
              SizedBox(height: 10),
              _buildDetailSection('Tujuan Pembelajaran', jurnal.tujuanPembelajaran),
              _buildDetailSection('Materi/Topik Pembelajaran', jurnal.materiTopikPembelajaran),
              _buildDetailSection('Kegiatan Pembelajaran', jurnal.kegiatanPembelajaran),
              _buildDetailSection('Dimensi Profil Pelajar Pancasila', jurnal.dimensiProfilPelajarPancasila),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tutup'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value.toString()),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(value.isEmpty ? '-' : value),
        ],
      ),
    );
  }
}