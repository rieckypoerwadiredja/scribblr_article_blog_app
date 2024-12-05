import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String? title;
  final TextAlign textAlign;
  final Color color;
  const TitleSection(
      {super.key,
      this.color = Colors.black,
      required this.title,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth < 648) {
      fontSize = screenWidth * 0.06;
    } else if (screenWidth >= 648 && screenWidth < 920) {
      fontSize = screenWidth * 0.04;
    } else {
      fontSize = screenWidth * 0.02;
    }

    return Text(
      title!,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
