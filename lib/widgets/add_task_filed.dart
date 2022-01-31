import 'package:flutter/material.dart';

import '../constant.dart';

class TaskInputField extends StatelessWidget {
  const TaskInputField({
    required this.hint,
    this.maxLines,
    this.onTap,
    this.enabled,
    this.onSaved,
    this.trailling,
  });
  final int? maxLines;
  final String hint;
  final bool? enabled;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final Widget? trailling;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Container(
        padding: kPadding1(15, 0),
        margin: kPadding2,
        decoration: BoxDecoration(
          border: Border.all(color: kDarkClr),
          borderRadius: radius15,
          color: kGreyClr.withOpacity(0.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: enabled ?? true,
                maxLines: maxLines ?? 1,
                onSaved: onSaved,
                style: hint == '' ? style4 : style2.copyWith(color: kDarkClr),
                cursorColor: kBlueClr,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: style2.copyWith(color: kDarkClr),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                ),
              ),
            ),
            trailling ?? SizedBox(width: 0),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
