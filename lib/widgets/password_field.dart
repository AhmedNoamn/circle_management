import 'package:circle_management/widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';

class PasswordField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String? Function(String?)? onValidate;
  const PasswordField({this.onSaved, this.onValidate});
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHide = false;
  void hidePass() {
    setState(() => isHide = !isHide);
  }

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      hint: 'Password',
      trailling: IconButton(
        onPressed: hidePass,
        icon: isHide
            ? Icon(
                FontAwesomeIcons.eyeSlash,
                color: kGreenClr,
              )
            : Icon(
                FontAwesomeIcons.eye,
                color: kDarkClr,
              ),
      ),
      obscureText: isHide,
      validator: widget.onValidate,
      onSaved: widget.onSaved,
      inputAction: TextInputAction.next,
    );
  }
}
