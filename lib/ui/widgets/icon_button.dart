import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final Function function;
  final BoxConstraints constraints;

  AppIconButton({@required this.icon, @required this.function, this.constraints});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: function,
      splashRadius: 20,
      padding: EdgeInsets.zero,
      constraints: constraints,
    );
  }
}
