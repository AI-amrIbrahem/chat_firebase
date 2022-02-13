
import 'package:bloc/bloc.dart';
import 'package:chat_firebase/data/models/user_model.dart';
import 'package:chat_firebase/moduls/chats/chat_screen.dart';
import 'package:chat_firebase/moduls/feeds/feeds_screen.dart';
import 'package:chat_firebase/moduls/settings/settings_screen.dart';
import 'package:chat_firebase/moduls/users/users_screen.dart';
import 'package:chat_firebase/resources/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../resources/app_strings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserModel(){
    emit(getUserLoadingState());
    FirebaseFirestore.instance.collection(AppStrings.userCollection).doc(uId).get().then((value){
      userModel = UserModel.fromJson(value.data());
      emit(getUserSuccessState());
      print(userModel!.email);
    }).catchError((error){
      print(error.toString());
      emit(getUserErrorState(error.toString()));
    });
  }

  int currentNav = 0;
  List<Widget> screens=const [
     FeedsScreen(),
     ChatScreen(),
     UsersScreen(),
     SettingScreen()
  ];

  List<String> titles=const [
    "Home",
    'Chats',
    'Users',
    'Setting'
  ];

  void changeButtonNav(int index){
    if (index == 2)
      emit(addPostState());
    else{
      currentNav = index;
      emit(changeButtonNavState());
    }

  }
}
