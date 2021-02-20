import 'package:company_task/presenter/scaffolds/text.dart';
import 'package:company_task/providers/dummy_stub_notifier.dart';
import 'package:company_task/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  @override
  State createState() {
    return UsersScreenState();
  }
}

class UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(),
    );
  }
}
