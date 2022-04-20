import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController_v2.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class SettingFraction extends StatelessWidget {
  SettingFraction({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;
  final contoller = Get.put(DashboardControllerV2());

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
                  text: StringLib.settingTxt,
                  style: TxtStyleLib.header2Txt,
                ),
                SizedBox(height: DimentionLib.h34),
                InkWell(
                  onTap: () => contoller.checkWithFirebaseLogout(context),
                  child: Container(
                    width: DimentionLib.w60,
                    decoration: BoxDecoration(
                      color: ColorLib.huePrimaryBlueDull,
                      borderRadius: BorderRadius.circular(DimentionLib.r10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: DimentionLib.w10,
                      vertical: DimentionLib.h20,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color: ColorLib.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
