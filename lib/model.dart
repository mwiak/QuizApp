import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Model extends ChangeNotifier {
  bool isClickable = true;
  int score = 0;
  List<Widget> scoreBarItems = [];

  get clickable => isClickable;

  void updateClickable() {
    isClickable = !isClickable;
    notifyListeners();
  }
}
