import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.purplebg,
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              SizedBox(width: DimentionLib.w157),
              Image.asset(
                'assets/img/connection_lost.png',
                fit: BoxFit.fill,
              ),
              SizedBox(width: DimentionLib.w60),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    text: StringLib.pageNotFound,
                    style: TxtStyleLib.headerTxtDark,
                  ),
                  SizedBox(height: DimentionLib.h20),
                  Txt(
                    text: StringLib.subStr404,
                    style: TxtStyleLib.subheaderTxtDark,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
