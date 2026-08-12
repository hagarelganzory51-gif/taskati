import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key, required this.text, required this.width, required this.height, required this.onPressed,
  });
  final String text ;
  final double width ;
  final double height ;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height:height ,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        onPressed: onPressed,
         child: Text(text,
          style: TextStyles.bodystyle(
            color: Colors.white,
            
          )
          )),
    );
  }
}