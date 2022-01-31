import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/core/validator/validator.dart';
import 'package:circle_management/features/home/view.dart';
import 'package:circle_management/features/sign_in/view.dart';
import 'package:circle_management/features/sign_up/states.dart';
import 'package:circle_management/widgets/background_image.dart';
import 'package:circle_management/widgets/button.dart';
import 'package:circle_management/widgets/custom_dialog.dart';
import 'package:circle_management/widgets/inputfield.dart';
import 'package:circle_management/widgets/loading_view.dart';
import 'package:circle_management/widgets/password_field.dart';
import 'package:circle_management/widgets/snack_bar.dart';
import 'package:circle_management/widgets/text_button.dart';

part 'cubit.dart';
part 'units/button.dart';
part 'units/fields.dart';
part 'units/select_image_dialog.dart';
part 'units/select_job_dialog.dart';
part 'units/title_text.dart';
part 'units/user_image.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            BackImageUnit(),
            ListView(
              padding: kPadding,
              children: [
                SizedBox(height: sizeHeight(context, 40)),
                _TextUnit(),
                SizedBox(height: sizeHeight(context, 10)),
                _FieldUnit(),
                SizedBox(height: sizeHeight(context, 20)),
                ButtonsUnit(),
              ],
            ),
            Positioned(
              top: 40,
              right: 20,
              child: ImageUnits(),
            )
          ],
        ),
      ),
    );
  }
}
