import 'package:company_task/model/dummy_stub.dart';
import 'package:company_task/presenter/screens/login/login_screen.dart';
import 'package:company_task/providers/dummy_stub_notifier.dart';
import 'package:company_task/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:provider/provider.dart';

import 'api/users/providers/users_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(768, 1336),
      allowFontScaling: false,
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  DummyStubNotifier(dummyStub: DummyStub(name: "Some text"))),
          ChangeNotifierProvider(create: (context) => UsersNotifier()),
        ],
        child: MaterialApp(
          title: 'company_task',
          theme: ThemeData(
            primarySwatch: AppColors.BLUE,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
