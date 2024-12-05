import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/splash_screen.dart';
import 'package:scribblr_article_blog_app/utils/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: const ColorScheme.light(
          primary: CustomColors.primaryColor,
          secondary: CustomColors.secondaryColor,
          onPrimary: Colors.black, // Text Primary
          onSecondary: Color.fromARGB(255, 158, 158, 158), // Text Secondary
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black),
        ),
      ),
      // darkTheme: ThemeData(
      //   primaryColor: CustomColors.backgroundColorBlack,
      //   colorScheme: const ColorScheme.light(
      //     primary: CustomColors.primaryColor,
      //     secondary: Colors.grey,
      //     onPrimary: Colors.white, // Text Primary
      //     onSecondary: Color.fromARGB(255, 158, 158, 158), // Text Secondary
      //   ),
      //   scaffoldBackgroundColor: Colors.black87,
      //   textTheme: const TextTheme(
      //     titleLarge: TextStyle(color: Colors.white),
      //   ),
      // ),
      themeMode: ThemeMode.system, // Ikuti pengaturan sistem
      home: const SplashScreen(),
    );
  }
}
