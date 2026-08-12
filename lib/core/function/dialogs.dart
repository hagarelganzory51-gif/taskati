import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

showErrorDialog(BuildContext context, String message) {
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           backgroundColor: AppColors.primaryColor,
            margin: EdgeInsets.all(10),
              behavior: SnackBarBehavior.floating,
             content: Text(message))
  );
}