import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ButtonShare extends StatelessWidget {
  final String title;
  final String defaultText;
  final String url;

  const ButtonShare(
      {super.key,
      required this.title,
      required this.url,
      required this.defaultText});

  void _shareArticle(BuildContext context) {
    final String shareText = "$defaultText: $title \n$url";
    Share.share(shareText, subject: 'Look what I found!');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _shareArticle(context),
      icon: const Icon(
        Icons.share,
        color: Colors.white,
      ),
    );
  }
}
