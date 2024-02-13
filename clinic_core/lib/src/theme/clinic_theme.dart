import 'package:flutter/material.dart';

final class ClinicTheme {
  static const orange = Color(0xFFFFAE45);
  static const lightOrange = Color(0xFFFFEFE9);
  static const blue = Color(0xFF01BdD6);
  static const lightGray = Color(0xFFFFEFE9);

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: lightOrange),
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: lightOrange),
    useMaterial3: true,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: lightOrange,
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightOrange,
        labelStyle: const TextStyle(
            fontSize: 14, color: orange, fontWeight: FontWeight.w700),
        floatingLabelStyle: const TextStyle(
          color: blue,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );

  static const titleStyle = TextStyle(
    color: blue,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );
  static const titleSmallStyle = TextStyle(
    color: blue,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );
  static const subTitleStyle = TextStyle(
    color: blue,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
