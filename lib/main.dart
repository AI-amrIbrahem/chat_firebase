import 'package:chat_firebase/resources/app_constants.dart';
import 'package:chat_firebase/resources/app_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';
import 'data/prefrence/app_pref.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  uId = CashHelper.getData(key: AppStrings.uId)??'';
  runApp(const MyApp());
}
