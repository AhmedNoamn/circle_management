import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/features/home/states.dart';
import 'package:circle_management/features/task_detail/view.dart';
import 'package:circle_management/widgets/drawer/drawer.dart';
import 'package:circle_management/widgets/error_message.dart';
import 'package:circle_management/widgets/loading_view.dart';
import 'package:circle_management/widgets/snack_bar.dart';
import 'package:circle_management/widgets/task_card.dart';
import 'package:circle_management/widgets/text_button.dart';

part 'cubit.dart';
part 'units/app_bar.dart';
part 'units/dismissible_task.dart';
part 'units/filter_dialog.dart';
part 'units/task_list.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..passCurrentUser(),
      child: Scaffold(
        drawer: DrawerUnit(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: _AppBarUnit(),
        ),
        body: _TaskListUnit(),
      ),
    );
  }
}
