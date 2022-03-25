import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class BlueBtn extends StatelessWidget {
  BlueBtn({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorLib.huePrimaryBlue,
        borderRadius: BorderRadius.circular(DimentionLib.r8),
      ),
      padding: EdgeInsets.symmetric(vertical: DimentionLib.h20),
      child: Center(
        child: Txt(
          text: txt,
          style: TxtStyleLib.btnTxt,
        ),
      ),
    );
  }
}
