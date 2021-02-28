import 'dart:convert';

import 'package:company_task/core/models/user.dart';
import 'package:company_task/core/services/api/net_client.dart';
import 'package:company_task/locator.dart';
import 'package:http/http.dart';

class Users {
  final String getUsersUrl = "/users";

  final NetClient netClient = locator<NetClient>();

  Future<List<User>> load({int perPage}) async {
    Response response = await netClient.sendGet(getUsersUrl,
        params: perPage != null
            ? {
                'per_page': perPage,
              }
            : null);
    if (response.statusCode == 200) {
      Iterable data = jsonDecode(response.body);
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users;
    } else {
      return null;
    }
  }
}
