import 'package:company_task/core/models/dummy_stub.dart';
import 'package:company_task/core/viewmodels/base_model.dart';
import 'package:company_task/locator.dart';

class LoginModel extends BaseModel {
  DummyStub dummyStub = locator<DummyStub>();

  String login = "Login";
  String password = "Password";
  String signIn = "Sign In";
}
