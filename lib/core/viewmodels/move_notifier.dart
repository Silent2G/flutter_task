import 'package:company_task/core/viewmodels/base_model.dart';

class MoveNotifier extends BaseModel {
  bool down;

  void moveDown(bool value) {
    this.down = value;

    notifyListeners();
  }
}
