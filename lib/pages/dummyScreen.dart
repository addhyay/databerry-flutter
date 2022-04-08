// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sales_cast/models/chartDataModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/dropdown.dart';
import 'package:sales_cast/widgets/dropdownV2.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(
      enable: true,
      color: ColorLib.creamWhite,
      duration: 2,
      borderWidth: 0,
      decimalPlaces: 2,
      elevation: 0,
      shadowColor: ColorLib.transp,
      animationDuration: 0,
      textStyle: TxtStyleLib.tooltipTxt,
      format: "point.y %",
      opacity: 0.7,
      shared: true,
    );
  }

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

    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Center(
            child: Container(
          width: DimentionLib.w1345,
          height: DimentionLib.w576,
          decoration: BoxDecoration(
            color: ColorLib.white,
            borderRadius: BorderRadius.circular(DimentionLib.r15),
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(text: "Syncfusion Charts", style: TxtStyleLib.bodyTxt),
              SizedBox(height: DimentionLib.h20),
              SfCartesianChart(
                title: ChartTitle(
                  text: "Sales Analysis",
                  textStyle: TxtStyleLib.degreeTxt,
                  borderColor: ColorLib.transp,
                  alignment: ChartAlignment.near,
                ),
                tooltipBehavior: tooltipBehavior,
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(dashArray: <double>[5, 6]),
                  interval: 50,
                ),
                legend: Legend(
                  isVisible: true,
                  offset: Offset(-10, -75),
                ),
                series: [
                  SplineSeries<ChartData, String>(
                    width: 2.5,
                    name: "Previous Sales",
                    dataSource: dataPoints1,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    color: ColorLib.lineGreen,
                    legendItemText: "Previous",
                    
                    legendIconType: LegendIconType.horizontalLine,
                    enableTooltip: true,
                  ),
                  SplineSeries(
                    width: 2.5,
                    name: "Last 6 months",
                    dataSource: dataPoints,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    color: ColorLib.linePurple,
                    legendItemText: "Last 6 months",
                    legendIconType: LegendIconType.horizontalLine,
                    enableTooltip: true,
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
