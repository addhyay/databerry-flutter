import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';

class GlassMorphicContainer extends StatelessWidget {
  const GlassMorphicContainer({
    Key? key,
    required this.blur,
    required this.child,
    required this.opacity,
  }) : super(key: key);

  final double blur;
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DimentionLib.r15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: DimentionLib.w418,
          height: DimentionLib.w418,
          decoration: BoxDecoration(
            color: ColorLib.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(DimentionLib.r15),
            border: Border.all(
              width: 1.5,
              color: ColorLib.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
