import 'package:company_task/core/viewmodels/base_model.dart';

class OpacityNotifier extends BaseModel {
  double opacity = 1;

  setOpacity(double value) {
    this.opacity = value;

    notifyListeners();
  }
}