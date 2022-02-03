import 'package:circle_management/widgets/loading_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/validator/validator.dart';
import 'package:circle_management/features/add_task/status.dart';
import 'package:circle_management/widgets/add_task_filed.dart';
import 'package:circle_management/widgets/button.dart';
import 'package:circle_management/widgets/custom_dialog.dart';
import 'package:circle_management/widgets/drawer/drawer.dart';
import 'package:circle_management/widgets/rich_text.dart';
import 'package:circle_management/widgets/snack_bar.dart';

part 'cubit.dart';
part 'units/app_bar.dart';
part 'units/button.dart';
part 'units/category_dialog.dart';
part 'units/date_dialog.dart';
part 'units/fields.dart';

class AddTaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        drawer: DrawerUnit(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: _AppBarUnit(),
        ),
        body: ListView(
          padding: kPadding3,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'All Fields Required',
                style: style2.copyWith(color: kRedClr),
              ),
            ),
            _FieldUnit(),
            _ButtonUnit(),
          ],
        ),
      ),
    );
  }
}
