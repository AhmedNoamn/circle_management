import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../constant.dart';
import '../../core/routes/routes.dart';
import '../../core/validator/validator.dart';
import '../../widgets/add_task_filed.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/snack_bar.dart';
import '../home/view.dart';
import 'status.dart';

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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                kWhiteClr,
                kGreyClr,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
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
      ),
    );
  }
}
