import 'package:company_task/api/net_client.dart';
import 'package:company_task/api/users/users.dart';
import 'package:company_task/api/users/model/user.dart';
import 'package:flutter/material.dart';

class UsersNotifier with ChangeNotifier {
  List<User> users;

  void loadUsers() async {
    users = await Users(NetClient.getInstance()).load();

    notifyListeners();
  }
}