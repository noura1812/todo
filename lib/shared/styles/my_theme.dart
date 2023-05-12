import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: lightColor,
          onPrimary: Colors.white,
          secondary: lightSecColor,
          onSecondary: Color(0xff383838),
          error: redColor,
          onError: Colors.white,
          background: lightBG,
          onBackground: Colors.white,
          surface: lightSecColor,
          onSurface: Color(0xff383838)),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        elevation: 10,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightSecColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: lightColor,
      ),
      scaffoldBackgroundColor: lightBG,
      primaryColor: lightColor,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.poppins(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          bodyLarge: GoogleFonts.poppins(
              color: const Color(0xff383838),
              fontSize: 18,
              fontWeight: FontWeight.bold),
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
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: lightColor,
          onPrimary: Colors.white,
          secondary: darkSecColor,
          onSecondary: Colors.white,
          error: redColor,
          onError: Colors.white,
          background: darkBG,
          onBackground: Colors.white,
          surface: darkSecColor,
          onSurface: Colors.white),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: darkSecColor,
        shape: CircularNotchedRectangle(),
        elevation: 10,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkSecColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: lightColor,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightColor,
      textTheme: TextTheme(
        titleMedium: GoogleFonts.poppins(
            color: darkBG, fontSize: 22, fontWeight: FontWeight.bold),
        bodyLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
