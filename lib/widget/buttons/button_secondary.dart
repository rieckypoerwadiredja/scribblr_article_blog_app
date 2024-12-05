import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';

class ButtonSecondary extends StatelessWidget {
  final String? textButton;
  final Function? onClick;
  const ButtonSecondary(
      {super.key, required this.textButton, required this.onClick});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double fontSize;
    double height;

    if (screenWidth < 648) {
      // fontSize = screenWidth * 0.05;
      height = 50;
    } else if (screenWidth >= 648 && screenWidth < 920) {
      // fontSize = screenWidth * 0.03;
      height = 50;
    } else {
      // fontSize = screenWidth * 0.015;
      height = 40;
    }
    return SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: () {
            if (onClick != null) {
              onClick!();
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.secondary),
            foregroundColor:
                WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
          ),
          child: DescPage(
            desc: textButton!,
            color: Theme.of(context).colorScheme.primary,
            bold: FontWeight.bold,
          ),
        ));
  }
}
