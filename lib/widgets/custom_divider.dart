import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DimentionLib.w185,
      child: Divider(
        color: ColorLib.huePrimaryBlueDull,
        thickness: 1,
      ),
    );
  }
}
