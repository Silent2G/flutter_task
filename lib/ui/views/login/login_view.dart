import 'package:company_task/core/viewmodels/login_model.dart';
import 'package:company_task/ui/widgets/column_pair.dart';
import 'package:company_task/ui/shared/app_colors.dart';
import 'package:company_task/ui/views/base_view.dart';
import 'package:company_task/ui/widgets/button.dart';
import 'package:company_task/ui/widgets/icon_button.dart';
import 'package:company_task/ui/widgets/scroll_wrap.dart';
import 'package:company_task/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:company_task/ui/views/login/extentions/validator_extention.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;

  FocusNode node;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    node = FocusScope.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (BuildContext context, LoginModel model, Widget child) =>
            Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: TitleText(
                  model.dummyStub.name,
                  textColor: AppColors.WHITE,
                  fontWeight: FontWeight.w700,
                  size: 40,
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
                          title: model.login,
                          child: Container(
                            child: InputTextField(
                              hint: model.login,
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
                          title: model.password,
                          child: Container(
                            child: InputTextField(
                              hint: model.password,
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
                          text: model.signIn,
                          textSize: 35,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pushReplacementNamed(context, "/users");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
