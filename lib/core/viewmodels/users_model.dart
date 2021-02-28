import 'package:company_task/core/enums/viewstate.dart';
import 'package:company_task/core/models/dummy_stub.dart';
import 'package:company_task/core/models/user.dart';
import 'package:company_task/core/services/api/users/users.dart';
import 'package:company_task/core/viewmodels/base_model.dart';
import 'package:company_task/locator.dart';

class UsersModel extends BaseModel {
  DummyStub dummyStub = locator<DummyStub>();

  String button = "Button";

  List<User> users;

  void loadUsers() async {
    setState(ViewState.Busy);
    users = await Users().load();
    setState(ViewState.Idle);
  }
}
