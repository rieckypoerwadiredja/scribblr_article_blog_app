import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/main_screen.dart';
import 'package:scribblr_article_blog_app/page/home_screen.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_primary.dart';
import 'package:scribblr_article_blog_app/widget/buttons/button_secondary.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_page.dart';
import 'package:scribblr_article_blog_app/wrapper.dart';

class OnBoardingScreen extends StatefulWidget {
  final int slide;
  const OnBoardingScreen({super.key, this.slide = 0});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _slide = 0;
  final List<Map<String, dynamic>> _slideContent = [
    {
      "image": "images/onboarding/read_article.png",
      "title": "Read interesting articles every single day!",
      "descMobile": "Stay informed with fresh articles daily.",
      "descDesktop":
          "Explore a diverse range of articles updated daily to keep you informed and inspired, wherever you are."
    },
    {
      "image": "images/onboarding/create_article.png",
      "title": "Create & publish your own articles to the world!",
      "descMobile": "Share your articles with a global audience easily.",
      "descDesktop":
          "Effortlessly craft and publish articles that can reach a global audience, making your voice heard worldwide."
    },
    {
      "image": "images/onboarding/connect_other.png",
      "title": "Let's connect with others right now!",
      "descMobile": "Connect, share ideas, and grow together.",
      "descDesktop":
          "Build meaningful connections, share insights, and collaborate with others to grow and learn together."
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double height;
    if (screenWidth < 640) {
      height = 50;
    } else if (screenWidth >= 648 && screenWidth < 920) {
      height = 50;
    } else {
      height = 40;
    }

    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(children: [
        SizedBox(
          width: double.infinity,
          height: screenHeight * 0.6,
          child: Image(
            image: AssetImage(_slideContent[_slide]["image"]!),
            fit: BoxFit.cover,
          ),
        ),
        Wrapper(
          height: screenHeight * 0.4,
          axisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                TitlePage(
                  color: Theme.of(context).colorScheme.onPrimary,
                  title: _slideContent[_slide]["title"],
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Membatasi lebar teks deskripsi
                DescPage(
                  color: Theme.of(context).colorScheme.onPrimary,
                  desc: screenWidth < 920
                      ? _slideContent[_slide]["descMobile"]!
                      : _slideContent[_slide]["descDesktop"]!,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: height,
                    child: ButtonSecondary(
                      textButton: "Skip",
                      onClick: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: height,
                    child: ButtonPrimary(
                      textButton: "Next",
                      onClick: () {
                        setState(() {
                          if (_slide < _slideContent.length - 1) {
                            _slide++;
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }));
                          }
                        });
                      },
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
