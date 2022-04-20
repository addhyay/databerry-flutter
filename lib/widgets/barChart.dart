// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController_v2.dart';
import 'package:sales_cast/models/ColumnChartModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/pathLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/circularLoading.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget {
  BarChart({
    Key? key,
    required this.lable,
    required this.subHeader,
    this.enableTooltip: false,
    this.prefixCurrency: "₹",
    this.yearList: const ["2010", "2011", "2012"],
    this.valueList: const [654680, 100124, 20125],
  }) : super(key: key);

  final String lable, subHeader;
  final bool enableTooltip;
  final String prefixCurrency;
  List<String> yearList;
  List<double> valueList;

  final controller = Get.put(DashboardControllerV2());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DimentionLib.w375,
      height: DimentionLib.h525,
      decoration: BoxDecoration(
        color: ColorLib.white,
        borderRadius: BorderRadius.circular(DimentionLib.r15),
      ),
      padding: EdgeInsets.symmetric(
        vertical: DimentionLib.h34,
        horizontal: DimentionLib.h34,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/logo/barChart_icon.svg',
                fit: BoxFit.contain,
              ),
              SizedBox(width: DimentionLib.w10),
              Txt(
                text: lable,
                style: TxtStyleLib.chartHeaderTxt,
              )
            ],
          ),
          SizedBox(height: DimentionLib.h20),
          Txt(text: subHeader, style: TxtStyleLib.subheaderTxt2),
          SizedBox(),
          Container(
            height: DimentionLib.h324,
            width: DimentionLib.w375,
            child: FutureBuilder(
              future: controller.getData(PathLib.predictiedVsActualSales2012),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                      axisLine: AxisLine(width: 0),
                      labelPlacement: LabelPlacement.betweenTicks,
                      labelStyle: TxtStyleLib.tooltipTxt,
                      isInversed: true,
                    ),
                    primaryYAxis: NumericAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                      axisLine: AxisLine(width: 0),
                      isVisible: false,
                      interval: 5,
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
                      ColumnSeries(
                        color: ColorLib.creamWhite,
                        dataSource: controller.yearlySales,
                        xValueMapper: (ColumnChartData data, _) => data.year,
                        yValueMapper: (ColumnChartData data, _) => data.sales,
                        pointColorMapper: (ColumnChartData data, _) =>
                            data.barColor,
                        borderRadius: BorderRadius.circular(DimentionLib.r15),
                        enableTooltip: enableTooltip,
                      ),
                    ],
                  );
                else
                  return CircularLoading();
              },
            ),
          )
        ],
      ),
    );
  }
}
