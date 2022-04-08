import 'package:flutter/material.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class TabButton extends StatelessWidget {
  TabButton({
    Key? key,
    required this.lable,
    required this.iconImg,
    required this.onPressed,
  }) : super(key: key);
  final String lable;
  final iconImg;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: DimentionLib.w10),
          Container(
            child: iconImg,
          ),
          SizedBox(width: DimentionLib.w10),
          Txt(
            text: lable,
            style: TxtStyleLib.snackBarTxt,
          ),
        ],
      ),
    );
  }
}
