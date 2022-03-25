// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/dashboardController.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/inputBorderLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/dropdown.dart';
import 'package:sales_cast/widgets/primerBlueBtn.dart';
import 'package:sales_cast/widgets/radioButtons.dart';
import 'package:sales_cast/widgets/txt.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final controller = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: DimentionLib.h34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: DimentionLib.w157,
                  height: DimentionLib.h175,
                  child: Image.asset(
                    "assets/img/databerry.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: DimentionLib.w0),
                Column(
                  children: [
                    Txt(
                      text: StringLib.dashboardHeader,
                      style: TxtStyleLib.headerTxt,
                    ),
                    Txt(
                      text: StringLib.dashboardSubheader,
                      style: TxtStyleLib.subheaderTxt,
                    ),
                  ],
                ),
                SizedBox(width: DimentionLib.w150),
                InkWell(
                  onTap: () => controller.checkWithFirebaseLogout(context),
                  child: Container(
                    width: DimentionLib.w60,
                    height: DimentionLib.w60,
                    decoration: BoxDecoration(
                      color: ColorLib.greyPale.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(DimentionLib.r10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.logout_rounded,
                        color: ColorLib.creamWhite,
                        size: 28,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: DimentionLib.h20),
            Container(
              width: DimentionLib.w1345,
              height: DimentionLib.h867,
              decoration: BoxDecoration(
                color: ColorLib.white,
                borderRadius: BorderRadius.circular(DimentionLib.r15),
              ),
              child: Row(
                children: [
                  Container(
                    width: DimentionLib.w1345 / 2,
                    height: DimentionLib.h867,
                    decoration: BoxDecoration(
                      color: ColorLib.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(DimentionLib.r15),
                        bottomLeft: Radius.circular(DimentionLib.r15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: (DimentionLib.w1345 / 2 - 600) / 2),
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.dashboardFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //* Store Number ↓
                            Txt(
                              text: StringLib.storeHeader,
                              style: TxtStyleLib.bodyTxt,
                            ),
                            SizedBox(height: DimentionLib.h15),
                            TextFormField(
                              controller: controller.storeController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                enabledBorder: InputBorderLib.enableStyle,
                                focusedBorder: InputBorderLib.focusStyle,
                                errorBorder: InputBorderLib.errorStyle,
                                focusedErrorBorder:
                                    InputBorderLib.focusErrorStyle,
                                filled: true,
                                fillColor: ColorLib.fieldWhite,
                                hintText: StringLib.storeHint,
                                hintStyle: TxtStyleLib.hintTxt,
                                errorStyle: TxtStyleLib.errorTxt,
                              ),
                              validator: (value) {
                                return controller.validateStore(value!);
                              },
                            ),
                            SizedBox(height: DimentionLib.h46),
                            //* Store type ↓
                            Txt(
                              text: StringLib.storeTypeHeader,
                              style: TxtStyleLib.bodyTxt,
                            ),
                            SizedBox(height: DimentionLib.h15),
                            // CustomDropdown(
                            //   hintText: StringLib.storeTypeHint,
                            //   dataItems: 3,
                            //   datavalues: ['Tiny', 'Small', 'Large'],
                            // ),
                            CustomRadios(
                              lableList: ['Tiny', 'Small', 'Large'],
                              type: StringLib.storeTypeHeader,
                            ),
                            SizedBox(height: DimentionLib.h46),
                            //* Department ↓
                            Txt(
                              text: StringLib.departmentHeader,
                              style: TxtStyleLib.bodyTxt,
                            ),
                            SizedBox(height: DimentionLib.h15),
                            TextFormField(
                              controller: controller.departmentController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                enabledBorder: InputBorderLib.enableStyle,
                                focusedBorder: InputBorderLib.focusStyle,
                                errorBorder: InputBorderLib.errorStyle,
                                focusedErrorBorder:
                                    InputBorderLib.focusErrorStyle,
                                filled: true,
                                fillColor: ColorLib.fieldWhite,
                                hintText: StringLib.departmentHint,
                                hintStyle: TxtStyleLib.hintTxt,
                                errorStyle: TxtStyleLib.errorTxt,
                              ),
                              validator: (value) {
                                return controller.validateDepartment(value!);
                              },
                            ),
                            SizedBox(height: DimentionLib.h46),
                            //* Holiday ↓
                            Txt(
                              text: StringLib.holidayHeader,
                              style: TxtStyleLib.bodyTxt,
                            ),
                            SizedBox(height: DimentionLib.h15),
                            // CustomDropdown(
                            //   hintText: StringLib.holidayHint,
                            //   dataItems: 2,
                            //   datavalues: ['True', 'False'],
                            // ),
                            CustomRadios(
                              lableList: ['True', 'False'],
                              type: StringLib.holidayHeader,
                            ),
                            SizedBox(height: DimentionLib.h46),
                            //* Temprature ↓
                            Txt(
                              text: StringLib.tempratureHeader,
                              style: TxtStyleLib.bodyTxt,
                            ),
                            SizedBox(height: DimentionLib.h15),
                            TextFormField(
                              controller: controller.tempratureController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.toggleTempUnit();
                                    controller.tempUnitInverter();
                                  },
                                  child: Container(
                                    width: DimentionLib.w60,
                                    height: DimentionLib.h80,
                                    decoration: BoxDecoration(
                                        color: ColorLib.greyDull,
                                        borderRadius: BorderRadius.only(
                                          topRight:
                                              Radius.circular(DimentionLib.r15),
                                          bottomRight:
                                              Radius.circular(DimentionLib.r15),
                                        )),
                                    child: Center(child: Obx(() {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Txt(
                                            text: "°",
                                            style: TxtStyleLib.degreeTxt,
                                          ),
                                          Txt(
                                            text: !controller.tempUnit.value
                                                ? "C"
                                                : "F",
                                            style: TxtStyleLib.tempUnitTxt,
                                          )
                                        ],
                                      );
                                    })),
                                  ),
                                ),
                                enabledBorder: InputBorderLib.enableStyle,
                                focusedBorder: InputBorderLib.focusStyle,
                                errorBorder: InputBorderLib.errorStyle,
                                focusedErrorBorder:
                                    InputBorderLib.focusErrorStyle,
                                filled: true,
                                fillColor: ColorLib.fieldWhite,
                                hintText: StringLib.tempratureHint,
                                hintStyle: TxtStyleLib.hintTxt,
                                errorStyle: TxtStyleLib.errorTxt,
                              ),
                              validator: (value) {
                                return controller.validateTemprature(value!);
                              },
                            ),
                            SizedBox(height: DimentionLib.h80),
                            InkWell(
                              child: BlueBtn(
                                txt: StringLib.predictSale,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: DimentionLib.w1345 / 2,
                    height: DimentionLib.h867,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/geoPattern.jpg"),
                        fit: BoxFit.cover,
                        opacity: 0.7,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(DimentionLib.r15),
                        bottomRight: Radius.circular(DimentionLib.r15),
                      ),
                    ),
                    child: Center(),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
