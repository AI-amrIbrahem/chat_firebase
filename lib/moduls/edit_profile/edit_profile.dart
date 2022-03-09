
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home_cubit/home_cubit.dart';
import '../../resources/app_strings.dart';
import '../../widgets/input_text_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var userModel = HomeCubit
            .get(context)
            .userModel;

        nameController.text = userModel?.name.toString()??"";
        phoneController.text = userModel?.phone.toString()??"";

        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.editProfileTitle),
            titleSpacing: 0,
            actions: [
              TextButton(onPressed: () {
                HomeCubit.get(context).updateUser(name: nameController.text.toString(), phone: phoneController.text.toString());
              }, child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(AppStrings.update,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is LoadingUserUpdateState)
                  LinearProgressIndicator(),
                  Container(
                    height: 170,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [ Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Stack(
                          children: [ Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image:

                                  HomeCubit.get(context).imageFileCover == null ?

                                  NetworkImage(
                                      userModel?.cover ??
                                          'https://img.freepik.com/free-photo/medium-shot-man-wearing-swimming-cap_23-2149252856.jpg?w=1060'
                                  )
                                      :
                                  FileImage(HomeCubit.get(context).imageFileCover!) as ImageProvider,


                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                            Positioned(bottom: 5,
                                left: 5,
                                child: IconButton(onPressed: () {
                                  HomeCubit.get(context).getImageCover();
                                },
                                    icon: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.camera_alt))))
                          ],
                        ),
                      ),
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme
                                      .of(context)
                                      .scaffoldBackgroundColor
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:

                                  HomeCubit.get(context).imageFile == null ?

                                  NetworkImage(
                                      userModel?.image ??
                                          'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360'
                                  )
                                      :
                                      FileImage(HomeCubit.get(context).imageFile!) as ImageProvider

                                  ,
                                ),
                              ),
                            ),
                            Positioned(bottom: -8, left: -8, child: IconButton(
                                onPressed: () {
                                  HomeCubit.get(context).getImage();
                                },
                                icon: CircleAvatar(backgroundColor: Colors.white,
                                    child: Icon(Icons.camera_alt))))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  getTextFormField(
                    myKeyboardtype: TextInputType.name,
                    controller: nameController,
                    validFun: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.nameValidEmail;
                      }
                      return null;
                    },
                    labelText: 'name',
                    prefIcon: Icons.person,
                  ),
                  SizedBox(height: 10,),
                  getTextFormField(
                    myKeyboardtype: TextInputType.phone,
                    controller: phoneController,
                    validFun: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.phoneValidEmail;
                      }
                      return null;
                    },
                    labelText: 'phone',
                    prefIcon: Icons.phone,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
