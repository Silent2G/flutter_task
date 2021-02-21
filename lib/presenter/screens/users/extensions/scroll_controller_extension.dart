import 'package:company_task/presenter/screens/users/providers/opacity_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

extension ScrollControllerExtension on Widget {
  ScrollController initController(OpacityNotifier notifier) {
    ScrollController controller;
    ScrollDirection current;
    return controller = ScrollController()
      ..addListener(() {
        if (current == null ||
            current != controller.position.userScrollDirection) {
          print(controller.position.userScrollDirection);
          current = controller.position.userScrollDirection;
          if (controller.position.userScrollDirection ==
              ScrollDirection.reverse) {
            notifier.setOpacity(0);
          } else {
            notifier.setOpacity(1);
          }
        }
      });
  }
}
