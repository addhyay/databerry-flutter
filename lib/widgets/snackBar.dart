import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

// ignore: must_be_immutable
class SnkBar extends StatelessWidget {
  SnkBar({
    Key? key,
    required this.message,
    required this.milisec,
    this.tintColor,
    this.textStyle,
  }) : super(key: key);

  final String message;
  final int milisec;
  Color? tintColor = ColorLib.huePrimaryBlue;
  TextStyle? textStyle = TxtStyleLib.snackBarTxt;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: Duration(milliseconds: milisec),
      backgroundColor: tintColor!,
      content: Txt(
        text: message,
        style: textStyle!,
        textAlign: TextAlign.center,
      ),
    );
  }
}
