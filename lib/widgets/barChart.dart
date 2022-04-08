// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_cast/models/ColumnChartModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget {
  BarChart({
    Key? key,
    required this.lable,
    required this.subHeader,
    this.enableTooltip: false,
    this.yearList: const ["2017", "2018", "2019", "2020", "2021"],
    this.valueList: const [65, 100, 20, 54, 50],
  }) : super(key: key);

  final String lable, subHeader;
  final bool enableTooltip;
  List<String> yearList;
  List<double> valueList;

  String findMaxSale(List<double> values) {
    double max;
    max = -100000;
    for (int i = 0; i < values.length; i++) {
      if (max < values[i]) max = values[i];
    }
    return yearList[values.indexOf(max)];
  }

  @override
  Widget build(BuildContext context) {
    final List<ColumnChartData> datapoints = [
      for (int i = 0; i < yearList.length; i++)
        ColumnChartData(
          yearList[i],
          valueList[i],
          findMaxSale(valueList) == yearList[i]
              ? ColorLib.barGreen
              : ColorLib.creamWhite,
        )
    ];

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
            child: SfCartesianChart(
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
                format: "Rs. point.yK",
                duration: 2,
                borderWidth: 0,
                decimalPlaces: 2,
                animationDuration: 2,
                opacity: 0.65,
              ),
              series: [
                ColumnSeries(
                  color: ColorLib.creamWhite,
                  dataSource: datapoints,
                  xValueMapper: (ColumnChartData data, _) => data.year,
                  yValueMapper: (ColumnChartData data, _) => data.sales,
                  pointColorMapper: (ColumnChartData data, _) => data.barColor,
                  borderRadius: BorderRadius.circular(DimentionLib.r15),
                  enableTooltip: enableTooltip,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
