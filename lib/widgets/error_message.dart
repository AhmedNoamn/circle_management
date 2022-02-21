import '../constant.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    required this.text,
    required this.imageUrl,
  });

  final String text;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: kPadding1(70, 100),
      children: [
        Image.asset(
          imageUrl,
        ),
        Text(
          text,
          style: style1.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
