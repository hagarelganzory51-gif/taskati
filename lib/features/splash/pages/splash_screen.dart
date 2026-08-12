import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/contants/image_app.dart';
import 'package:taskati/core/function/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/pages/home_screen.dart';
import 'package:taskati/features/upload/pages/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
   

  State<SplashScreen> createState() => _SplashScreenState();
}
  
class _SplashScreenState extends State<SplashScreen> {
  bool isupload =LocalHelper.getData(LocalHelper.kIsUpload) ?? false;
    @override
    void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      
      if(isupload){
        pushReplacement(context,  HomeScreen());
      } else {
       pushReplacement(context, UploadScreen());
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Lottie.asset(ImageApp.emptyjson, width: 250 ),
          Gap(10),
          Text('Taskati', style: TextStyles.bodystyle(fontSize: 24, color:AppColors.darkColor)),
           Gap(10),
          Text('it\'s Time To Get Organized', style: TextStyles.bodystyle(color:AppColors.greyColor)),
          ],
        ),
      )

    );
  }
}