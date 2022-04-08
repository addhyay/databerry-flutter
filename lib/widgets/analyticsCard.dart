import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class AnalyticsCard extends StatelessWidget {
  AnalyticsCard({
    Key? key,
    required this.lable,
    required this.mainValue,
    required this.percentValue,
    required this.mainIcon,
    required this.isUP,
  }) : super(key: key);

  final String lable;
  final bool isUP;
  final mainIcon;
  final double mainValue, percentValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DimentionLib.w275,
      height: DimentionLib.h175,
      decoration: BoxDecoration(
        color: ColorLib.white,
        borderRadius: BorderRadius.circular(DimentionLib.r15),
      ),
      padding: EdgeInsets.only(left: DimentionLib.w40),
      child: Center(
        child: Row(
          children: [
            Container(
              child: mainIcon,
            ),
            SizedBox(width: DimentionLib.w10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: DimentionLib.h46),
                Txt(
                    text: mainValue.toString(),
                    style: TxtStyleLib.analyticsCardHeaderTxt),
                SizedBox(height: DimentionLib.h5),
                Txt(text: lable, style: TxtStyleLib.analyticsCardLableTxt),
                SizedBox(height: DimentionLib.h5),
                Row(
                  children: [
                    Row(
                      children: [
                        isUP
                            ? percentValue == 0
                                ? SvgPicture.asset(
                                    "assets/logo/trending_up.svg",
                                    color: ColorLib.balanceOrange,
                                  )
                                : SvgPicture.asset(
                                    "assets/logo/trending_up.svg")
                            : SvgPicture.asset("assets/logo/trending_down.svg"),
                        SizedBox(width: DimentionLib.w4),
                        Txt(
                          text: percentValue.toString() + "%",
                          style: isUP
                              ? percentValue == 0
                                  ? TxtStyleLib.analyticsCardPrecentUPBalanceTxt
                                  : TxtStyleLib.analyticsCardPrecentUPTxt
                              : TxtStyleLib.analyticsCardPercentDOWNTxt,
                        ),
                      ],
                    ),
                    SizedBox(width: DimentionLib.w10),
                    Txt(
                      text: StringLib.lastMonth,
                      style: TxtStyleLib.analyticsCardLableTxt,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
