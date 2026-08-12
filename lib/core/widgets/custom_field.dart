import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.text,
    this.prfix,
    this.suffx, 
    required this.controller,
  });
  final String text;
  final Icon ?prfix;
  final Icon ?suffx;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: text,
        hintStyle:TextStyles.bodystyle(
            color: AppColors.darkColor,
            fontSize: 14
          ),
       prefixIcon:prfix ,
       suffixIcon:suffx ,
      ),
    );
  }
}
