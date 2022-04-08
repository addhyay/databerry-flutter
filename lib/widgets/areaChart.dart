import 'package:flutter/material.dart';
import 'package:sales_cast/models/chartDataModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaChart extends StatelessWidget {
  AreaChart({
    Key? key,
    required this.lable,
    this.enableTooltip: false,
    this.isGained: true,
    this.percentValue: 50.12,
  }) : super(key: key);

  final String lable;
  final bool enableTooltip;
  final bool isGained;
  final double percentValue;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> dataPoints = [
      ChartData("Jan", 35),
      ChartData("Feb", 13),
      ChartData("Mar", 34),
      ChartData("Apr", 27),
      ChartData("May", 40),
      ChartData("Jun", 87),
      ChartData("Jul", 36),
      ChartData("Aug", 98),
      ChartData("Sep", 78),
      ChartData("Oct", 50),
      ChartData("Nov", 12),
      ChartData("Dec", 10),
    ];

    return Container(
      width: DimentionLib.w375,
      height: DimentionLib.h525,
      decoration: BoxDecoration(
        color: ColorLib.white,
        borderRadius: BorderRadius.circular(DimentionLib.r15),
      ),
      child: Column(
        children: [
          SizedBox(height: DimentionLib.h34),
          Txt(text: lable, style: TxtStyleLib.chartTitleTxt),
          Txt(text: "Є682.5", style: TxtStyleLib.header2Txt),
          SizedBox(height: DimentionLib.h5),
          Container(
            decoration: BoxDecoration(
              color: ColorLib.huePrimaryBlue,
              borderRadius: BorderRadius.circular(DimentionLib.r30),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: DimentionLib.w10, vertical: DimentionLib.h10),
            child: isGained
                ? Txt(
                    text: "+" + percentValue.toString(),
                    style: TxtStyleLib.btnTxt)
                : Txt(
                    text: "-" + percentValue.toString(),
                    style: TxtStyleLib.btnTxt),
          ),
          Container(
            height: DimentionLib.h324,
            width: DimentionLib.w375,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
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
                SplineAreaSeries<ChartData, String>(
                  gradient: LinearGradient(
                    colors: [
                      ColorLib.huePrimaryBlue.withOpacity(0.7),
                      ColorLib.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  enableTooltip: enableTooltip,
                  borderDrawMode: BorderDrawMode.top,
                  borderColor: ColorLib.huePrimaryBlue,
                  borderWidth: 3,
                  dataSource: dataPoints,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
