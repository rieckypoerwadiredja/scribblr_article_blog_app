import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';

class ButtonPrimary extends StatelessWidget {
  final String? textButton;
  final Function? onClick;
  final Color? bgColor;
  final Color? textColor;

  /// The `const ButtonPrimary` constructor in the `ButtonPrimary` class is defining the constructor for
  /// the `ButtonPrimary` widget. Here's what each part of the constructor is doing:
  const ButtonPrimary(
      {super.key,
      this.textColor = Colors.white,
      this.bgColor,
      required this.textButton,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onClick != null) {
          onClick!();
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            bgColor ?? Theme.of(context).colorScheme.primary),
        foregroundColor: WidgetStateProperty.all(textColor),
      ),
      child: DescPage(
        desc: textButton!,
        color: textColor!,
        bold: FontWeight.bold,
      ),
    );
  }
}
