import 'package:company_task/api/users/providers/users_notifier.dart';
import 'package:company_task/presenter/scaffolds/icon_button.dart';
import 'package:company_task/presenter/scaffolds/text.dart';
import 'package:company_task/presenter/screens/users/dialogs/log_out_dialog.dart';
import 'package:company_task/presenter/screens/users/widgets/list_item.dart';
import 'package:company_task/providers/dummy_stub_notifier.dart';
import 'package:company_task/resources/app_colors.dart';
import 'package:company_task/util/dialog_launchers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersScreen extends StatefulWidget {
  @override
  State createState() {
    return UsersScreenState();
  }
}

class UsersScreenState extends State<UsersScreen> {
  UsersNotifier usersNotifier;

  @override
  void initState() {
    usersNotifier = Provider.of<UsersNotifier>(context, listen: false);
    usersNotifier.loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Consumer<DummyStubNotifier>(
            builder: (context, DummyStubNotifier notifier, child) {
              if (notifier.dummyStub == null ||
                  notifier.dummyStub.name == null) {
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
        body: Consumer<UsersNotifier>(
          builder: (context, UsersNotifier notifier, child) {
            if (notifier.users == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notifier.users.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                        top: index == 0 ? 30.h : 0,
                        bottom:
                            index == notifier.users.length - 1 ? 50.h : 20.h),
                    child: ListItem(
                      key: UniqueKey(),
                      user: notifier.users[index],
                    ),
                  );
                });
          },
        ));
  }
}
