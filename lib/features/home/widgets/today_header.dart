import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';

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
          Text(
              DateFormat.yMMMMd().format(DateTime.now()),
                style:TextStyles.titlestyle(fontSize: 20, color: AppColors.darkColor)
              ),
                Text('Today',
                   style:TextStyles.bodystyle(color: AppColors.darkColor,fontSize: 20)),
        ],
       ),
     ),
      MainButton(
        text: '+ Add Task',
        width: 140,
        height: 40,
        onPressed: () {
        pushTo(context, AddTaskScreen());
        },
      ),
    ],
    );
  }
}