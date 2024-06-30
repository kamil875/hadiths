import 'package:flutter/material.dart';

class MainBottomBarState extends ChangeNotifier {
  int _index = 0;

  int get getIndex => _index;
  set setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}