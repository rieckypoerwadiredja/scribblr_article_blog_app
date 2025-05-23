import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scribblr_article_blog_app/model/article_bookmark.dart';
import 'package:scribblr_article_blog_app/model/article_data.dart';
import 'package:scribblr_article_blog_app/routes/app_route_config.dart';
import 'package:scribblr_article_blog_app/utils/custom_colors.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // required to support SemanticsBinding
  usePathUrlStrategy();
  SemanticsBinding.instance
      .ensureSemantics(); // add this line to render webelements for UI readers/automation
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleProvider()),
        ChangeNotifierProvider(
          create: (context) => BookmarkProvider(
              articleProvider:
                  Provider.of<ArticleProvider>(context, listen: false)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      routerConfig: appRouter,
    );
  }
}
