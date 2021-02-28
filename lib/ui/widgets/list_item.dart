
import 'package:company_task/core/models/user.dart';
import 'package:company_task/ui/widgets/shadow_wrap.dart';
import 'package:company_task/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'avatar_widget.dart';

class ListItem extends StatelessWidget {
  final User user;

  ListItem({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowWrap(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          user.avatarUrl != null
              ? Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: AvatarWidget(
                    key: UniqueKey(),
                    url: user.avatarUrl,
                  ),
                )
              : Container(),
          SizedBox(
            width: 20.w,
          ),
          Container(
            child: TitleText(
              user.login,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
