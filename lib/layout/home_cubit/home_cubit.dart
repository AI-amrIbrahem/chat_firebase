import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../data/models/post_model.dart';
import '../../moduls/add_post/post_screen.dart';
import '../../resources/app_strings.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserModel() {
    emit(getUserLoadingState());
    FirebaseFirestore.instance
        .collection(AppStrings.userCollection)
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(getUserSuccessState());
      print(userModel!.email);
    }).catchError((error) {
      print(error.toString());
      emit(getUserErrorState(error.toString()));
    });
  }

  int currentNav = 0;
  List<Widget> screens = const [
    FeedsScreen(),
    ChatScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingScreen()
  ];

  List<String> titles = const ["Home", 'Chats', 'Post', 'Users', 'Setting'];

  void changeButtonNav(int index) {
    if (index == 2)
      emit(addPostState());
    else {
      currentNav = index;
      emit(changeButtonNavState());
    }
  }

  File? imageFile;
  final _picker = ImagePicker();

  Future<void> getImage() async {
    await _picker
        .pickImage(
      source: ImageSource.gallery,
      //imageQuality: 360,
    )
        .then((value) {
      if (value != null) {
        imageFile = File(value.path);
        print("amr");
        emit(ProfileImageSuccessState());
      } else {
        print("amr0");
        print("not found ");
        emit(ProfileImageErrorState());
      }
    });
  }

  File? imageFileCover;

  Future<void> getImageCover() async {
    await _picker
        .pickImage(
      source: ImageSource.gallery,
      //imageQuality: 360,
    )
        .then((value) {
      if (value != null) {
        imageFileCover = File(value.path);
        print("amr");
        emit(ProfileImageSuccessState());
      } else {
        print("amr0");
        print("not found ");
        emit(ProfileImageErrorState());
      }
    });
  }

  String profImage = "";

  Future<void> uploadProfImage() async {
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageFile!.path).pathSegments.last}')
        .putFile(imageFile!)
        .then((value) async {
      print("x");

      await value.ref.getDownloadURL().then((value) {
        profImage = value;
        imageFile = null;
        emit(UpdateProfileImageSuccessState());
        print(value);
      }).onError((error, stackTrace) {
        print(error.toString());
        emit(UpdateProfileImageErrorState());
      });
      print("x");
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(UpdateProfileImageErrorState());
    });
  }

  String profCoverImage = "";

  Future<void> uploadCoverProfImage() async {
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageFileCover!.path).pathSegments.last}')
        .putFile(imageFileCover!)
        .then((value) async {
      print("x");
      print("step2");
      await value.ref.getDownloadURL().then((value) {
        profCoverImage = value;
        imageFileCover = null;

        //emit(UpdateProfileImageSuccessState());
        print(value);
      }).onError((error, stackTrace) {
        print(error.toString());
        emit(UpdateProfileImageErrorState());
      });
      print("x");
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(UpdateProfileImageErrorState());
    });
  }

  updateUser({required String name, required String phone}) {
    emit(LoadingUserUpdateState());
    if (imageFile != null && imageFileCover != null) {
      uploadProfImage().then((value) {
        uploadCoverProfImage().then((value) {
          update(name: name, phone: phone);
        });
      });
      // imageFile = null;
    } else if (imageFile != null) {
      uploadProfImage().then((value) {
        update(name: name, phone: phone);
      });
      // imageFile = null;
    } else if (imageFileCover != null) {
      print("step1");
      print(505);
      uploadCoverProfImage().then((value) {
        print(515);
        print("step3");
        update(name: name, phone: phone);
      });
      // imageFileCover = null;

    } else {
      update(name: name, phone: phone);
    }
  }

  void update({required String name, required String phone}) {
    print(profCoverImage.isNotEmpty);
    print(profCoverImage.toString());
    UserModel model = UserModel(
        cover: profCoverImage.isNotEmpty ? profCoverImage : userModel!.cover,
        // 'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360',
        image: profImage.isNotEmpty ? profImage : userModel!.image,
        //'https://img.freepik.com/free-photo/medium-shot-senior-man-posing_23-2149252814.jpg?w=360',
        name: name,
        phone: phone,
        uId: userModel!.uId.toString(),
        email: userModel?.email ?? "");
    print("my id ${userModel!.uId.toString()}");
    print(userModel!.phone);

    profCoverImage = "";
    profImage = "";
    FirebaseFirestore.instance
        .collection(AppStrings.userCollection)
        .doc(userModel!.uId.toString())
        .update(model.toMap())
        .then((value) {
      print(000);
      print("step4");
      print("amrIbrahem");
      getUserModel();
    });
  }

  File? imagePost;

  Future<void> getimagePost() async {
    await _picker
        .pickImage(
      source: ImageSource.gallery,
      //imageQuality: 360,
    )
        .then((value) {
      if (value != null) {
        imagePost = File(value.path);
        print("amr");
        emit(ProfilePostImageSuccessState());
      } else {
        print("amr0");
        print("not found ");
        emit(ProfilePostImageErrorState());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  //String profPostImage = "";

  void uploadPostImage({required String dateTime, required String text}) async {
    emit(UploadingImageLoadingState());

    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(imagePost!.path).pathSegments.last}')
        .putFile(imagePost!)
        .then((value) async {
      print("x");

      await value.ref.getDownloadURL().then((value) {
        //profPostImage = value;
        //imagePost = null;
        createPost(text: text, dateTime: dateTime, postImage: value);
        emit(UploadPostImageSuccessState());
        //print(value);
      }).onError((error, stackTrace) {
        print(error.toString());
        emit(CreatePostErrorState());
      });
      print("x");
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(CreatePostErrorState());
    });
  }

  void createPost(
      {required String dateTime, required String text, String? postImage}) {
    emit(creatPostLoadingState());

    PostModel model = PostModel(
        name: userModel?.name ?? "",
        uId: userModel?.uId ?? "",
        image: userModel?.image ?? "",
        dateTime: dateTime,
        text: text,
        postImage: postImage ?? "");

    FirebaseFirestore.instance
        .collection(AppStrings.postCollection)
        .add(model.toMap())
        .then((value) {
      print(000);
      print("step4");
      print("amrIbrahem");
      postsList = [];
      postsListId = [];
      likes = [];
      getPosts();
      emit(CreatePostSuccessState());
    });
  }

  void removeImagePost() {
    imagePost = null;
    emit(RemovePostImageState());
  }

  List<PostModel> postsList = [];
  List<String> postsListId = [];
  List<int> likes = [];

  void getPosts() {
    FirebaseFirestore.instance
        .collection(AppStrings.postCollection)
        .get()
        .then((value) {
      value.docs.forEach((e) {
        e.reference.collection('likes').get().then((value){
          likes.add(value.docs.length);
          postsList.add(PostModel.fromJson(e.data()));
          postsListId.add(e.id);
          emit(GetPostsSuccessState());
        });

      });
    }).catchError((error) {
      emit(GetPostsErrorState());
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance.collection(AppStrings.postCollection)
    .doc(postId)
    .collection('likes')
    .doc(userModel!.uId)
    .set({'like':true})
    .then((value) {
      postsList = [];
       postsListId = [];
      likes = [];
      getPosts();
      //emit(likeSuccessState());
    }).catchError((error){
      emit(likeErrorState());
    });
  }
}
