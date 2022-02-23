import 'package:circle_management/features/home/units/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant.dart';
import '../../core/routes/routes.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/error_message.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/task_card.dart';
import '../../widgets/text_button.dart';
import '../task_detail/view.dart';
import 'states.dart';

part 'cubit.dart';
part 'units/app_bar.dart';
part 'units/dismissible_task.dart';
part 'units/filter_dialog.dart';
part 'units/task_list.dart';

part 'units/search_field.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..passCurrentUser(),
        child: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return Scaffold(
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
                  child: _TaskListUnit(),
                ),
              );
            } else {
              return Scaffold(
                body: ErrorMessage(
                  text:
                      'connection failed....\nplease check internet connection',
                  imageUrl: 'assets/images/warning.png',
                ),
              );
            }
          },
          child: SizedBox(
            height: 300,
            child: CircularIndicator(
              color: kBlueClr,
            ),
          ),
        ));
  }
}
