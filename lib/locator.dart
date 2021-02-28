import 'package:company_task/core/models/dummy_stub.dart';
import 'package:company_task/core/viewmodels/users_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api/net_client.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NetClient());
  locator.registerLazySingleton(
      () => DummyStub(name: "Some name"));

  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => UsersModel());
}
