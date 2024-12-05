import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_section.dart';

class CardMenu extends StatelessWidget {
  final String title;
  final Widget children;
  const CardMenu({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSection(
                  title: title,
                ),
                const Icon(Icons.arrow_right_alt)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: Expanded(
                child: children,
              ),
            ),
          ],
        ));
  }
}
