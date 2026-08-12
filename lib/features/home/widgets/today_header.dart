import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/contants/image_app.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     Expanded(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Text(DateTime.now().toString().substring(0,10),
                style:TextStyles.titlestyle(fontSize: 20)
              ),
                Text('Today',
                   style:TextStyles.bodystyle(color: AppColors.darkColor,fontSize: 20)),
        ],
       ),
     ),
      CircleAvatar(radius: 30,
              backgroundColor: AppColors.primaryColor,
              backgroundImage:LocalHelper.getData(LocalHelper.kImage) != null
              ?FileImage(File(LocalHelper.getData(LocalHelper.kImage))):
               AssetImage(ImageApp.user),
              ),
    ],
    );
  }
}