import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/prefrence/app_pref.dart';
import '../../resources/app_constants.dart';
import '../../resources/app_strings.dart';
import '../../routes.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/input_text_widget.dart';
import 'login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passowrdController = TextEditingController();
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccessState){
      CashHelper.saveData(key: AppStrings.uId, value: state.uId).then((value) {
        uId = state.uId;
        Navigator.pushReplacementNamed(context,Routes.home);
      });
    }
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
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
                          AppStrings.loginText.toUpperCase(),
                          style: Theme.of(context).textTheme.headline1!,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppStrings.loginSub,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey),
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
                            onsubmitted: (value) {
                              if (globalKey.currentState!.validate()) {
                                LoginCubit.get(context).Login(
                                    emailController.text.toString(),
                                    passowrdController.text.toString());
                              }
                            },
                            suffixFun: () {
                              LoginCubit.get(context)
                                  .changePasswordVisiablity();
                            },
                            sufxIcon: LoginCubit.get(context).suffix,
                            prefIcon: Icons.lock,
                            isPassword: LoginCubit.get(context).isPassword,
                            labelText: AppStrings.password,
                            myKeyboardtype: TextInputType.visiblePassword,
                            controller: passowrdController,
                            validFun: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.notValidPassword;
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        state is! LoginLoadingState?
                        getButton(
                            onPressedFun: () {
                              if (globalKey.currentState!.validate()) {
                                LoginCubit.get(context).Login(
                                    emailController.text.toString(),
                                    passowrdController.text.toString());
                              }
                            },
                            text: AppStrings.loginText) :
                        const Center(child: CircularProgressIndicator(),)
                        ,
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.DontHaveAccount),
                              getTextButton(
                                  onPressedFun: () {
                                       Navigator.pushNamed(
                                  context,Routes.register);
                                  },
                                  text: AppStrings.register)
                            ])
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
  },
),
);
  }
}
