import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/models/userModel.dart';
import 'package:sales_cast/pages/dashboardScreen_v2.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class SignupPageController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      fNameController,
      lNameController;
  UserModel user = UserModel();

  var rememberme = false.obs;
  var isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void toggleCheckbox() {
    rememberme.update((remember) {
      remember = !rememberme.value;
      rememberme.value = remember;
    });
  }

  void toggleVisibility() {
    isVisible.update((visibility) {
      visibility = !isVisible.value;
      isVisible.value = visibility;
    });
  }

  String? validatefName(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    if (value.length < 2) return StringLib.invalidfName;
    return null;
  }

  String? validatelName(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    if (!GetUtils.isEmail(value)) return StringLib.invalidEmail;
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    if (value.length < 6) return StringLib.invalidPassword;
    return null;
  }

  void checkWithFirebaseSignup(BuildContext context) async {
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 1500),
      backgroundColor: ColorLib.huePrimaryBlue,
      content: Txt(
        text: StringLib.waitCreatingAcc,
        style: TxtStyleLib.snackBarTxt,
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    try {
      UserCredential newUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      CollectionReference userRef =
          FirebaseFirestore.instance.collection('user');
      userRef.doc(newUser.user!.uid).set({
        'first_name': fNameController.text.trim(),
        'last_name': lNameController.text.trim(),
        'email': emailController.text.trim(),
      });
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 2500),
        backgroundColor: ColorLib.huePrimaryBlue,
        content: Txt(
          text: StringLib.signupMsg + fNameController.text + "!",
          style: TxtStyleLib.snackBarTxt,
          textAlign: TextAlign.center,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DashboardPageV2(),
        ),
      );
    } on FirebaseAuthException catch (error) {
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
    return;
  }
}
