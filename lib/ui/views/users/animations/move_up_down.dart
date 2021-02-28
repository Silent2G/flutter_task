import 'package:company_task/core/viewmodels/move_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonMoveUpDown extends StatefulWidget {
  final Widget child;

  ButtonMoveUpDown({@required this.child});

  @override
  State<StatefulWidget> createState() => ButtonMoveUpDownState();
}

class ButtonMoveUpDownState extends State<ButtonMoveUpDown>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offsetDown;
  Animation<Offset> offsetUp;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offsetDown = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 2.0))
        .animate(controller);

    offsetUp = Tween<Offset>(begin: Offset(0.0, 2.0), end: Offset(0.0, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer<MoveNotifier>(
    //   builder: (context, MoveNotifier notifier, child) {
    //     if (notifier.down != null) {
    //       if (notifier.down) {
    //         controller.reset();
    //         controller.forward();
    //       } else {
    //         controller.reset();
    //         controller.forward();
    //       }
    //     }
    //     return Align(
    //       alignment: Alignment.bottomCenter,
    //       child: notifier.down != null
    //           ? SlideTransition(
    //               position: notifier.down ? offsetDown : offsetUp,
    //               child: widget.child,
    //             )
    //           : Container(),
    //     );
    //   },
    // );

    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: offsetDown,
        child: widget.child,
      )
    );
  }
}
