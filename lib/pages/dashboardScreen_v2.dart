// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController_v2.dart';
import 'package:sales_cast/pages/fraction_Notification.dart';
import 'package:sales_cast/pages/fraction_aboutUs.dart';
import 'package:sales_cast/pages/fraction_appearance.dart';
import 'package:sales_cast/pages/fraction_filters.dart';
import 'package:sales_cast/pages/fraction_home.dart';
import 'package:sales_cast/pages/fraction_setting.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/modelLib.dart';
import 'package:sales_cast/utils/pathLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/custom_divider.dart';
import 'package:sales_cast/widgets/txt.dart';

class DashboardPageV2 extends StatelessWidget {
  DashboardPageV2({Key? key}) : super(key: key);

  final controller = Get.put(DashboardControllerV2());
  final pageController = PageController();

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
                            PathLib.databerryLandscape,
                            fit: BoxFit.contain,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          disabledColor: ColorLib.greySpace,
                          splashColor: ColorLib.transp,
                          hoverColor: ColorLib.transp,
                          focusColor: ColorLib.white.withOpacity(0.8),
                          color: ColorLib.white.withOpacity(0.5),
                          iconSize: 25,
                          padding: const EdgeInsets.all(0),
                          icon: Icon(Icons.menu_open_rounded),
                        ),
                      ],
                    ),
                    SizedBox(height: DimentionLib.h20),
                    CustomDivider(),
                    SizedBox(height: DimentionLib.h20),
                    Container(
                      height: DimentionLib.h324,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          final tabButtonModel = ModelListLib.appTabs[index];
                          return Obx(
                            () => TextButton(
                              onPressed: () {
                                controller.updateSelection(index);
                                pageController.jumpToPage(index);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: DimentionLib.w10),
                                      Container(
                                        child: tabButtonModel.iconImg,
                                      ),
                                      SizedBox(width: DimentionLib.w10),
                                      Txt(
                                        text: tabButtonModel.lable,
                                        style: TxtStyleLib.snackBarTxt,
                                      ),
                                    ],
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    width: DimentionLib.w4,
                                    height: (controller.selectedIndex.value ==
                                            index)
                                        ? DimentionLib.h34
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: ColorLib.white,
                                      borderRadius: BorderRadius.circular(
                                          DimentionLib.r15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: DimentionLib.h46),
                        itemCount: 4,
                      ),
                    ),
                    SizedBox(height: DimentionLib.h34),
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
                    Container(
                      height: DimentionLib.h375,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          final tabButtonModel = ModelListLib.systemTabs[index];
                          return Obx(
                            () => TextButton(
                              onPressed: () {
                                controller.updateSelection(index + 4);
                                pageController.jumpToPage(index + 4);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: DimentionLib.w10),
                                      Container(child: tabButtonModel.iconImg),
                                      SizedBox(width: DimentionLib.w10),
                                      Txt(
                                        text: tabButtonModel.lable,
                                        style: TxtStyleLib.snackBarTxt,
                                      ),
                                    ],
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    width: DimentionLib.w4,
                                    height: (controller.selectedIndex.value ==
                                            index + 4)
                                        ? DimentionLib.h34
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: ColorLib.white,
                                      borderRadius: BorderRadius.circular(
                                          DimentionLib.r15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: DimentionLib.h46),
                        itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
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
                                    borderRadius: BorderRadius.circular(
                                        DimentionLib.r500),
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
                                    borderRadius: BorderRadius.circular(
                                        DimentionLib.r500),
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
                      Column(
                        children: [
                          Container(
                            color: ColorLib.balanceOrange.withOpacity(0.5),
                            height: DimentionLib.h1040,
                            child: PageView(
                              controller: pageController,
                              children: [
                                HomeFraction(
                                  scrollController: controller.scrollController,
                                ),
                                FilterFraction(
                                  scrollController: controller.scrollController,
                                ),
                                NotificationFraction(
                                  scrollController: controller.scrollController,
                                ),
                                AboutUsFraction(
                                  scrollController: controller.scrollController,
                                ),
                                AppearanceFraction(
                                  scrollController: controller.scrollController,
                                ),
                                SettingFraction(
                                  scrollController: controller.scrollController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
