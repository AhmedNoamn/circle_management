import 'package:circle_management/features/task_detail/view.dart';
import 'package:circle_management/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/widgets/drawer/drawer.dart';
import 'package:circle_management/widgets/text_button.dart';
import 'package:circle_management/widgets/task_card.dart';

part 'units/app_bar.dart';
part 'units/delete_dialog.dart';
part 'units/filter_dialog.dart';
part 'cubit.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerUnit(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: _AppBarUnit(),
      ),
      body: ListView.builder(
        padding: kPadding1(0, 20),
        itemCount: 10,
        itemBuilder: (context, index) => CustomCard(
          onTap: () =>
              MagicRoute.navigateAndPopUntilFirstPage(TaskDetailView()),
          onLongPress: () => KShowDialog(context),
          imageUrl: Image.asset(
            'assets/images/stopwatch.png',
            fit: BoxFit.cover,
          ),
          title: 'Task Name',
          description: 'Description',
          trailling: Icon(
            Icons.arrow_forward_ios_sharp,
            color: kBlueClr.withOpacity(0.8),
            size: 40,
          ),
        ),
      ),
    );
  }
}
