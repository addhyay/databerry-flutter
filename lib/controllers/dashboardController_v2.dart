import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sales_cast/models/ColumnChartModel.dart';
import 'package:sales_cast/models/areaChartModel.dart';
import 'package:sales_cast/models/lineChartModel.dart';
import 'package:sales_cast/pages/loginScreen.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/pathLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class DashboardControllerV2 extends GetxController {
  //observable variable
  RxInt selectedIndex = 0.obs;
  RxDouble totalPredictedSales = 0.0.obs;
  RxDouble totalActualSales = 0.0.obs;
  RxDouble totalSalesofStores = 0.0.obs;
  RxDouble previousMonthPredictedSales = 0.0.obs;
  RxDouble previousMonthActualSales = 0.0.obs;

  late ScrollController scrollController;

  //data lists
  List<LineChartModel> actualSales = [];
  List<LineChartModel> predictedSales = [];
  List<AreaChartModel> storeSales = [];
  List<ColumnChartData> yearlySales = [];

  List<double> valueList = [];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<String> years = ["2010", "2011", "2012"];

  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController();
    print("1");
    getActualSales();
    print("2");
    getPredictedSales();
    print("3");
    getStoreSales();
    print("4");
    getBarChartdata();
    print("5");
  }

  void updateSelection(int index) {
    selectedIndex.update((newSelection) {
      selectedIndex.value = index;
      print(selectedIndex.value);
    });
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

  Future getData(String? path) async {
    final String response = await rootBundle.loadString(
        path == null ? "assets/json/predicted_actual_sales.json" : path);
    return await json.decode(response);
  }

  Future getActualSales() async {
    final data = await getData(PathLib.predictiedVsActualSales2010);
    for (int i = 0; i < 12; i++) {
      double monthlySum = 0;
      for (int j = 0; j < 4; j++) {
        monthlySum = monthlySum + data[j + (4 * i)]["weeklySales"];
      }
      totalActualSales.value = totalActualSales.value + monthlySum;
      actualSales.add(LineChartModel(months[i], monthlySum));
    }
  }

  Future getPredictedSales() async {
    final data = await getData(PathLib.predictiedVsActualSales2010);
    for (int i = 0; i < 12; i++) {
      double monthlySum = 0;
      for (int j = 0; j < 4; j++) {
        monthlySum = monthlySum + data[j + (4 * i)]["predictedSales"];
      }
      totalPredictedSales.value = totalPredictedSales.value + monthlySum;
      predictedSales.add(LineChartModel(months[i], monthlySum));
    }
  }

  Future getStoreSales() async {
    final data = await getData(PathLib.salesPerStore);

    for (int i = 0; i < data.length; i++) {
      totalSalesofStores.value =
          totalSalesofStores.value + data[i]['Sales in million'];
      storeSales
          .add(AreaChartModel(data[i]["Store"], data[i]["Sales in million"]));
    }
  }

  Future getBarChartdata() async {
    final yr2010 = await getData(PathLib.predictiedVsActualSales2010);
    final yr2011 = await getData(PathLib.predictiedVsActualSales2011);
    final yr2012 = await getData(PathLib.predictiedVsActualSales2012);

    final data = [yr2010, yr2011, yr2012];
    print(yr2010[0]);
    print(yr2011[0]);
    print(yr2012[0]);

    for (int i = 0; i < data.length; i++) {
      double yearlySum = 0;
      for (int j = 0; j < yr2010.length; j++) {
        yearlySum = yearlySum + data[i][j]["weeklySales"];
      }
      valueList.add(yearlySum);
    }

    for (int i = 0; i < valueList.length; i++) {
      yearlySales.add(
        ColumnChartData(
          years[i],
          valueList[i],
          findMaxSale(valueList, years) == years[i]
              ? ColorLib.barGreen
              : ColorLib.creamWhite,
        ),
      );
    }
  }

  String findMaxSale(List<double> values, List<String> yearList) {
    double max = -1000000;
    for (int i = 0; i < values.length; i++) {
      if (max < values[i]) max = values[i];
    }
    return yearList[values.indexOf(max)];
  }
}
