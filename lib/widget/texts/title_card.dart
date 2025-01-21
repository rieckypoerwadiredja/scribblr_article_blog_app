import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String? title;
  final TextAlign textAlign;
  final Color color;
  final int maxLines;
  const TitleCard(
      {super.key,
      this.color = Colors.black,
      required this.title,
      this.maxLines = 2,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth <= 550) {
      fontSize = 14;
    } else if (screenWidth < 920) {
      fontSize = 16;
    } else {
      fontSize = 18;
    }

    return Text(
      title!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
    );
  }
}
