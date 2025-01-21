import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  final String desc;
  final TextAlign textAlign;
  final Color color;
  final FontWeight bold;
  final FontStyle fontStyle;
  const DescPage(
      {super.key,
      required this.desc,
      this.fontStyle = FontStyle.normal,
      this.color = const Color(0xFF757575),
      this.bold = FontWeight.w400,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize;

    /// This block of code is determining the font size based on the width of the screen. Here's how it
    /// works:

    // if (screenWidth < 648) {
    //   fontSize = screenWidth * 0.045;
    // } else if (screenWidth >= 648 && screenWidth < 920) {
    //   fontSize = screenWidth * 0.03;
    // } else {
    //   fontSize = screenWidth * 0.015;
    // }
    if (screenWidth <= 550) {
      fontSize = 14;
    } else if (screenWidth < 920) {
      fontSize = 14;
    } else {
      fontSize = 16;
    }

    return Text(
      desc,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'Poppins',
        fontStyle: fontStyle,
        color: color,
        fontWeight: bold,
      ),
    );
  }
}
