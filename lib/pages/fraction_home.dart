import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/analyticsCard.dart';
import 'package:sales_cast/widgets/areaChart.dart';
import 'package:sales_cast/widgets/areaChart_cyan.dart';
import 'package:sales_cast/widgets/barChart.dart';
import 'package:sales_cast/widgets/lineChart.dart';
import 'package:sales_cast/widgets/txt.dart';

class HomeFraction extends StatelessWidget {
  HomeFraction({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Container(
          width: DimentionLib.w1204,
          height: DimentionLib.h1030,
          padding: EdgeInsets.symmetric(
            horizontal: DimentionLib.w20,
            vertical: DimentionLib.h34,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt(
                  text: StringLib.dashboardTxt,
                  style: TxtStyleLib.header2Txt,
                ),
                SizedBox(height: DimentionLib.h34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnalyticsCard(
                      lable: StringLib.predictSale,
                      mainValue: 1478286,
                      percentValue: 4.07,
                      isUP: true,
                      mainIcon: SvgPicture.asset("assets/logo/total_sales.svg"),
                    ),
                    AnalyticsCard(
                      lable: StringLib.actualSales,
                      mainValue: 478502,
                      percentValue: 0.24,
                      isUP: true,
                      mainIcon:
                          SvgPicture.asset("assets/logo/expected_sales.svg"),
                    ),
                    AnalyticsCard(
                      lable: StringLib.actualSales,
                      mainValue: 154872,
                      percentValue: 1.67,
                      isUP: false,
                      mainIcon:
                          SvgPicture.asset("assets/logo/actual_sales.svg"),
                    ),
                    AnalyticsCard(
                      lable: StringLib.totalProductsSold,
                      mainValue: 116124,
                      percentValue: 0.00,
                      isUP: true,
                      mainIcon: SvgPicture.asset(
                          "assets/logo/total_products_sold.svg"),
                    ),
                  ],
                ),
                SizedBox(height: DimentionLib.w20),
                LineChart(
                  lable: "Average Sales",
                  prefixCurrency: StringLib.dollar,
                  enableTooltip: true,
                ),
                SizedBox(height: DimentionLib.w20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AreaChart(
                      enableTooltip: true,
                      lable: StringLib.actualSales,
                      prefixCurrency: StringLib.dollar,
                    ),
                    AreaChartCyan(
                      enableTooltip: true,
                      lable: StringLib.monthlyAvg,
                      subHeader: StringLib.subtitleMonthlySales,
                    ),
                    BarChart(
                      enableTooltip: true,
                      lable: "Yearly Sales",
                      subHeader: StringLib.totalYearlySales,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
