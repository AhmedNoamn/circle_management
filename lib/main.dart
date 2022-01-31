import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'core/routes/routes.dart';
import 'features/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Management',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SplashView(),
    );
  }
}
