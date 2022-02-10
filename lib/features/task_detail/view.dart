import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../constant.dart';
import '../../core/routes/routes.dart';
import '../../core/validator/validator.dart';
import '../profile/view.dart';
import 'states.dart';
import '../../widgets/add_task_filed.dart';
import '../../widgets/button.dart';
import '../../widgets/error_message.dart';
import '../../widgets/list_tile.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/text_button.dart';

part 'cubit.dart';
part 'units/add_comment.dart';
part 'units/app_bar.dart';
part 'units/card_task_info.dart';
part 'units/comments.dart';
part 'units/date_unit.dart';
part 'units/state_unit.dart';
part 'units/user_info_unit.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({
    required this.taskId,
    required this.taskUpLoadedBy,
  });

  final String taskId;
  final String taskUpLoadedBy;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskDetailCubit()..getTaskAndUserDetail(taskUpLoadedBy, taskId),
      child: Scaffold(
        backgroundColor: kGreyClr.withOpacity(0.9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: _AppBarUnit(),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              Center(
                child: Text(
                  'Task Title',
                  style: style1,
                ),
              ),
              SizedBox(height: 20),
              _CardTaskInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
