import 'package:company_task/core/viewmodels/move_notifier.dart';
import 'package:company_task/core/viewmodels/opacity_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

extension ScrollControllerExtension on Widget {
  // ScrollController initController(OpacityNotifier notifier) {
  //   ScrollController controller;
  //   ScrollDirection current;
  //   return controller = ScrollController()
  //     ..addListener(() {
  //       if (current == null ||
  //           current != controller.position.userScrollDirection) {
  //         print(controller.position.userScrollDirection);
  //         current = controller.position.userScrollDirection;
  //         if (controller.position.userScrollDirection ==
  //             ScrollDirection.reverse) {
  //           notifier.setOpacity(0);
  //         } else {
  //           notifier.setOpacity(1);
  //         }
  //       }
  //     });
  // }

  ScrollController initController(MoveNotifier notifier) {
    ScrollController controller;
    ScrollDirection current;
    return controller = ScrollController()
      ..addListener(() {
        if (current == null ||
            current != controller.position.userScrollDirection) {
          current = controller.position.userScrollDirection;
          if (controller.position.userScrollDirection ==
              ScrollDirection.reverse) {
            notifier.moveDown(false);
          } else {
            notifier.moveDown(true);
          }
        }
      });
  }
}
