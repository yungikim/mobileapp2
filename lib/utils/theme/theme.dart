
import 'package:flutter/material.dart';
import 'package:mobileapp/utils/theme/elevated_button_theme.dart';
import 'package:mobileapp/utils/theme/outline_button_theme.dart';
import 'package:mobileapp/utils/theme/text_theme.dart';

class TAppTheme{

  //const TAppTheme({Key? key, ThemeData? themeData});
  TAppTheme._();


  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.lightOutlineButtonTheme
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.darkOutlineButtonTheme
  );
}