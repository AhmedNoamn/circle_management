import 'package:flutter/material.dart';

import '../constant.dart';

class RichTextField extends StatelessWidget {
  const RichTextField({
    required this.firstText,
    required this.secondText,
    required this.style,
  });
  final String firstText;
  final String secondText;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: firstText, style: style, children: [
        TextSpan(
          text: secondText,
          style: style.copyWith(
            color: secondText == '  *' ? kRedClr : kDarkClr.withOpacity(0.5),
          ), //
        )
      ]),
    );
  }
}
