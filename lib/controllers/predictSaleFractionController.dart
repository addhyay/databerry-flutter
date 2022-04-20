import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_cast/pages/loginScreen.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class PredictSaleFractionController extends GetxController {
  final GlobalKey<FormState> predictFormKey = GlobalKey<FormState>();
  late TextEditingController storeController,
      departmentController,
      tempratureController;

  RxBool tempUnit = false.obs;
  RxBool isClicked = false.obs;
  RxDouble temp = 0.0.obs;
  String storeTypeTxt = "A", holidayTxt = "TRUE";

  @override
  void onInit() {
    super.onInit();
    storeController = TextEditingController();
    departmentController = TextEditingController();
    tempratureController = TextEditingController();
  }

  void toggleTempUnit() {
    tempUnit.update((tempUni) {
      tempUni = !tempUnit.value;
      tempUnit.value = tempUni;
    });
  }

  String? validateStore(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    if (!value.isNumericOnly) return StringLib.invalidStore;
    return null;
  }

  String? validateDepartment(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    if (!value.isNumericOnly) return StringLib.invalidDepartment;
    return null;
  }

  String? validateTemprature(String value) {
    if (value.isEmpty) return StringLib.emptyFieldError;
    return null;
  }

  void tempUnitInverter() {
    if (tempratureController.text != "")
      temp.value = double.parse(tempratureController.text);
    else
      temp.value = 0;

    if (temp.value != 0) {
      if (!tempUnit.value)
        temp.update((farenheit) {
          temp.value =
              double.parse((((farenheit! - 32) * 5) / 9).toStringAsFixed(2));
          tempratureController.text = temp.value.toString();
        });
      else
        temp.update((celcius) {
          temp.value =
              double.parse((((celcius! * 9) / 5) + 32).toStringAsFixed(2));
          tempratureController.text = temp.value.toString();
        });
    }
    print("Temp is in " +
        (tempUnit.value ? "F" : "C") +
        " and value is ${temp.value} :: ${tempratureController.text}");
  }

  void checkWithFirebaseLogout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 2500),
      backgroundColor: ColorLib.huePrimaryBlue,
      content: Txt(
        text: StringLib.signedout,
        style: TxtStyleLib.snackBarTxt,
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
    );
  }

  void checkAndPredict(BuildContext context) {
    bool isValid = predictFormKey.currentState!.validate();
    if (!isValid) return;
    isClicked.value = true;
    //* Do something about sending info to json and so on
  }
}