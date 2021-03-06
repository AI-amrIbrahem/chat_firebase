import 'package:chat_firebase/layout/home_layout.dart';
import 'package:flutter/material.dart';

import '../resources/app_themes.dart';
import '../routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: true ? Routes.home : Routes.login,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
