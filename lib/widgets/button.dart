import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTap,
    required this.child,
    this.buttonColor,
    this.height,
    this.width,
    this.margin,
  });
  final Function() onTap;
  final Widget child;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: kPadding3,
        margin: margin ?? kPadding,
        decoration: BoxDecoration(
          borderRadius: radius15,
          color: buttonColor ?? kGreenClr,
        ),
        child: Center(child: child),
      ),
    );
  }
}
