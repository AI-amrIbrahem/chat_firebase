import 'package:bloc/bloc.dart';
import 'package:chat_firebase/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../resources/app_strings.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void changePasswordVisiablity(){
    isPassword = !isPassword;
    if(isPassword){
      suffix = Icons.visibility_off;
    }else
      suffix = Icons.visibility_outlined;
    emit(RegisterChangePasswordState());
  }


  //Repo repo = Repo();

  static RegisterCubit get(context)=>BlocProvider.of<RegisterCubit>(context);

  void register(String email,String password,String name,String phone)async{
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
      print(value.user?.email.toString()??"");
      print(value.user?.uid.toString()??"");
      userCreate(email: email, name: name, phone: phone, uId: value.user?.uid.toString()??"");
      print(1);
      //emit(RegisterSuccessState());
    }).catchError((error){
      print(12);
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({required String email,required String name,required String phone,required String uId}){
    FirebaseFirestore.instance.collection(AppStrings.userCollection).doc(uId).set(UserModel(name: name, email: email, phone: phone, uId: uId).toMap()).then((value){
      emit(CreateUserSuccessState(uId));
      print(13);
    }).catchError((error){
      print(14);
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
