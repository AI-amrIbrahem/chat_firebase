import 'package:chat_firebase/layout/home_cubit/home_cubit.dart';
import 'package:chat_firebase/moduls/edit_profile/edit_profile.dart';
import 'package:chat_firebase/resources/app_colors.dart';
import 'package:chat_firebase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/button_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var userModel = HomeCubit.get(context).userModel;
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 170,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [ Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image:  DecorationImage(
                            image: NetworkImage(
                                userModel?.cover ?? 'https://img.freepik.com/free-photo/medium-shot-man-wearing-swimming-cap_23-2149252856.jpg?w=1060'
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        NetworkImage(
                            userModel?.image ?? 'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360'
                        ),
                      ),
                    ),
                  )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "${userModel?.name??""}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child:
                    InkWell(
                      child: Column(
                        children: [
                          Text('100',style: Theme.of(context).textTheme.subtitle2,),
                          const SizedBox(height: 8,),
                          Text('Posts',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                    InkWell(
                      child: Column(
                        children: [
                          Text('30',style: Theme.of(context).textTheme.subtitle2,),
                          const SizedBox(height: 8,),
                          Text('Photos',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                    InkWell(
                      child: Column(
                        children: [
                          Text('10k',style: Theme.of(context).textTheme.subtitle2,),
                          const SizedBox(height: 8,),
                          Text('Followers',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                    InkWell(
                      child: Column(
                        children: [
                          Text('70',style: Theme.of(context).textTheme.subtitle2,),
                          const SizedBox(height: 8,),
                          Text('Followings',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: getButton(onPressedFun: (){

                  Navigator.pushNamed(context,Routes.editProfile);
                },text: 'Edit Profile'),
              ),
            //getButton(onPressedFun: (){},text: 'Add Photo',),

            ],
          ),
        ),

    );
  },
);
  }
}
