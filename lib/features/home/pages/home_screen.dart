import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/today_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
            HomeHeader(),
            Gap(30),
            TodayHeader(),
            
            ],
          ),
        ),
      )
    );
  }
}
