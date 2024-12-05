import 'package:flutter/material.dart';

class WrapperScroll extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment axisAlignment;
  final Color bgColor;
  const WrapperScroll({
    super.key,
    required this.children,
    this.bgColor = Colors.transparent,
    this.axisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: axisAlignment,
              children: children)),
    );
  }
}
