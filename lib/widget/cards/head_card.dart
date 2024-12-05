import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/utils/custom_colors.dart';

class HeadCard extends StatelessWidget {
  final Widget children;
  const HeadCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4, // memberikan shadow
      color: CustomColors.primaryColor,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: children,
      ),
    );
  }
}
