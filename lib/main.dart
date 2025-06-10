import 'package:ai_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       scaffoldBackgroundColor:AppColors.background, 
        ),
      home: const HomePage(),
    );
  }
}



  