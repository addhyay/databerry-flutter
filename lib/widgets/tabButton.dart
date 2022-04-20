import 'package:flutter/material.dart';
import 'package:sales_cast/models/tabButtonModel.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class TabButton extends StatelessWidget {
  TabButton({
    Key? key,
    required this.tabButtonModel,
  }) : super(key: key);
  final TabButtonModel tabButtonModel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: DimentionLib.w10),
              Container(
                child: tabButtonModel.iconImg,
              ),
              SizedBox(width: DimentionLib.w10),
              Txt(
                text: tabButtonModel.lable,
                style: TxtStyleLib.snackBarTxt,
              ),
            ],
          ),
          AnimatedContainer(duration: Duration())
        ],
      ),
    );
  }
}
