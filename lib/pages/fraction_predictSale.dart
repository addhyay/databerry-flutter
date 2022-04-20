import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/predictSaleFractionController.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/inputBorderLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/circularLoading.dart';
import 'package:sales_cast/widgets/glassMorphicContainer.dart';
import 'package:sales_cast/widgets/primerBlueBtn.dart';
import 'package:sales_cast/widgets/radioButtons.dart';
import 'package:sales_cast/widgets/txt.dart';

class PredictSaleFraction extends StatelessWidget {
  PredictSaleFraction({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;
  final controller = Get.put(PredictSaleFractionController());

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
                  text: StringLib.predictSaleTxt,
                  style: TxtStyleLib.header2Txt,
                ),
                SizedBox(height: DimentionLib.h34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: DimentionLib.w1345 / 2.35,
                      height: DimentionLib.h867,
                      decoration: BoxDecoration(
                        color: ColorLib.white,
                        borderRadius: BorderRadius.circular(DimentionLib.r15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: DimentionLib.w20,
                        horizontal: ((DimentionLib.w1345 / 2.2) - 600) / 2,
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.predictFormKey,
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
                                            topRight: Radius.circular(
                                                DimentionLib.r15),
                                            bottomRight: Radius.circular(
                                                DimentionLib.r15),
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
                                onTap: () =>
                                    controller.checkAndPredict(context),
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
                      width: DimentionLib.w1345 / 2.35,
                      height: DimentionLib.h867,
                      decoration: BoxDecoration(
                        color: ColorLib.white,
                        image: DecorationImage(
                          image: AssetImage("assets/img/geoPattern.jpg"),
                          fit: BoxFit.cover,
                          opacity: 0.7,
                        ),
                        borderRadius: BorderRadius.circular(DimentionLib.r15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: DimentionLib.w20,
                        horizontal: ((DimentionLib.w1345 / 2.2) - 600) / 2,
                      ),
                      child: Center(
                        child: GlassMorphicContainer(
                          blur: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Txt(
                                text: "Predicted Sale",
                                style: TxtStyleLib.header2Txt,
                              ),
                              SizedBox(height: DimentionLib.h65),
                              Obx(
                                () => !controller.isClicked.value
                                    ? Container(
                                        width: DimentionLib.w236,
                                        child: Txt(
                                          text: StringLib.predictSaleScreenTxt,
                                          style: TxtStyleLib.bodyTxt,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : FutureBuilder(
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData)
                                            return Txt(
                                              text: "text",
                                              style: TxtStyleLib.degreeTxt,
                                            );
                                          else
                                            return CircularLoading(
                                              storkeWidth: 4.25,
                                            );
                                        },
                                      ),
                              )
                            ],
                          ),
                          opacity: 0.3,
                        ),
                      ),
                    )
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
