import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/predictSaleFractionController.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class CustomRadios extends StatefulWidget {
  CustomRadios({
    Key? key,
    required this.lableList,
    required this.type,
  }) : super(key: key);

  final List<String> lableList;
  final String type;

  @override
  State<CustomRadios> createState() => _CustomRadiosState();
}

class _CustomRadiosState extends State<CustomRadios> {
  final controller = Get.put(PredictSaleFractionController());
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < widget.lableList.length; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                selected = i;
              });
              if (widget.type == StringLib.storeTypeHeader)
                controller.storeTypeTxt =
                    widget.lableList[selected].toUpperCase().trim();
              else
                controller.holidayTxt =
                    widget.lableList[selected].toUpperCase().trim();
            },
            child: Container(
              width: DimentionLib.w157,
              decoration: BoxDecoration(
                color: selected == i
                    ? ColorLib.huePrimaryBlue.withOpacity(0.45)
                    : ColorLib.huePrimaryBlue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(DimentionLib.r10),
                border: Border.all(
                  color:
                      selected == i ? ColorLib.huePrimaryBlue : ColorLib.transp,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(DimentionLib.w10),
              child: Center(
                child: Txt(
                  text: widget.lableList[i].trim(),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: DimentionLib.sp14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: selected == i
                        ? ColorLib.huePrimaryBlue
                        : ColorLib.huePrimaryBlue.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
