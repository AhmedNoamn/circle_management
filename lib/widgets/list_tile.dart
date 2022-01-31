import 'package:circle_management/constant.dart';
import 'package:flutter/material.dart';

class ListTileUnit extends StatelessWidget {
  const ListTileUnit({
    required this.leading,
    required this.title,
    this.subTitle,
    this.trailling,
    this.onTap,
    this.color,
    this.borderColor,
  });

  final Widget? leading;
  final Widget title;
  final Widget? subTitle;
  final Widget? trailling;
  final Function()? onTap;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? kWhiteClr,
          border: Border.all(
            color: borderColor ?? kWhiteClr,
            width: 0.5,
          )),
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: leading ??
            Container(
              width: 0,
            ),
        title: title,
        subtitle: subTitle ?? SizedBox(height: 0),
        trailing: trailling ?? SizedBox(height: 0),
        onTap: onTap,
      ),
    );
  }
}
