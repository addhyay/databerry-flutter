import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> restPassFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  String email = '';

  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  void updateCount(){
    count.update((counter) { 
      counter = count.value + 1;
      count.value = counter;
    });
  }

  String? validateEmail(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    if (!GetUtils.isEmail(value)) return StringLib.invalidEmail;
    return null;
  }

  void resetPasswordWithFirebase(BuildContext context) async {
    bool isValid = restPassFormKey.currentState!.validate();
    if (!isValid) return;
    try{
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
      final snackBar = SnackBar(
      duration: Duration(milliseconds: 2500),
      backgroundColor: ColorLib.huePrimaryBlue,
      content: Txt(
        text: StringLib.linkSent,
        style: TxtStyleLib.snackBarTxt,
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (error){
      final snackBar = SnackBar(
      duration: Duration(milliseconds: 2500),
      backgroundColor: ColorLib.huePrimaryBlue,
      content: Txt(
        text: error.message!,
        style: TxtStyleLib.snackBarTxt,
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
