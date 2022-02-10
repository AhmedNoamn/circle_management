import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../../core/routes/routes.dart';
import '../../core/validator/validator.dart';
import '../home/view.dart';
import '../sign_in/view.dart';
import 'states.dart';
import '../../widgets/background_image.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/password_field.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/text_button.dart';

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
