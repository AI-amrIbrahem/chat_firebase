
import 'package:chat_firebase/layout/home_cubit/home_cubit.dart';
import 'package:chat_firebase/layout/home_layout.dart';
import 'package:chat_firebase/moduls/edit_profile/edit_profile.dart';
import 'package:chat_firebase/moduls/settings/settings_screen.dart';
import 'package:chat_firebase/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'moduls/add_post/post_screen.dart';
import 'moduls/login_screen/login_screen.dart';
import 'moduls/register_screen/register_screen.dart';

class Routes{
  static const login = "login";

  static const register = "register";

  static const home = "home";

  static const addPost = "addPost";

  static const editProfile = "editProfile";

  static const setting = "setting";

}

class RoutesGenerator{
  static final HomeCubit homeCubit = HomeCubit();
  static Route<dynamic> getRoute(RouteSettings routeSetting){
    switch (routeSetting.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) =>  const HomeLayout());
      case Routes.addPost:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(value: homeCubit,child:const NewPostScreen()));
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(value: homeCubit,child: const EditProfile()));
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(value: homeCubit,child:const SettingScreen()));
      default :
        return UnDifendRoute();
    }
  }
  static Route UnDifendRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text(AppStrings.notFoundRoute),),
      );
    });
  }
}