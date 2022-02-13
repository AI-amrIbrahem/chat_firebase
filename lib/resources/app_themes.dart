import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_values.dart';

ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 10,
    selectedItemColor: AppColors.primary,
    backgroundColor: AppColors.white,
  ),

  scaffoldBackgroundColor:  AppColors.background,
  backgroundColor: AppColors.background,
textTheme: const TextTheme(
  headline1: TextStyle(
    fontSize: 26,
    color: AppColors.titleColor,
    fontWeight: FontWeight.bold,
  ),
  bodyText1: TextStyle(
    fontSize: 18,
    color: AppColors.subTitleColor,
  ),
  bodyText2: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  ),
  subtitle1: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1
  ),
),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppValues.padingInputText),
      hintStyle: TextStyle(
        fontSize: 16,
        color: AppColors.grey,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        color: AppColors.darkGrey,
      ),
      errorStyle: TextStyle(
        fontSize: 16,
        color: AppColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:AppColors.grey,
          width: AppValues.borderOfInput,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:AppColors.primary,
          width: AppValues.borderOfInput,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:AppColors.error,
          width: AppValues.borderOfInput,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:AppColors.primary,
          width: AppValues.borderOfInput,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
      ),
    ),
  buttonTheme: const ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: AppColors.grey,
    buttonColor: AppColors.primary,
    splashColor: AppColors.primaryOpicty70,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle:  const TextStyle(
            fontSize: 18,
            color: AppColors.primary,
          ),
          primary: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppValues.borderRadiousButton))
      )
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
      iconTheme: IconThemeData(
          color: AppColors.primary
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.background,
      )
  ),
);


ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 10,
    selectedItemColor: AppColors.primary,
    backgroundColor: AppColors.darkPrimary,
  ),

  scaffoldBackgroundColor:  AppColors.darkPrimary,
  backgroundColor: AppColors.background,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 26,
      color: AppColors.titleColor,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      color: AppColors.subTitleColor,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        height: 1
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(AppValues.padingInputText),
    hintStyle: TextStyle(
      fontSize: 16,
      color: AppColors.grey,
    ),
    labelStyle: TextStyle(
      fontSize: 16,
      color: AppColors.darkGrey,
    ),
    errorStyle: TextStyle(
      fontSize: 16,
      color: AppColors.grey,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:AppColors.grey,
        width: AppValues.borderOfInput,
      ),
      borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:AppColors.darkPrimary,
        width: AppValues.borderOfInput,
      ),
      borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:AppColors.error,
        width: AppValues.borderOfInput,
      ),
      borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:AppColors.darkPrimary,
        width: AppValues.borderOfInput,
      ),
      borderRadius: BorderRadius.all(Radius.circular(AppValues.borderRadiousInput)),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: AppColors.grey,
    buttonColor: AppColors.darkPrimary,
    splashColor: AppColors.primaryOpicty70,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle:  const TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
          primary: AppColors.darkPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppValues.borderRadiousButton))
      )
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
      iconTheme: IconThemeData(
          color: AppColors.primary
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.darkPrimary,
      )
  ),
);