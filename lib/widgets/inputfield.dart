import 'package:flutter/material.dart';

import '../constant.dart';

// ignore: must_be_immutable
class CustomInputField extends StatelessWidget {
  const CustomInputField({
    this.hint,
    this.obscureText,
    this.onSaved,
    this.validator,
    this.trailling,
    this.fieldColor,
    this.inputAction,
    this.keyBoardType,
  });

  final bool? obscureText;
  final Widget? trailling;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Color? fieldColor;
  final TextInputAction? inputAction;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding1(15, 0),
      margin: kPadding2,
      decoration: BoxDecoration(
        border: Border.all(color: kDarkClr),
        borderRadius: radius15,
        color: kGreyClr.withOpacity(0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              obscuringCharacter: '*',
              textInputAction: inputAction ?? TextInputAction.next,
              onSaved: onSaved,
              validator: validator,
              style: style2.copyWith(color: kDarkClr),
              autofocus: false,
              cursorColor: kBlueClr,
              obscureText: obscureText ?? false,
              keyboardType: keyBoardType ?? TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: style2.copyWith(color: kDarkClr),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: kGreyClr.withOpacity(0),
                )),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: kGreyClr.withOpacity(0),
                )),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: kGreyClr.withOpacity(0),
                )),
              ),
            ),
          ),
          trailling ?? Container(),
        ],
      ),
    );
  }
}
