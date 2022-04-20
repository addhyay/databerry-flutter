import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/txtstyleLib.dart';
import 'package:sales_cast/widgets/txt.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DimentionLib.w576,
      height: DimentionLib.h375,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimentionLib.r15),
          color: ColorLib.white),
      padding: EdgeInsets.all(DimentionLib.w20),
      child: Center(
        child: Row(
          children: [
            Container(
              width: DimentionLib.h175,
              height: DimentionLib.h175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimentionLib.r500),
                color: ColorLib.creamWhite,
              ),
            ),
            SizedBox(width: DimentionLib.w20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Txt(text: "Harish Chavan", style: TxtStyleLib.header2Txt),
                SizedBox(height: DimentionLib.h20),
                Container(
                  width: DimentionLib.w253,
                  height: DimentionLib.h175,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Txt(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut odio blandit, porta nunc eu, luctus enim. Ut aliquam sapien sit amet nunc sagittis, vel ultrices felis facilisis. Maecenas in varius justo. In eget purus a purus porttitor cursus. Sed laoreet, justo eget vehicula rutrum, nibh orci posuere tortor, a euismod enim leo accumsan massa.",
                          style: TxtStyleLib.subheaderTxt,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
