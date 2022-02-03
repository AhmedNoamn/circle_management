import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({required this.onTap, required this.child});
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: TextButton(
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
