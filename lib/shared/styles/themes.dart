import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    titleTextStyle: const TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    color: defaultDarkColor,
    actionsIconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: defaultDarkColor,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: defaultColor,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: defaultDarkColor,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: defaultDarkColor,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
  fontFamily: 'Janna',
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    )
  ),

);
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: defaultColor,
    brightness: Brightness.light,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
    type: BottomNavigationBarType.fixed,
  ),
  fontFamily: 'Janna',
  textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
  ),

);
