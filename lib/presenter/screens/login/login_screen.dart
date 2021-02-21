import 'package:company_task/presenter/scaffolds/button.dart';
import 'package:company_task/presenter/scaffolds/icon_button.dart';
import 'package:company_task/presenter/scaffolds/scroll_wrap.dart';
import 'package:company_task/presenter/scaffolds/text.dart';
import 'package:company_task/presenter/screens/login/widgets/column_pair.dart';
import 'package:company_task/presenter/screens/users/users_screen.dart';
import 'package:company_task/providers/dummy_stub_notifier.dart';
import 'package:company_task/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:company_task/presenter/screens/login/extensions/validator_extention.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Consumer<DummyStubNotifier>(
          builder: (context, DummyStubNotifier notifier, child) {
            if (notifier.dummyStub == null || notifier.dummyStub.name == null) {
              return Container();
            }
            return TitleText(
              notifier.dummyStub.name,
              textColor: AppColors.WHITE,
              fontWeight: FontWeight.w700,
              size: 40,
            );
          },
        ),
      ),
      body: ScrollWrap(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ColumnPair(
                  title: "Login",
                  child: Container(
                    child: InputTextField(
                      hint: "Login",
                      size: 30,
                      node: node,
                      validator: Container().loginValidator,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ColumnPair(
                  title: "Password",
                  child: Container(
                    child: InputTextField(
                      hint: "Password",
                      textInputAction: TextInputAction.done,
                      size: 30,
                      node: node,
                      validator: Container().passwordValidator,
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: AppIconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).textSelectionColor,
                            size: 25,
                          ),
                          function: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          constraints: BoxConstraints(),
                        ),
                      ),
                      minLines: 1,
                      maxLines: 1,
                      obscureText: passwordVisible,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ColorButton(
                  color: AppColors.BLUE,
                  width: MediaQuery.of(context).size.width,
                  text: "Sign In",
                  textSize: 35,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsersScreen()));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
