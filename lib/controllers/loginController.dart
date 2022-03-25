import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/pages/dashboardScreen.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class LoginPageController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String email = "", password = "";

  var rememberme = false.obs;
  var isVisible = false.obs;

  // final store = new FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
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

  void checkWithFirebaseLogin(BuildContext context) async {
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 2500),
      backgroundColor: ColorLib.huePrimaryBlue,
      content: Txt(
        text: StringLib.checkCredentials,
        style: TxtStyleLib.snackBarTxt,
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    UserCredential currentUser;
    try {
      currentUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUser.user!.uid)
          .get()
          .then((snap) {
        if (snap.exists) {
          final snackBar = SnackBar(
            duration: Duration(milliseconds: 2500),
            backgroundColor: ColorLib.huePrimaryBlue,
            content: Txt(
              text: StringLib.loginMsg + snap.get("first_name"),
              style: TxtStyleLib.snackBarTxt,
              textAlign: TextAlign.center,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          // store.write(key: 'rem', value: "rememberme.value");

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DashboardPage(),
            ),
          );
        }
      });
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
  }
}
