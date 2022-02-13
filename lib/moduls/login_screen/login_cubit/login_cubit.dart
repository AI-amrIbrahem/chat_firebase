import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void changePasswordVisiablity(){
    isPassword = !isPassword;
    if(isPassword){
      suffix = Icons.visibility_off;
    }else
      suffix = Icons.visibility_outlined;
    emit(LoginChangePasswordState());
  }

  void Login(String email,String password)async{
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
      emit(LoginSuccessState(value.user?.uid.toString()??""));
    }).catchError((value){
      emit(LoginErrorState(value.toString()));
    });

  }

}
