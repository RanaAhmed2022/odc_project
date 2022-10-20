import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {Key? key,
      required this.text,
       this.textColor,
       this.fontSize, this.fontWeight})
      : super(key: key);
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight:fontWeight ,color: textColor, fontSize: fontSize),
    );
  }
}
