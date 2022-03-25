import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: DimentionLib.w40,
        height: DimentionLib.w40,
        child: CircularProgressIndicator(
          color: ColorLib.huePrimaryBlue,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
