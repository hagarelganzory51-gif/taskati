import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class TextStyles {
  static TextStyle titlestyle ({Color? color, double? fontSize, FontWeight? fontWeight}){
    return TextStyle(
      fontSize: fontSize ?? 18.0,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? AppColors.primaryColor,
    );
  }
  static TextStyle bodystyle ({Color? color, double? fontSize, FontWeight? fontWeight}){
    return TextStyle(
      fontSize: fontSize ?? 16.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.primaryColor,
    );
  }
  static TextStyle smallstyle ({Color? color, double? fontSize, FontWeight? fontWeight}){
    return TextStyle(
      fontSize: fontSize ?? 14.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.primaryColor,
    );
  }
}