import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary color
    primaryColor: primary,

    // AppBar Theme
    appBarTheme: const AppBarTheme(color: primary),

    //TextButton Theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary)),

    //FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary, foregroundColor: primary),

    //Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo, shape: const StadiumBorder()),
    ),

    //Icons
    iconTheme: const IconThemeData(color: primary),

    //Inputs
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: primary,
      suffixIconColor: primary,
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Primary color
    primaryColor: primary,

    // AppBar Theme
    appBarTheme: const AppBarTheme(color: primary),
    // scaffoldBackgroundColor: Colors.cyan.shade900
  );
}
