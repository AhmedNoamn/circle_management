import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../core/routes/routes.dart';
import '../forget_password/view.dart';
import '../home/view.dart';
import 'states.dart';
import '../sign_up/view.dart';
import '../../widgets/background_image.dart';
import '../../widgets/button.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/password_field.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/text_button.dart';

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
