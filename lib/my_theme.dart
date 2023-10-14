import 'package:flutter/material.dart';

class MyTheme {
  static Color PrimaryLight = Color(0xffB7935F);
  static Color PrimaryDark = Color(0xff141A2E);
  static Color blackcolor = Color(0xff242424);
  static Color whitecolor = Color(0xffffffff);
  static Color yellowcolor = Color(0xffFACC1D);

  static ThemeData LightMode = ThemeData(
      primaryColor: PrimaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackcolor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackcolor,
        unselectedItemColor: whitecolor,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ));

  static ThemeData darkMode = ThemeData(
      primaryColor: PrimaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: whitecolor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowcolor,
        unselectedItemColor: whitecolor,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: whitecolor),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: whitecolor),
        titleSmall: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: yellowcolor),
      ));
}
