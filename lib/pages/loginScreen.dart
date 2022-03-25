import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/loginController.dart';
import 'package:sales_cast/pages/forgotPasswordScreen.dart';
import 'package:sales_cast/pages/signupScreen.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/inputBorderLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/primerBlueBtn.dart';
import 'package:sales_cast/widgets/txt.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final controller = Get.put(LoginPageController());

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
                text: StringLib.loginHeader,
                style: TxtStyleLib.headerTxt,
              ),
              SizedBox(height: DimentionLib.h11),
              Txt(
                text: StringLib.loginSubheader,
                style: TxtStyleLib.subheaderTxt,
              ),
              SizedBox(height: DimentionLib.h20),
              Container(
                width: DimentionLib.w418,
                height: DimentionLib.w408,
                decoration: BoxDecoration(
                  color: ColorLib.white,
                  borderRadius: BorderRadius.circular(DimentionLib.r15),
                ),
                padding: EdgeInsets.all(40),
                child: Form(
                  key: controller.loginFormKey,
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
                        Txt(
                          text: StringLib.passwordHeader,
                          style: TxtStyleLib.bodyTxt,
                        ),
                        SizedBox(height: DimentionLib.h20),
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
                              controller.password = value!.trim();
                            },
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                          );
                        }),
                        SizedBox(height: DimentionLib.h20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Txt(
                            text: StringLib.forgotpass,
                            style: TxtStyleLib.linkTxt,
                          ),
                        ),
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
                                    builder: (context) => SignupPage(),
                                  ),
                                );
                              },
                              child: Txt(
                                text: StringLib.gotosignup,
                                style: TxtStyleLib.subheaderTxt2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: DimentionLib.h20),
                        InkWell(
                          onTap: () =>
                              controller.checkWithFirebaseLogin(context),
                          child: BlueBtn(
                            txt: StringLib.signin,
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
