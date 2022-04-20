import 'package:flutter/material.dart';
import 'package:sales_cast/utils/dimentionLib.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    Key? key,
    this.storkeWidth: 3.0,
    this.color: const Color(0xff596dda),
  }) : super(key: key);

  final double storkeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: DimentionLib.w40,
        height: DimentionLib.w40,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: storkeWidth,
        ),
      ),
    );
  }
}
