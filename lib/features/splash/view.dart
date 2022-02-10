import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/view.dart';
import '../sign_in/view.dart';
import '../../widgets/loading_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return LoadingIndicatorView();
        } else if (snapShot.hasData) {
          return HomeView();
        } else {
          return SignInView();
        }
      },
    );
  }
}
