import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/contants/image_app.dart';
import 'package:taskati/core/function/dialogs.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_field.dart';
import 'package:taskati/core/widgets/main_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  String path = '';
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(onPressed: (){
                if(path.isNotEmpty && nameController.text.isNotEmpty){
                 LocalHelper.putlocaldata(nameController.text, path);

                } else if(path.isEmpty && nameController.text.isNotEmpty){
                  showErrorDialog(context, 'Please upload an image');
                }
                else if(path.isNotEmpty && nameController.text.isEmpty){
                  showErrorDialog(context, 'Please enter your name');
                }
                else {
                  showErrorDialog(context, 'Please upload an image and enter your name');
                }
              }, 
              child:Text('Done',style:TextStyles.bodystyle())),
            ),
          ],
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircleAvatar(radius: 80,
                backgroundColor: AppColors.primaryColor,
                backgroundImage:path.isNotEmpty
                ?FileImage(File(path)):
                 AssetImage(ImageApp.user),
                ),
                Gap(20),
                MainButton(text: 'Upload From Camera', 
                width: 300,height: 50,
                 onPressed: () async {
                  await uploadImage(isCamera: true);
                    }),
                  Gap(10),
                  MainButton(text: 'Upload From Gallery',
                   width: 300,height: 50,
                    onPressed: () async {
                  await uploadImage(
                    isCamera: false
                  );
                    }
                    ),
                  Gap(20),
                  Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                    Gap(20),
                    CustomField(text: 'Enter your name',
                     controller: nameController),
                 
                ],
              ),
            ),
          ),
        )
      );
   
  }

  Future<void> uploadImage({required bool isCamera}) async {
    XFile?file  =await  ImagePicker().pickImage(source: isCamera  
   ? ImageSource.camera
     : ImageSource.gallery);
     if (file != null) {
        setState(() {
          path = file.path;
        });
      }
  }
}
