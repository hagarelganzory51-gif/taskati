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
      this.maxLines=1, this.onTap,  this.readonly=false,
    
  });
  final String text;
  final Icon ?prfix;
  final Icon ?suffx;
  final TextEditingController controller;
  final bool readonly;
  final int ?maxLines;
  final Function()?onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readonly,
      maxLines:maxLines,
       onTap:onTap,

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
