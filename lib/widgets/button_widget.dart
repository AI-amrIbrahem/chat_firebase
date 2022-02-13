import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

Widget getButton({required onPressedFun,required text,color = Colors.white,fontSize = 20.0,width = double.infinity}){
  return Container(
    color: AppColors.primary,
    height: 50,
    width: width,
    child: ElevatedButton(onPressed: onPressedFun, child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize
      ),
    ), style: ElevatedButton.styleFrom(primary: AppColors.primary)
    ),
  );
}

Widget getTextButton({required onPressedFun,required String text}){
  return TextButton(onPressed: onPressedFun, child: Text(text.toUpperCase()));
}