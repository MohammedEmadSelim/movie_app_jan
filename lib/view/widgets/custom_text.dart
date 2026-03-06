import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color? color;
  final int fontSize;

  const CustomText({
    super.key,
    required this.text,
    required this.fontWeight,
    this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: fontWeight, color: color),
    );
  }
}
