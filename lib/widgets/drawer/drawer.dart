import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/features/add_task/view.dart';
import 'package:circle_management/features/home/view.dart';
import 'package:circle_management/features/profile/view.dart';
import 'package:circle_management/features/register_employees/view.dart';
import 'package:circle_management/features/sign_in/view.dart';
import 'package:circle_management/widgets/list_tile.dart';
import 'package:circle_management/widgets/text_button.dart';

import '../../constant.dart';

part 'units/drawer_body.dart';
part 'units/heading.dart';
part 'units/logout_dialoge.dart';

class DrawerUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _Heading(),
          _DrawerBody(),
        ],
      ),
    );
  }
}
