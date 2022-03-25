import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/signupController.dart';
import 'package:sales_cast/pages/loginScreen.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/inputBorderLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/primerBlueBtn.dart';
import 'package:sales_cast/widgets/txt.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final controller = Get.put(SignupPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // SizedBox(height: DimentionLib.h34),
              Container(
                width: DimentionLib.w157,
                height: DimentionLib.h223,
                child: Image.asset(
                  "assets/img/databerry.png",
                  fit: BoxFit.contain,
                ),
              ),
              // SizedBox(height: DimentionLib.h15),
              Txt(
                text: StringLib.signupHeader,
                style: TxtStyleLib.headerTxt,
              ),
              SizedBox(height: DimentionLib.h11),
              Txt(
                text: StringLib.signupSubheader,
                style: TxtStyleLib.subheaderTxt,
              ),
              SizedBox(height: DimentionLib.h20),
              Container(
                width: DimentionLib.w418,
                height: DimentionLib.w576,
                decoration: BoxDecoration(
                  color: ColorLib.white,
                  borderRadius: BorderRadius.circular(DimentionLib.r15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Form(
                  key: controller.signupFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* First Name ↓
                        Txt(
                          text: StringLib.fNameHeader,
                          style: TxtStyleLib.bodyTxt,
                        ),
                        SizedBox(height: DimentionLib.h15),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.fNameController,
                          decoration: InputDecoration(
                            enabledBorder: InputBorderLib.enableStyle,
                            focusedBorder: InputBorderLib.focusStyle,
                            errorBorder: InputBorderLib.errorStyle,
                            focusedErrorBorder: InputBorderLib.focusErrorStyle,
                            filled: true,
                            fillColor: ColorLib.fieldWhite,
                            hintText: StringLib.fNameHint,
                            hintStyle: TxtStyleLib.hintTxt,
                            errorStyle: TxtStyleLib.errorTxt,
                          ),
                          onSaved: (value) {
                            controller.user.fName = value!.trim();
                          },
                          validator: (value) {
                            return controller.validatefName(value!);
                          },
                        ),
                        SizedBox(height: DimentionLib.h20),
                        //* Last Name ↓
                        Txt(
                          text: StringLib.lNameHeader,
                          style: TxtStyleLib.bodyTxt,
                        ),
                        SizedBox(height: DimentionLib.h15),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.lNameController,
                          decoration: InputDecoration(
                            enabledBorder: InputBorderLib.enableStyle,
                            focusedBorder: InputBorderLib.focusStyle,
                            errorBorder: InputBorderLib.errorStyle,
                            focusedErrorBorder: InputBorderLib.focusErrorStyle,
                            filled: true,
                            fillColor: ColorLib.fieldWhite,
                            hintText: StringLib.lNameHint,
                            hintStyle: TxtStyleLib.hintTxt,
                            errorStyle: TxtStyleLib.errorTxt,
                          ),
                          onSaved: (value) {
                            controller.user.lName = value!.trim();
                          },
                          validator: (value) {
                            return controller.validatelName(value!);
                          },
                        ),
                        SizedBox(height: DimentionLib.h20),
                        //* Email ↓
                        Txt(
                          text: StringLib.emailHeader,
                          style: TxtStyleLib.bodyTxt,
                        ),
                        SizedBox(height: DimentionLib.h15),
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
                            controller.user.email = value!.trim();
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: DimentionLib.h20),
                        //* Password ↓
                        Txt(
                          text: StringLib.passwordHeader,
                          style: TxtStyleLib.bodyTxt,
                        ),
                        SizedBox(height: DimentionLib.h15),
                        Obx(() {
                          return TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.passwordController,
                            obscureText: !controller.isVisible.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.toggleVisibility();
                                },
                                icon: !controller.isVisible.value
                                    ? Icon(
                                        Icons.visibility_off_rounded,
                                        color: ColorLib.huePrimaryBlue,
                                      )
                                    : Icon(
                                        Icons.visibility_rounded,
                                        color: ColorLib.huePrimaryBlue,
                                      ),
                              ),
                              enabledBorder: InputBorderLib.enableStyle,
                              focusedBorder: InputBorderLib.focusStyle,
                              errorBorder: InputBorderLib.errorStyle,
                              focusedErrorBorder:
                                  InputBorderLib.focusErrorStyle,
                              filled: true,
                              fillColor: ColorLib.fieldWhite,
                              hintText: StringLib.passwordHint,
                              hintStyle: TxtStyleLib.hintTxt,
                              errorStyle: TxtStyleLib.errorTxt,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (value) {
                              controller.user.password = value!.trim();
                            },
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                          );
                        }),
                        SizedBox(height: DimentionLib.h20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  (() {
                                    return Checkbox(
                                      hoverColor: ColorLib.transp,
                                      focusColor: ColorLib.transp,
                                      fillColor: MaterialStateProperty.all(
                                          ColorLib.huePrimaryBlue),
                                      splashRadius: 0,
                                      value: controller.rememberme.value,
                                      onChanged: (val) {
                                        controller.toggleCheckbox();
                                      },
                                    );
                                  }),
                                ),
                                Txt(
                                  text: StringLib.rememberme,
                                  style: TxtStyleLib.subheaderTxt2,
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Txt(
                                text: StringLib.gotologin,
                                style: TxtStyleLib.subheaderTxt2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: DimentionLib.h20),
                        InkWell(
                          onTap: (() =>
                              controller.checkWithFirebaseSignup(context)),
                          child: BlueBtn(
                            txt: StringLib.signup,
                          ),
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
    );
  }
}
