// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController_v2.dart';
import 'package:sales_cast/models/lineChartModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/pathLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/circularLoading.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  final controller = Get.put(DashboardControllerV2());

  LineChart({
    Key? key,
    required this.lable,
    this.enableTooltip: false,
    this.prefixCurrency: "₹",
  }) : super(key: key);

  final String lable;
  final bool enableTooltip;
  final String prefixCurrency;

  @override
  Widget build(BuildContext context) {
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
                          text: StringLib.predictedSales,
                          style: TxtStyleLib.analyticsCardLableTxt),
                      SizedBox(height: DimentionLib.h10),
                      Obx(
                        () => Txt(
                          text:
                              "${controller.totalPredictedSales.value.toInt()}",
                          style: TxtStyleLib.chartTitleTxt,
                        ),
                      ),
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
                          text: StringLib.actualSales,
                          style: TxtStyleLib.analyticsCardLableTxt),
                      SizedBox(height: DimentionLib.h10),
                      Obx(
                        () => Txt(
                          text: "${controller.totalActualSales.value.toInt()}",
                          style: TxtStyleLib.chartTitleTxt,
                        ),
                      ),
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
            child: FutureBuilder(
              future: controller.getData(PathLib.predictiedVsActualSales2010),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return SfCartesianChart(
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
                      interval: 50000,
                    ),
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      shared: true,
                      color: ColorLib.creamWhite,
                      shadowColor: ColorLib.transp,
                      textStyle: TxtStyleLib.tooltipTxt,
                      format: prefixCurrency + " " + "point.yM",
                      duration: 2,
                      borderWidth: 0,
                      decimalPlaces: 2,
                      animationDuration: 2,
                      opacity: 0.65,
                    ),
                    series: [
                      SplineSeries<LineChartModel, String>(
                        width: 2,
                        color: ColorLib.lineGreen,
                        enableTooltip: enableTooltip,
                        dataSource: controller.actualSales,
                        xValueMapper: (LineChartModel data, _) => data.month,
                        yValueMapper: (LineChartModel data, _) =>
                            data.salesValue,
                      ),
                      SplineSeries<LineChartModel, String>(
                        width: 2,
                        color: ColorLib.linePurple,
                        enableTooltip: enableTooltip,
                        dataSource: controller.predictedSales,
                        xValueMapper: (LineChartModel data, _) => data.month,
                        yValueMapper: (LineChartModel data, _) =>
                            data.salesValue,
                      ),
                    ],
                  );
                else
                  return CircularLoading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
