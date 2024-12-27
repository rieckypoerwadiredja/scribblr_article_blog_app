import 'package:flutter/material.dart';
import 'package:scribblr_article_blog_app/widget/texts/desc_page.dart';

class ButtonTag extends StatelessWidget {
  final String textButton;
  final Function? onClick;

  const ButtonTag({super.key, required this.textButton, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary, // Warna border
          width: 1.5, // Ketebalan border
        ),
        borderRadius: BorderRadius.circular(5), // Radius untuk border
      ),
      child: Text(
        textButton,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary, // Warna teks
          fontWeight: FontWeight.normal, // Menebalkan teks
        ),
      ),
    );
  }
}
