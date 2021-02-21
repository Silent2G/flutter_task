import 'package:company_task/presenter/screens/users/providers/opacity_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonAnimatedOpacity extends StatefulWidget {
  final Widget child;

  ButtonAnimatedOpacity({@required this.child});

  @override
  State createState() {
    return ButtonAnimatedOpacityState();
  }
}

class ButtonAnimatedOpacityState extends State<ButtonAnimatedOpacity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OpacityNotifier>(
      builder: (context, OpacityNotifier notifier, child) {
        return AnimatedOpacity(
          opacity: notifier.opacity,
          duration: Duration(seconds: 1),
          child: widget.child,
        );
      },
    );
  }
}
