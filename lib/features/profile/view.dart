import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:circle_management/constant.dart';
import 'package:circle_management/core/routes/routes.dart';
import 'package:circle_management/features/profile/states.dart';
import 'package:circle_management/features/sign_in/view.dart';
import 'package:circle_management/widgets/button.dart';
import 'package:circle_management/widgets/loading_view.dart';
import 'package:circle_management/widgets/rich_text.dart';
import 'package:circle_management/widgets/snack_bar.dart';

part 'cubit.dart';
part 'units/app_bar.dart';
part 'units/info_card.dart';
part 'units/social_button.dart';
part 'units/image.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
    this.userId,
  );
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(userId),
      child: Scaffold(
        backgroundColor: kGreyClr.withOpacity(0.8),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: _AppBarUnit(),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: sizeHeight(context, 15)),
          children: [
            Stack(
              children: [
                _InfoCardUnit(),
                _ImageUnit(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
