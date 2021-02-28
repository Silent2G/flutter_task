import 'package:flutter/material.dart';

class DialogLaunchers {
  static Future showDialog(
      {@required BuildContext context, @required Widget dialog}) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: Duration(milliseconds: 400),
        // how long it takes to popup dialog after button click
        pageBuilder: (_, __, ___) {
          return dialog;
        });
  }
}