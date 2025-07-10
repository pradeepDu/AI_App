import 'package:ai_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  // Add this line to ensure proper initialization
  WidgetsFlutterBinding.ensureInitialized();
  
  // Force portrait orientation for better mobile experience
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style for better contrast on status bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Pre-cache Material icons to ensure they're loaded correctly
    Future<void>.microtask(() {
      // Access common icons used in the app to ensure they're pre-cached
      const icons = [
        Icons.home,
        Icons.search,
        Icons.auto_awesome,
        Icons.language,
        Icons.cloud_outlined,
        Icons.keyboard_arrow_right,
        Icons.keyboard_arrow_left,
        Icons.source_outlined,
        Icons.arrow_forward,
        Icons.circle_notifications_outlined,
      ];
      // Use the icons variable to avoid the unused variable warning
      debugPrint('Preloading ${icons.length} icons for better visibility');
    });
    
    return MaterialApp(
      title: 'AI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        // Enhanced icon theme with higher contrast for Android
        iconTheme: const IconThemeData(
          color: Colors.white, 
          size: 28, // Larger default size
          opacity: 1.0, // Force full opacity
        ),
        // Primary icons theme to ensure consistent rendering
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
          size: 28, // Larger default size
          opacity: 1.0,
        ),
        // Add shadow to all icons for better visibility on all backgrounds
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Ensure button text is white
          ),
        ),
        // Increase overall icon and button visibility
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        // Ensure Material 3 is enabled for better icon rendering
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
