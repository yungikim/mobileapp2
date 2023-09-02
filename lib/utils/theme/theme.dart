
import 'package:flutter/material.dart';
import 'package:mobileapp/utils/theme/text_theme.dart';

class TAppTheme{

  const TAppTheme({Key? key, ThemeData? themeData});


  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme:
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme:
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );
}