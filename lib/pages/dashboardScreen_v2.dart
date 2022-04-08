import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController_v2.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/analyticsCard.dart';
import 'package:sales_cast/widgets/areaChart.dart';
import 'package:sales_cast/widgets/areaChart_cyan.dart';
import 'package:sales_cast/widgets/barChart.dart';
import 'package:sales_cast/widgets/custom_divider.dart';
import 'package:sales_cast/widgets/lineChart.dart';
import 'package:sales_cast/widgets/tabButton.dart';
import 'package:sales_cast/widgets/txt.dart';

class DashboardPageV2 extends StatelessWidget {
  DashboardPageV2({Key? key}) : super(key: key);

  final controller = Get.put(DashboardControllerV2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Container(
                width: DimentionLib.w236,
                height: DimentionLib.h1150,
                color: ColorLib.huePrimaryBlue,
                padding: EdgeInsets.symmetric(
                  vertical: DimentionLib.h20,
                  horizontal: DimentionLib.h10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: DimentionLib.w185,
                          child: Image.asset(
                            'assets/img/databerry_landscape.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        IconButton(
                          disabledColor: ColorLib.greySpace,
                          splashColor: ColorLib.transp,
                          focusColor: ColorLib.white.withOpacity(0.8),
                          hoverColor: ColorLib.transp,
                          color: ColorLib.white.withOpacity(0.5),
                          iconSize: 25,
                          padding: const EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(Icons.menu_open),
                        ),
                      ],
                    ),
                    SizedBox(height: DimentionLib.h20),
                    CustomDivider(),
                    SizedBox(height: DimentionLib.h20),
                    TabButton(
                      lable: StringLib.dashboardTxt,
                      iconImg: SvgPicture.asset('assets/logo/home.svg'),
                      onPressed: () {},
                    ),
                    SizedBox(height: DimentionLib.h46),
                    TabButton(
                      lable: StringLib.filtersTxt,
                      iconImg: SvgPicture.asset('assets/logo/folder.svg'),
                      onPressed: () {},
                    ),
                    SizedBox(height: DimentionLib.h46),
                    TabButton(
                      lable: StringLib.notificationTxt,
                      iconImg: SvgPicture.asset('assets/logo/notification.svg'),
                      onPressed: () {},
                    ),
                    SizedBox(height: DimentionLib.h46),
                    TabButton(
                      lable: StringLib.aboutUsTxt,
                      iconImg: SvgPicture.asset('assets/logo/about_us.svg'),
                      onPressed: () {},
                    ),
                    SizedBox(height: DimentionLib.h80),
                    Row(
                      children: [
                        SizedBox(width: DimentionLib.w20),
                        Txt(
                          text: StringLib.systemTxt,
                          style: TxtStyleLib.tabHeaderTxt,
                        ),
                        SizedBox(width: DimentionLib.w10),
                      ],
                    ),
                    SizedBox(height: DimentionLib.h20),
                    TabButton(
                      lable: StringLib.apperanceTxt,
                      iconImg: SvgPicture.asset("assets/logo/appearance.svg"),
                      onPressed: () {},
                    ),
                    SizedBox(height: DimentionLib.h46),
                    TabButton(
                      lable: StringLib.settingTxt,
                      iconImg: SvgPicture.asset('assets/logo/setting.svg'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                color: ColorLib.creamWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: DimentionLib.w1204,
                      height: DimentionLib.h100,
                      color: ColorLib.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: DimentionLib.w20,
                        vertical: DimentionLib.h10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: DimentionLib.w253,
                            decoration: BoxDecoration(
                              color: ColorLib.fieldWhite,
                              borderRadius: BorderRadius.circular(
                                DimentionLib.r10,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: DimentionLib.w10,
                              vertical: DimentionLib.h10,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/logo/search.svg',
                                  fit: BoxFit.contain,
                                  color: ColorLib.hintColor,
                                ),
                                SizedBox(width: DimentionLib.w10),
                                Txt(
                                    text: StringLib.enterKeywords,
                                    style: TxtStyleLib.hintTxt)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: DimentionLib.h65,
                                height: DimentionLib.h65,
                                decoration: BoxDecoration(
                                  color: ColorLib.fieldWhite,
                                  borderRadius:
                                      BorderRadius.circular(DimentionLib.r500),
                                ),
                                child: SvgPicture.asset(
                                  'assets/logo/bell_icon.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: DimentionLib.w10),
                              Container(
                                width: DimentionLib.h65,
                                height: DimentionLib.h65,
                                decoration: BoxDecoration(
                                  color: ColorLib.fieldWhite,
                                  borderRadius:
                                      BorderRadius.circular(DimentionLib.r500),
                                ),
                                child: Image.asset(
                                  "assets/img/avatar_1.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //fraction page ↓
                    Container(
                      width: DimentionLib.w1204,
                      height: DimentionLib.h2000,
                      padding: EdgeInsets.symmetric(
                        horizontal: DimentionLib.w20,
                        vertical: DimentionLib.h34,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
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
                                  lable: StringLib.totalSales,
                                  mainValue: 1478286,
                                  percentValue: 4.07,
                                  isUP: true,
                                  mainIcon: SvgPicture.asset(
                                      "assets/logo/total_sales.svg"),
                                ),
                                AnalyticsCard(
                                  lable: StringLib.expectedSales,
                                  mainValue: 478502,
                                  percentValue: 0.24,
                                  isUP: true,
                                  mainIcon: SvgPicture.asset(
                                      "assets/logo/expected_sales.svg"),
                                ),
                                AnalyticsCard(
                                  lable: StringLib.actualSales,
                                  mainValue: 154872,
                                  percentValue: 1.67,
                                  isUP: false,
                                  mainIcon: SvgPicture.asset(
                                      "assets/logo/actual_sales.svg"),
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
                              enableTooltip: true,
                            ),
                            SizedBox(height: DimentionLib.w20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AreaChart(lable: StringLib.expectedSales),
                                AreaChartCyan(
                                  lable: StringLib.monthlyAvg,
                                  subHeader: StringLib.subtitleMonthlySales,
                                ),
                                BarChart(
                                  lable: "Yearly Sales",
                                  subHeader: StringLib.totalYearlySales,
                                  
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
