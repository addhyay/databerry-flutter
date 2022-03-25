// ignore_for_file: duplicate_ignore
// ignore_for_file: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sales_cast/controllers/loginController.dart';
import 'package:sales_cast/pages/dummyScreen.dart';
import 'package:sales_cast/pages/loginScreen.dart';
import 'package:sales_cast/pages/dashboardScreen.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/widgets/circularLoading.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(SalesCast());
}

class SalesCast extends StatelessWidget {
  SalesCast({Key? key}) : super(key: key);
  final controller = Get.put(LoginPageController());
  // final store = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1150),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: MaterialColorLib.primaryBlueSwatch,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) return DashboardPage();
            if (snapshot.connectionState == ConnectionState.waiting)
              return CircularLoading();
            else
              return LoginPage();
          },
        ),

        // home: DashboardPage(),
        // home: DummyPage(),
      ),
    );
  }
}
