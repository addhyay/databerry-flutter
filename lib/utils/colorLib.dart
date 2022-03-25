import 'package:flutter/material.dart';

class ColorLib {
  //adjustment colors
  static final Color greySpace = Color(0xffb9b9b9);
  static final Color white = Color(0xffffffff);
  static final Color transp = Colors.transparent;
  static final Color purplebg = Color(0xff13113C);
  static final Color huePrimaryBlue = Color(0xff596dda);
  static final Color huePrimaryBlueDull = Color(0xff8b99e5);

  //ui colors
  static final Color primaryBlue = Color(0xff2f49d1);
  static final Color creamWhite = Color(0xffeaf1f5);
  static final Color fieldWhite = Color(0xffeff0f6);

  //font colors
  static final Color greyDull = Color(0xffc4c4c4).withOpacity(0.5);
  static final Color greyPale = Color(0xff767676);
  static final Color blackPale = Color(0xff19274B);
  static final Color hintColor = Color(0xffd6d7e3);
  static final Color errorColor = Color(0xffee6c4d);
  static final Color linkTxtColor = Color(0xff5887ff);
}

class MaterialColorLib {
  static final MaterialColor primaryBlueSwatch = MaterialColor(
    0xff2F49D1,
    <int, Color>{
      50: Color(0xFF97a4e8),
      100: Color(0xFF8292e3),
      200: Color(0xFF6d80df),
      300: Color(0xFF596dda),
      400: Color(0xFF445bd6),
      500: Color(0xff2F49D1),
      600: Color(0xFF2a42bc),
      700: Color(0xFF263aa7),
      800: Color(0xFF213392),
      900: Color(0xFF1c2c7d),
    },
  );
}
