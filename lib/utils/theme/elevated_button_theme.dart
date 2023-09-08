import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        backgroundColor: tSecondaryColor,
        foregroundColor: tWhiteColor,
        side: const BorderSide(color: tSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        backgroundColor: tWhiteColor,
        foregroundColor: tSecondaryColor,
        side: const BorderSide(color: tWhiteColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      )
  );

}