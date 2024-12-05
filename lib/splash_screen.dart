import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scribblr_article_blog_app/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Delay selama 3 detik sebelum berpindah ke MainScreen
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
    });
  }

  @override
  void dispose() {
    // Kembalikan mode UI system
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return Container(
        color: Colors.white,
        child: Center(
            child: SizedBox(
                width: screenWidth / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/scribblr_logo.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    SpinKitCircle(
                      color: Theme.of(context).colorScheme.primary,
                      size: 50.0,
                    ),
                  ],
                ))),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Center(
            child: SizedBox(
                width: screenWidth / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/scribblr_logo.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    SpinKitCircle(
                      color: Theme.of(context).colorScheme.primary,
                      size: 65.0,
                    ),
                  ],
                ))),
      );
    }
  }
}
