import 'package:chat_firebase/layout/home_cubit/home_cubit.dart';
import 'package:chat_firebase/routes.dart';
import 'package:chat_firebase/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../widgets/toast_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoutesGenerator.homeCubit..getUserModel()..getPosts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is addPostState){
            Navigator.pushNamed(context,Routes.addPost);
          }
        },
        builder: (context, state) {
          HomeCubit cubit =HomeCubit.get(context);
          return
          HomeCubit.get(context).userModel!=null?
            Scaffold(
            appBar: AppBar(
              title:  Text(cubit.titles[cubit.currentNav]),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.notification_important)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.search))
              ],
            ),
            body: Column(
              children: [
                if(FirebaseAuth.instance.currentUser!.emailVerified == false &&cubit.currentNav==0)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppColors.primary,
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline),
                      const SizedBox(width: 20,),
                      const Text(AppStrings.verfiyText),
                      const Spacer(),
                      getButton(onPressedFun: (){
                        FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value) {
                          myToast(
                            msg: "check your email",
                            color: Colors.green
                          );
                        }).catchError((error){

                        });
                      }, text: AppStrings.send,width: 80.0)
                    ],

                  ),
                ),


                cubit.screens[cubit.currentNav],
              ],
            ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentNav,
                onTap: (index){
                  cubit.changeButtonNav(index);
                },
                items:  const [
                  BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "home"),
                  BottomNavigationBarItem(icon: Icon(Icons.chat),label: "chat"),
                  BottomNavigationBarItem(icon: Icon(Icons.add),label: "Post"),

                  BottomNavigationBarItem(icon: Icon(Icons.location_on),label: "users"),
                  BottomNavigationBarItem(icon: Icon(Icons.settings_sharp),label: "settings"),
                ],
              ),
          ): const Scaffold(body:  Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
