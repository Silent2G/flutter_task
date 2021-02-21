import 'package:flutter/material.dart';

class OpacityNotifier with ChangeNotifier {
  double opacity = 1;

  setOpacity(double value) {
    this.opacity = value;

    notifyListeners();
  }
}