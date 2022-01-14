import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/config/routes/app_routes.dart';
import 'package:flutter_clean_architecture/src/config/themes/app_theme.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: kAppName,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light);
  }
}
