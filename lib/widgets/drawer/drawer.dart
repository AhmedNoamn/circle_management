import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/routes/routes.dart';
import '../../features/add_task/view.dart';
import '../../features/home/view.dart';
import '../../features/profile/view.dart';
import '../../features/register_employees/view.dart';
import '../../features/sign_in/view.dart';
import '../list_tile.dart';
import '../text_button.dart';

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
