import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';
import 'package:scribblr_article_blog_app/widget/texts/title_section.dart';

class EmptyLayout extends StatelessWidget {
  final double screenWidth;
  final String title;
  final String desc;
  const EmptyLayout(
      {super.key,
      required this.screenWidth,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset(
          'images/empty_data.png',
          width: screenWidth > 550 ? screenWidth / 3 : double.infinity,
        ),
        TitleSection(title: title),
        DescPage(
          desc: desc,
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}
