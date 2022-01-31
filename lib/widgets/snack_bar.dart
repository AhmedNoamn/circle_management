import 'package:flutter/material.dart';

import '../core/routes/routes.dart';

showSnackBar(String message) =>
    ScaffoldMessenger.of(MagicRoute.currentContext).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
