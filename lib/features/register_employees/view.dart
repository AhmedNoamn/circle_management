import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../core/routes/routes.dart';
import '../profile/view.dart';
import 'states.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/error_message.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/task_card.dart';
import '../../widgets/text_button.dart';

part 'cubit.dart';
part 'units/app_bar.dart';
part 'units/employee_list.dart';

class RegisterEmployeeView extends StatelessWidget {
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
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  kGreyClr,
                  kWhiteClr,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: _EmployeesListUnit(),
          ),
        ),
      ),
    );
  }
}
