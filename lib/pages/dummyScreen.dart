import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/widgets/aboutUsCard.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.creamWhite,
      body: SafeArea(
        child: Container(
          child: Center(
            child: AboutUsCard(),
          ),
        ),
      ),
    );
  }
}
