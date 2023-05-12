import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20,
        backgroundColor: lightSecColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: lightColor,
      ),
      scaffoldBackgroundColor: lightBG,
      primaryColor: lightColor,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.poppins(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.poppins(
              color: lightColor, fontSize: 18, fontWeight: FontWeight.w600),
          bodySmall: GoogleFonts.poppins(
            color: const Color(0xff383838),
            fontSize: 15,
          )),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: lightSecColor,
          size: 30,
        ),
        backgroundColor: lightColor,
        elevation: 0,
      ));
  static ThemeData darkTheme = ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20,
        backgroundColor: darkSecColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: lightColor,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightColor,
      textTheme: TextTheme(
        titleMedium: GoogleFonts.poppins(
            color: darkBG, fontSize: 22, fontWeight: FontWeight.bold),
        bodyMedium: GoogleFonts.poppins(
            color: lightColor, fontSize: 18, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.poppins(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: darkSecColor,
          size: 30,
        ),
        backgroundColor: lightColor,
        elevation: 0,
      ));
}
