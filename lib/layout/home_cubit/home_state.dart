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

class ProfileImageSuccessState extends HomeState {}
class ProfileImageErrorState extends HomeState {}

class UpdateProfileImageSuccessState extends HomeState {}
class UpdateProfileImageErrorState extends HomeState {}
class LoadingUserUpdateState extends HomeState {}

class ProfilePostImageSuccessState extends HomeState {}
class ProfilePostImageErrorState extends HomeState {}

class CreatePostErrorState extends HomeState {}
class UploadPostImageSuccessState extends HomeState {}
class CreatePostSuccessState extends HomeState {}
class creatPostLoadingState extends HomeState {}
class UploadingImageLoadingState extends HomeState {}
class RemovePostImageState extends HomeState {}

class GetPostsSuccessState extends HomeState {}
class GetPostsErrorState extends HomeState {}

class likeSuccessState extends HomeState {}

class likeErrorState extends HomeState {}

class GetAllUsersSuccessState extends HomeState {}
class GetAllUsersErrorState extends HomeState {}


class SendMessageScuccessState extends HomeState {}
class SendMessageErrorState extends HomeState {}

class SendAllMessageScuccessState extends HomeState {}
class SendAllMessageErrorState extends HomeState {}