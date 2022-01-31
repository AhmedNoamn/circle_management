import 'dart:async';

import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/features/profile/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/features/register_employees/states.dart';
import 'package:circle_management/widgets/drawer/drawer.dart';
import 'package:circle_management/widgets/loading_view.dart';
import 'package:circle_management/widgets/snack_bar.dart';
import 'package:circle_management/widgets/task_card.dart';
import 'package:circle_management/widgets/text_button.dart';

part 'cubit.dart';
part 'units/app_bar.dart';
part 'units/employee_list.dart';

class RegisterWorkerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeCubit(),
      child: Scaffold(
        drawer: DrawerUnit(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: _AppBarUnit(),
        ),
        body: SafeArea(
          child: _EmployeesListUnit(),
        ),
      ),
    );
  }
}
