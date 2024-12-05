import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment axisAlignment;
  final Color bgColor;
  final double height;
  const Wrapper(
      {super.key,
      required this.children,
      this.bgColor = Colors.transparent,
      this.axisAlignment = MainAxisAlignment.start,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        color: bgColor,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: axisAlignment,
            children: children));
  }
}
