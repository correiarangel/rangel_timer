import 'package:flutter/material.dart';

import 'app_color.dart';

class AppThemaDracula {
  static ThemeData get theme => ThemeData(
      primaryColorDark: AppColor.colorSkyMagenta,
      primaryColorLight: AppColor.colorSkyMagenta,
      primaryColor: AppColor.colorSkyMagenta,
      iconTheme: IconThemeData(
        color: AppColor.colorSkyMagenta,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.colorSpaceCadet,
        titleTextStyle: TextStyle(
          color: AppColor.colorSkyMagenta,
          fontSize: 18.0,
        ),
        centerTitle: false,
        actionsIconTheme: IconThemeData(
          color: AppColor.colorLavenderFloral,
        ),
        iconTheme: IconThemeData(
          color: AppColor.colorLavenderFloral,
        ),
      ),
      scaffoldBackgroundColor: AppColor.colorSpaceCadet,
      textTheme: TextTheme(
        headlineLarge:TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColor.colorLavenderFloral,
        ), 
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColor.colorLavenderFloral,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.colorLavenderFloral,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.colorLavenderFloral,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.colorLavenderFloral,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColor.colorLavenderFloral,
        ),
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColor.colorLavenderFloral,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColor.colorLavenderFloral,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.colorLavenderFloral,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: AppColor.colorLavenderFloral,
        color: AppColor.colorSkyMagenta,
      ),
      listTileTheme: ListTileThemeData(
        textColor: AppColor.colorLavenderFloral,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            AppColor.colorSkyMagenta,
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          elevation: MaterialStateProperty.all(8.0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.fromLTRB(16, 8, 16, 8),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: AppColor.colorLavenderFloral,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: AppColor.colorSkyMagenta,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.colorSpaceCadet);
}
