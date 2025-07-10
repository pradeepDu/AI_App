import 'package:ai_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_app/pages/chat_page.dart';

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
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const ChatPage(
        question:'who is soham parekh?',
      ),
    );
  }
}
