import 'package:flutter/cupertino.dart';
import 'jurnal.dart';
class DataProvider extends ChangeNotifier
{
  final List<Jurnal> _jurnalTersimpan = [];
  void addNew(Jurnal jurnal) // <-- Method untuk menambahkan entri jurnal
  {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }
  List<Jurnal> get jurnalTersimpan
  {
    return List.unmodifiable(_jurnalTersimpan);
  }
}