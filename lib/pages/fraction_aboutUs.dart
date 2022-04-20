import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class AboutUsFraction extends StatelessWidget {
  AboutUsFraction({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Container(
          width: DimentionLib.w1204,
          height: DimentionLib.h1030,
          padding: EdgeInsets.symmetric(
            horizontal: DimentionLib.w20,
            vertical: DimentionLib.h34,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt(
                  text: StringLib.aboutUsTxt,
                  style: TxtStyleLib.header2Txt,
                ),
                SizedBox(height: DimentionLib.h34),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
