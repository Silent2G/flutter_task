import 'package:company_task/core/enums/viewstate.dart';
import 'package:company_task/core/viewmodels/move_notifier.dart';
import 'package:company_task/core/viewmodels/users_model.dart';
import 'package:company_task/ui/shared/app_colors.dart';
import 'package:company_task/ui/shared/dialog_launchers.dart';
import 'package:company_task/ui/views/base_view.dart';
import 'package:company_task/ui/views/users/animations/move_up_down.dart';
import 'package:company_task/ui/views/users/dialogs/log_out_dialog.dart';
import 'package:company_task/ui/widgets/button.dart';
import 'package:company_task/ui/widgets/icon_button.dart';
import 'package:company_task/ui/widgets/list_item.dart';
import 'package:company_task/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:company_task/ui/views/users/extentions/scroll_controller_extension.dart';

class UsersView extends StatefulWidget {
  @override
  State createState() {
    return _UsersViewState();
  }
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<UsersModel>(
        onModelReady: (model) => model.loadUsers(),
        builder: (BuildContext context, UsersModel model, Widget child) =>
            Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: TitleText(
                  model.dummyStub.name,
                  textColor: AppColors.WHITE,
                  fontWeight: FontWeight.w700,
                  size: 40,
                ),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: AppIconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Theme.of(context).textSelectionColor,
                        size: 25,
                      ),
                      function: () {
                        DialogLaunchers.showDialog(
                            context: context, dialog: LogOutDialog());
                      },
                    ),
                  )
                ],
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  model.state == ViewState.Busy ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ) : ListView.builder(
                    // controller: Container().initController(
                    //     Provider.of<MoveNotifier>(context,
                    //         listen: false)),
                      padding: EdgeInsets.zero,
                      itemCount: model.users.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 30.w,
                              right: 30.w,
                              top: index == 0 ? 30.h : 0,
                              bottom: index == model.users.length - 1
                                  ? 50.h
                                  : 20.h),
                          child: ListItem(
                            key: UniqueKey(),
                            user: model.users[index],
                          ),
                        );
                      }),
                  // Consumer<UsersNotifier>(
                  //   builder: (context, UsersNotifier notifier, child) {
                  //     if (notifier.users == null) {
                  //       return Container(
                  //         child: Center(
                  //           child: CircularProgressIndicator(),
                  //         ),
                  //       );
                  //     }
                  //     return ListView.builder(
                  //         controller: Container().initController(
                  //             Provider.of<MoveNotifier>(context,
                  //                 listen: false)),
                  //         padding: EdgeInsets.zero,
                  //         itemCount: notifier.users.length,
                  //         scrollDirection: Axis.vertical,
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Container(
                  //             padding: EdgeInsets.only(
                  //                 left: 30.w,
                  //                 right: 30.w,
                  //                 top: index == 0 ? 30.h : 0,
                  //                 bottom: index == notifier.users.length - 1
                  //                     ? 50.h
                  //                     : 20.h),
                  //             child: ListItem(
                  //               key: UniqueKey(),
                  //               user: notifier.users[index],
                  //             ),
                  //           );
                  //         });
                  //   },
                  // ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 50.h, right: 30.w, left: 30.w),
                    child: ButtonMoveUpDown(
                      child: ColorButton(
                          text: "Button",
                          color: AppColors.BLUE,
                          textColor: AppColors.WHITE,
                          textSize: 35,
                          onPressed: null),
                    ),
                  )
                ],
              ),
            ));
  }
}
