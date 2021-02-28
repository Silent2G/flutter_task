import 'package:company_task/locator.dart';
import 'package:company_task/ui/router.dart';
import 'package:company_task/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(768, 1336),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'company_task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.BLUE,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
