part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeSuccessState extends HomeState {}
class HomeErrorState extends HomeState {
  String error;

  HomeErrorState(this.error);
}
class getUserLoadingState extends HomeState {}

class getUserSuccessState extends HomeState {}

class getUserErrorState extends HomeState {
  String error;

  getUserErrorState(this.error);
}
class changeButtonNavState extends HomeState {}

class addPostState extends HomeState {}
