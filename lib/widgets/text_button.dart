import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({required this.ontap, required this.child});
  final Widget child;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: TextButton(
        onPressed: ontap,
        child: child,
      ),
    );
  }
}
