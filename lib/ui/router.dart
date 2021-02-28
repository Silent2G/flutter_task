import 'package:company_task/ui/views/login/login_view.dart';
import 'package:company_task/ui/views/users/users_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/users':
        return MaterialPageRoute(builder: (_) => UsersView());
        break;
      // default:
      //   return MaterialPageRoute(
      //     builder: (_) => Scaffold(
      //       body: Center(
      //         child: Text('No route defined for ${settings.name}.'),
      //       ),
      //     ),
      //   );
    }
  }
}
