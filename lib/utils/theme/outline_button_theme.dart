import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobileapp/constants/colors.dart';
import 'package:mobileapp/constants/sizes.dart';

class TOutLinedButtonTheme{
  TOutLinedButtonTheme._();  //To avoid creating instances

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    )
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      backgroundColor: tSecondaryColor,
      foregroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    )
  );
}