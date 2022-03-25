import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  Txt({
    Key? key,
    required this.text,
    required this.style,
    this.textAlign: TextAlign.start,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
    );
  }
}
