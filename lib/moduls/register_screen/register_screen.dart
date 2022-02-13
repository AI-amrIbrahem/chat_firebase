import 'package:chat_firebase/data/prefrence/app_pref.dart';
import 'package:chat_firebase/moduls/register_screen/register_cubit/register_cubit.dart';
import 'package:chat_firebase/resources/app_constants.dart';
import 'package:chat_firebase/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/app_strings.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/input_text_widget.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passowrdController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    if(state is CreateUserSuccessState){
      CashHelper.saveData(key: AppStrings.uId, value: state.uId).then((value) {
        uId = state.uId;
        Navigator.pushReplacementNamed(context,Routes.home);
      });
    }
  },
  builder: (context, state) {
    return Padding(
            padding:
            const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.register.toUpperCase(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppStrings.registerSub,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1!
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  getTextFormField(
                      prefIcon: Icons.email,
                      labelText: AppStrings.emailAddress,
                      myKeyboardtype: TextInputType.emailAddress,
                      controller: emailController,
                      validFun: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.notValidEmail;
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  getTextFormField(
                      prefIcon: Icons.person,
                      labelText: AppStrings.name,
                      myKeyboardtype: TextInputType.name,
                      controller: nameController,
                      validFun: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.nameValidEmail;
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  getTextFormField(
                      prefIcon: Icons.mobile_friendly,
                      labelText: AppStrings.phone,
                      myKeyboardtype: TextInputType.phone,
                      controller: phoneController,
                      validFun: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.phoneValidEmail;
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  getTextFormField(
                      onsubmitted: (value) {
                        if (globalKey.currentState!.validate()) {
                          RegisterCubit.get(context).register(emailController.text.toString(),passowrdController.text.toString(),nameController.text.toString(),phoneController.text.toString());
                        }
                      },
                      suffixFun: () {
                        RegisterCubit.get(context).changePasswordVisiablity();
                      },
                      sufxIcon: RegisterCubit.get(context).suffix,
                      prefIcon: Icons.lock,
                      isPassword: RegisterCubit.get(context).isPassword,
                      labelText: AppStrings.password,
                      myKeyboardtype: TextInputType.visiblePassword,
                      controller: passowrdController,
                      validFun: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.notValidPassword;
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  state is! RegisterLoadingState?
                  getButton(
                      onPressedFun: () {

                        if(globalKey.currentState!.validate()){
                          RegisterCubit.get(context).register(emailController.text.toString(),passowrdController.text.toString(),nameController.text.toString(),phoneController.text.toString());
                        }
                      }, text: AppStrings.register ) :
                  Center(child: const CircularProgressIndicator(),)
                  ,

                ],
              ),
            ),
          );
  },
),
        ),
      ),
    ),
);
  }
}
