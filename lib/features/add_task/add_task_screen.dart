import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  var startDateController = TextEditingController(text: DateFormat('hh:mm.a').format(DateTime.now()));
  var endDateController = TextEditingController(text: DateFormat('hh:mm.a').format(DateTime.now()));
  List<Color> colors = 
  [AppColors.primaryColor,
   AppColors.pinkColor,
    AppColors.orangeColor];
    
    var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Add Task',
        style: TextStyles.titlestyle(fontSize: 20,color:  AppColors.primaryColor),
        ),
      ),
     body:Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text('title',
          style: TextStyles.titlestyle(fontSize: 15,color:  AppColors.darkColor),
          ),
          Gap(5),
          CustomField(
            text: 'Task Title',
            controller: titleController,
          ),
          Gap(10),
          Text('description',
          style: TextStyles.titlestyle(fontSize: 15,color:  AppColors.darkColor),
          ),
          Gap(5),
          CustomField(
            text: 'Task Description',
            maxLines: 3,
            controller: descriptionController,
          ),

          Gap(10),
           Text('Date',
          style: TextStyles.titlestyle(fontSize: 15,color:  AppColors.darkColor),
          ),
          Gap(5),
          CustomField(
            onTap:() async {
            var selectedDate =await  showDatePicker(context:context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2027),);
              if(selectedDate != null){
                dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
              }
            },
            text: 'Task Date',
          readonly: true,
            
            controller: dateController,
            suffx: Icon(Icons.calendar_month_outlined,color: AppColors.primaryColor,),
          ),
          Gap(10),
            timeFields(),
             Gap(20),
             Row(
              spacing: 6,
              children: [
               ...List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentindex = index;
                      });
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: colors[index],
                      child: currentindex == index
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                })
              ],
             )

        ]
       ),
     )
      );
      
  }

  Row timeFields() {
    return Row(
           
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('start Date',
        style: TextStyles.titlestyle(fontSize: 15,color:  AppColors.darkColor),
        ),
        Gap(5),
        CustomField(
        onTap:() async {
            var selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
             if(selectedTime != null){
                startDateController.text = selectedTime.format(context);
          }
          },
          text: 'Task Date',
        readonly: true,
          controller: startDateController,
          suffx: Icon(Icons.watch_later_outlined,color: AppColors.primaryColor,),
        ),
                  ],
                ),
              ),
              Gap(10),
               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Date',

        style: TextStyles.titlestyle(fontSize: 15,color:  AppColors.darkColor),
        ),
        Gap(5),
        CustomField(
          onTap:() async {
            var selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
             if(selectedTime != null){
                endDateController.text = selectedTime.format(context);
          }
          },
         
          text: 'Task Date',
        readonly: true,
          controller:endDateController,
          suffx: Icon(Icons.watch_later_outlined,color: AppColors.primaryColor,),
        ),
                  ],
                ),
              ),
              

            ],
          );
  }
}