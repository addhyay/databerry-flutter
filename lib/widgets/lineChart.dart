// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sales_cast/models/chartDataModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  LineChart({
    Key? key,
    required this.lable,
    this.enableTooltip: false,
  }) : super(key: key);

  final String lable;
  final bool enableTooltip;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> dataPoints = [
      ChartData("Jan", 35),
      ChartData("Feb", 13),
      ChartData("Mar", 34),
      ChartData("Apr", 27),
      ChartData("May", 40),
      ChartData("Jun", 87),
      ChartData("Jul", 16),
      ChartData("Aug", 98),
      ChartData("Sep", 78),
      ChartData("Oct", 50),
      ChartData("Nov", 12),
      ChartData("Dec", 10),
    ];

    final List<ChartData> dataPoints1 = [
      ChartData("Jan", 45),
      ChartData("Feb", 13),
      ChartData("Mar", 17),
      ChartData("Apr", 87),
      ChartData("May", 40.659997),
      ChartData("Jun", 40),
      ChartData("Jul", 98),
      ChartData("Aug", 71),
      ChartData("Sep", 98),
      ChartData("Oct", 15),
      ChartData("Nov", 78),
      ChartData("Dec", 23),
    ];

    return Container(
      width: DimentionLib.w1204,
      height: DimentionLib.h525,
      decoration: BoxDecoration(
        color: ColorLib.white,
        borderRadius: BorderRadius.circular(DimentionLib.r15),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: DimentionLib.w20,
        vertical: DimentionLib.h20,
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
                  Txt(text: lable, style: TxtStyleLib.chartTitleTxt),
                  SizedBox(height: DimentionLib.h10),
                  Txt(
                      text: "Jan - Dec",
                      style: TxtStyleLib.analyticsCardLableTxt),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //purple dot
                  Column(
                    children: [
                      SizedBox(height: DimentionLib.h10),
                      Container(
                        width: DimentionLib.h10,
                        height: DimentionLib.h10,
                        decoration: BoxDecoration(
                          color: ColorLib.linePurple,
                          borderRadius:
                              BorderRadius.circular(DimentionLib.r500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: DimentionLib.w10),
                  //LEGEND Lable purple
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                          text: StringLib.last6mo,
                          style: TxtStyleLib.analyticsCardLableTxt),
                      SizedBox(height: DimentionLib.h10),
                      Txt(text: "475273", style: TxtStyleLib.chartTitleTxt),
                    ],
                  ),
                  SizedBox(width: DimentionLib.w60),
                  //green dot
                  Column(
                    children: [
                      SizedBox(height: DimentionLib.h10),
                      Container(
                        width: DimentionLib.h10,
                        height: DimentionLib.h10,
                        decoration: BoxDecoration(
                          color: ColorLib.lineGreen,
                          borderRadius:
                              BorderRadius.circular(DimentionLib.r500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: DimentionLib.w10),
                  //LEGEND Lable green
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                          text: StringLib.pervious,
                          style: TxtStyleLib.analyticsCardLableTxt),
                      SizedBox(height: DimentionLib.h10),
                      Txt(text: "782396", style: TxtStyleLib.chartTitleTxt),
                    ],
                  ),
                  SizedBox(width: DimentionLib.w40),
                ],
              )
            ],
          ),
          SizedBox(height: DimentionLib.h34),
          Container(
            height: DimentionLib.h375,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(width: 0),
                labelPlacement: LabelPlacement.betweenTicks,
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(dashArray: <double>[5, 3]),
                interval: 50,
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                shared: true,
                color: ColorLib.creamWhite,
                shadowColor: ColorLib.transp,
                textStyle: TxtStyleLib.tooltipTxt,
                format: "point.y %",
                duration: 2,
                borderWidth: 0,
                decimalPlaces: 2,
                animationDuration: 2,
                opacity: 0.65,
              ),
              series: [
                SplineSeries<ChartData, String>(
                  width: 2,
                  color: ColorLib.lineGreen,
                  enableTooltip: enableTooltip,
                  dataSource: dataPoints1,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                ),
                SplineSeries<ChartData, String>(
                  width: 2,
                  color: ColorLib.linePurple,
                  enableTooltip: enableTooltip,
                  dataSource: dataPoints,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
