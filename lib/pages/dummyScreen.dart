import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';
import 'package:sales_cast/utils/stringLib.dart';
import 'package:sales_cast/widgets/dropdown.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Center(
            child: Container(
          width: DimentionLib.w418,
          height: DimentionLib.w576,
          decoration: BoxDecoration(
            color: ColorLib.white,
            borderRadius: BorderRadius.circular(DimentionLib.r15),
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("At Dummy play ground"),
              SizedBox(height: DimentionLib.h46),
              CustomDropdown(
                dataItems: 3,
                datavalues: ['Tiny', 'Small', 'Large'],
                hintText: StringLib.storeTypeHint,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
