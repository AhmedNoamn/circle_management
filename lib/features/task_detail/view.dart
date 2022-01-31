import 'package:flutter/material.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/widgets/button.dart';
import 'package:circle_management/widgets/list_tile.dart';
import 'package:circle_management/widgets/add_task_filed.dart';
import 'package:circle_management/widgets/text_button.dart';

part 'units/add_comment.dart';
part 'units/app_bar.dart';
part 'units/card_task_info.dart';
part 'units/comments.dart';
part 'units/date_unit.dart';
part 'units/state_unit.dart';
part 'units/user_info_unit.dart';

class TaskDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: sizeHeight(context, 30)),
            _CardTaskInfo(),
          ],
        ),
      ),
    );
  }
}
