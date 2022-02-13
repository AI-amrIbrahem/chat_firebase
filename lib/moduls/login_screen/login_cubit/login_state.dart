part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginChangePasswordState extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  String uId;

  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}
