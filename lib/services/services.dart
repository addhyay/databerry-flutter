import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sales_cast/widgets/txt.dart';

import '../utils/colorLib.dart';
import '../utils/txtstyleLib.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


fetchData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  var responseData = json.decode(response.body);
  print(responseData);
  return responseData;
}

Future<dynamic> predictSales(String url, final formData, BuildContext context) async {
  try {
    var response = await Dio().post(url,data:formData);
    print(response);

    return response;
  } catch (e) {
    final snackBar = SnackBar(
        duration: Duration(milliseconds: 2500),
        backgroundColor: ColorLib.huePrimaryBlue,
        content: Txt(
          text: e.toString(),
          style: TxtStyleLib.snackBarTxt,
          textAlign: TextAlign.center,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}