import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/features/forget_password/view.dart';
import 'package:circle_management/features/home/view.dart';
import 'package:circle_management/features/sign_in/states.dart';
import 'package:circle_management/features/sign_up/view.dart';
import 'package:circle_management/widgets/background_image.dart';
import 'package:circle_management/widgets/button.dart';
import 'package:circle_management/widgets/inputfield.dart';
import 'package:circle_management/widgets/loading_view.dart';
import 'package:circle_management/widgets/password_field.dart';
import 'package:circle_management/widgets/snack_bar.dart';
import 'package:circle_management/widgets/text_button.dart';

part 'cubit.dart';
part 'units/button.dart';
part 'units/fields.dart';
part 'units/text.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            BackImageUnit(),
            ListView(
              padding: kPadding,
              children: [
                _TextUnit(),
                SizedBox(height: sizeHeight(context, 10)),
                _FieldUnit(),
                _ButtonsUnit(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
