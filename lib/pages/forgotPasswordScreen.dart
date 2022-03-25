import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/forgotPassController.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/inputBorderLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/primerBlueBtn.dart';
import 'package:sales_cast/widgets/txt.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: DimentionLib.h34),
              Container(
                width: DimentionLib.w157,
                height: DimentionLib.h223,
                child: Image.asset(
                  "assets/img/databerry.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: DimentionLib.h15),
              Txt(
                text: StringLib.forgotpassHeader,
                style: TxtStyleLib.headerTxt,
              ),
              SizedBox(height: DimentionLib.h11),
              Txt(
                text: StringLib.forgotpassSubheader,
                style: TxtStyleLib.subheaderTxt,
              ),
              SizedBox(height: DimentionLib.h20),
              Container(
                width: DimentionLib.w418,
                height: DimentionLib.w236,
                decoration: BoxDecoration(
                  color: ColorLib.white,
                  borderRadius: BorderRadius.circular(DimentionLib.r15),
                ),
                padding: EdgeInsets.all(40),
                child: Form(
                  key: controller.restPassFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                          text: StringLib.emailHeader,
                          style: TxtStyleLib.bodyTxt,
                        ),
                        SizedBox(height: DimentionLib.h20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            enabledBorder: InputBorderLib.enableStyle,
                            focusedBorder: InputBorderLib.focusStyle,
                            errorBorder: InputBorderLib.errorStyle,
                            focusedErrorBorder: InputBorderLib.focusErrorStyle,
                            filled: true,
                            fillColor: ColorLib.fieldWhite,
                            hintText: StringLib.emailHint,
                            hintStyle: TxtStyleLib.hintTxt,
                            errorStyle: TxtStyleLib.errorTxt,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            controller.email = value!.trim();
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: DimentionLib.h50),
                        Obx(() {
                          return InkWell(
                            onTap: () {
                              controller.resetPasswordWithFirebase(context);
                              controller.updateCount();
                            },
                            child: BlueBtn(
                              txt: controller.count.value == 0
                                  ? StringLib.sendmail
                                  : StringLib.resendmail,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
