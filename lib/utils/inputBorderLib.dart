import 'package:flutter/material.dart';
import 'package:sales_cast/utils/colorLib.dart';
import 'package:sales_cast/utils/dimentionLib.dart';

class InputBorderLib {
  static final InputBorder enableStyle = OutlineInputBorder(
    borderSide: BorderSide(color: ColorLib.transp),
    borderRadius: BorderRadius.circular(DimentionLib.r10),
  );

  static final InputBorder focusStyle = OutlineInputBorder(
    borderSide: BorderSide(color: ColorLib.huePrimaryBlue, width: 2),
    borderRadius: BorderRadius.circular(DimentionLib.r10),
  );

  static final InputBorder errorStyle = OutlineInputBorder(
    borderSide: BorderSide(color: ColorLib.errorColor, width: 2),
    borderRadius: BorderRadius.circular(DimentionLib.r10),
  );

  static final InputBorder focusErrorStyle = OutlineInputBorder(
    borderSide: BorderSide(color: ColorLib.errorColor, width: 2),
    borderRadius: BorderRadius.circular(DimentionLib.r10),
  );
}
