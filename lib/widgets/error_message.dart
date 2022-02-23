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
      padding: EdgeInsets.only(top: 140, left: 0, right: 0),
      children: [
        Image.asset(
          imageUrl,
          height: 250,
        ),
        Center(
          child: Text(
            text,
            style: style1.copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
