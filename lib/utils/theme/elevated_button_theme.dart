import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tSecondaryColor,
        side: BorderSide(color: tSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight),
      )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        backgroundColor: tWhiteColor,
        foregroundColor: tSecondaryColor,
        side: BorderSide(color: tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight),
      )
  );

}