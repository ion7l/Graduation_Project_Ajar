import 'package:flutter/material.dart';
import '../veiwUser/account.dart';
import '../veiwUser/documents.dart';
import '../veiwUser/home.dart';
import '../veiwUser/products.dart';

class Logiec extends ChangeNotifier {
  int _Index = 0;

  final List _Page = [
    Home(),
    Products(),
    Documents(),
    Account()
  ];
  updateIndex(int ind) {
    _Index = ind;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  get Page => _Page;
  get index => _Index;
}
