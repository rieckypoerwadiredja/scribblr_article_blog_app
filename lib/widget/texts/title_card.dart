import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String? title;
  final TextAlign textAlign;
  final Color color;
  const TitleCard(
      {super.key,
      this.color = Colors.black,
      required this.title,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    if (screenWidth < 425) {
      fontSize = 15;
    } else if (screenWidth >= 425 && screenWidth < 648) {
      fontSize = 17;
    } else if (screenWidth >= 648 && screenWidth < 920) {
      fontSize = 20;
    } else {
      fontSize = 20;
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
    );
  }
}
