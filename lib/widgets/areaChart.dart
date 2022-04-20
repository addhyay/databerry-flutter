import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController_v2.dart';
import 'package:sales_cast/models/areaChartModel.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/circularLoading.dart';
import 'package:sales_cast/widgets/txt.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaChart extends StatelessWidget {
  AreaChart({
    Key? key,
    required this.lable,
    this.enableTooltip: false,
    this.isGained: true,
    this.percentValue: 50.12,
    this.prefixCurrency: "₹",
  }) : super(key: key);

  final String lable;
  final bool enableTooltip;
  final bool isGained;
  final double percentValue;
  final String prefixCurrency;

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
      child: Column(
        children: [
          SizedBox(height: DimentionLib.h34),
          Txt(text: lable, style: TxtStyleLib.chartTitleTxt),
          Obx(
            () => Txt(
              text: prefixCurrency + " " + controller.totalSalesofStores.value.toInt().toString(),
              style: TxtStyleLib.header2Txt,
            ),
          ),
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
            child: FutureBuilder(
              future: controller.getData("assets/json/sales_per_store.json"),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return SfCartesianChart(
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
                      format: "Rs. point.yM",
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
                        dataSource: controller.storeSales,
                        xValueMapper: (AreaChartModel data, _) => data.storeNum,
                        yValueMapper: (AreaChartModel data, _) =>
                            data.salesValue,
                      )
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
