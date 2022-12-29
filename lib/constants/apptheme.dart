import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysampleapp/constants/appcolor.dart';


class AppTheme {

  //
  ThemeData lightTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.akayaKanadaka().fontFamily,
      accentColor: AppColor.accentColor,
      primaryColor: AppColor.primaryColor,
      primaryColorDark: AppColor.primaryColorDark,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: AppColor.cursorColor,
      ),
      backgroundColor: Colors.white,
      cardColor: Colors.grey[50],
      textTheme: const TextTheme(
        headline3: TextStyle(
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      // CUSTOMIZE showDatePicker Colors
      dialogBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      highlightColor: Colors.grey[400],
    );
  }

  //
  ThemeData darkTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.akayaKanadaka().fontFamily,
      brightness: Brightness.dark,
      accentColor: AppColor.accentColor,
      primaryColor: AppColor.primaryColorDark,
      primaryColorDark: AppColor.primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: AppColor.cursorColor,
      ),
      backgroundColor: Colors.grey[850],
      cardColor: Colors.grey[700],
      textTheme: const TextTheme(
        headline3: TextStyle(
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
      ),
    );
  }
}
