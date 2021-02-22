import 'package:flutter/material.dart';

class MoveNotifier with ChangeNotifier {
  bool down;

  void moveDown(bool value) {
    this.down = value;

    notifyListeners();
  }
}