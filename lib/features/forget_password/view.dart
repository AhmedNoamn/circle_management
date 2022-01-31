import 'package:circle_management/core/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/widgets/background_image.dart';
import 'package:circle_management/widgets/button.dart';
import 'package:circle_management/widgets/inputfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'units/button.dart';
part 'units/field.dart';
part 'units/text.dart';
part 'cubit.dart';

class ForgetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackImageUnit(),
          ListView(
            padding: kPadding,
            children: [
              _TextUnit(),
              _FieldUnit(),
              _ButtonUnit(),
            ],
          )
        ],
      ),
    );
  }
}
