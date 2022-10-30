import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veg_kitchen/theme/colors.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors().transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.pacifico(),
      actionsIconTheme: IconThemeData(color: Colors.grey),
      iconTheme: IconThemeData(color: Colors.grey[600]),
    ),
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
