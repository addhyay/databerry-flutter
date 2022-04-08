import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_cast/models/monthlySaleChartModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaChartCyan extends StatelessWidget {
  AreaChartCyan({
    Key? key,
    required this.lable,
    required this.subHeader,
    this.enableTooltip: false,
  }) : super(key: key);

  final String lable, subHeader;
  final bool enableTooltip;

  @override
  Widget build(BuildContext context) {
    final List<MonthlySalesModel> datapoints = [
      for (int i = 1; i <= 30; i++) MonthlySalesModel(i, Random().nextDouble())
    ];

    return Container(
      width: DimentionLib.w375,
      height: DimentionLib.h525,
      decoration: BoxDecoration(
        color: ColorLib.white,
        borderRadius: BorderRadius.circular(DimentionLib.r15),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: DimentionLib.h34,
        vertical: DimentionLib.h34,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: DimentionLib.w209,
                    child: Txt(text: lable, style: TxtStyleLib.chartHeaderTxt),
                  ),
                  SizedBox(height: DimentionLib.h20),
                  Container(
                    width: DimentionLib.w209,
                    child:
                        Txt(text: subHeader, style: TxtStyleLib.subheaderTxt2),
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/logo/share_icon.svg',
                fit: BoxFit.contain,
              ),
            ],
          ),
          // SizedBox(height: DimentionLib.h34),
          Container(
            width: DimentionLib.w375,
            height: DimentionLib.h300,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(width: 0),
                isVisible: false,
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(width: 0),
                isVisible: false,
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                shared: true,
                color: ColorLib.creamWhite,
                shadowColor: ColorLib.transp,
                textStyle: TxtStyleLib.tooltipTxt,
                format: "Rs. point.yK",
                duration: 2,
                borderWidth: 0,
                decimalPlaces: 2,
                animationDuration: 2,
                opacity: 0.65,
              ),
              series: [
                SplineAreaSeries(
                  gradient: LinearGradient(
                    colors: [
                      ColorLib.oceanBlue.withOpacity(0.5),
                      ColorLib.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  enableTooltip: enableTooltip,
                  borderDrawMode: BorderDrawMode.top,
                  borderColor: ColorLib.oceanBlue,
                  borderWidth: 3,
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.circle,
                    color: ColorLib.oceanBlue,
                    height: DimentionLib.h10,
                    width: DimentionLib.h10,
                    borderColor: ColorLib.oceanBlue,
                  ),
                  dataSource: datapoints,
                  xValueMapper: (MonthlySalesModel data, _) => data.day,
                  yValueMapper: (MonthlySalesModel data, _) => data.sales,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
