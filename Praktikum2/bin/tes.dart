import 'dart:io';
import 'modul_lain.dart';

void main()
{
//   print('Halo, Dart!');
//   print('--------------');
// // 1. Fungsi, Variabel, dan Tipe Data
//   fungsiPercobaan1();
// // 2. Operator
//   fungsiPercobaan2();
// // 3. Input Pengguna
//   fungsiPercobaan3();
// // 4. Pencabangan
//   fungsiPercobaan4(80);
// // 5. Perulangan
//   fungsiPercobaan5('Yoppy', 5);
// // 6. Panggil fungsi dari file lain
//   fungsiPercobaan6(); // <-- INI FUNGSI YANG BERADA DI FILE LAIN.
// // 7. List
//     fungsiPercobaanList();
// // 8. Map
//     fungsiPercobaanMap();
// // 9. Set
        fungsiPercobaanSet();
}

void fungsiPercobaan1() {
  String nama = 'Abdullah Shamil Basayev';
  int umur = 20;
  double ipk = 3.87;
  bool lulus = true;
  print('Nama : $nama');
  print('Umur : $umur');
  print('IPK  : $ipk');
  print('Lulus: $lulus');
}

// Operator
void fungsiPercobaan2(){
  int a = 10;
  int b = 20;

  print('Penjumalahan: ${a + b}');
  print('Pengurangan: ${b - a}');
  print('Perkalian: ${a * b}');
  print('Pembagian: ${b / a}');
  print('Modulus: ${b % a}');
  print('Logika : ${(a > b) && (b < 5)}');
  print('---------');
}

// Input Pengguna
void fungsiPercobaan3(){
  stdout.write('Masukkan nama Anda: ');
  String? nama = stdin.readLineSync();
  print('Halo, $nama! Selamat datanggg');
}

// Pencabangan
void fungsiPercobaan4(double nilai){
  String status;
  if (nilai >= 75)
    {
      status = 'Lulus';
    }
  else
    {
      status = 'Mengulang';
    }
  print('Nilai : $nilai');
  print('Status: $status');
  print('---------');
}

// Perulangan
void fungsiPercobaan5(String nama, double jumlah)
{
  for(int i = 0; i < jumlah; i++)
    {
      print('For ke-$i: $nama');
    }
  print('---------');

  int j = 0;
  while (j < jumlah)
    {
      print('While ke-$j: $nama');
      j++;
    }
    print('------');
}

// Modularisasi dan Tipe Data Koleksi

