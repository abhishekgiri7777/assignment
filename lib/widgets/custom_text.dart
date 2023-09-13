import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  CustomText(
      {required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
