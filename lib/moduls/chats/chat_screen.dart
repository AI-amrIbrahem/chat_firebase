import 'package:chat_firebase/data/models/user_model.dart';
import 'package:chat_firebase/layout/home_cubit/home_cubit.dart';
import 'package:chat_firebase/moduls/chat_details/chat_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return chatItem(cubit.usersList[index],context);
                },
                separatorBuilder:(context, index)=> Container(height: 1,color: Colors.grey,),
                itemCount: cubit.usersList.length),
          ),
        );
      },
    );
  }




  Widget chatItem(UserModel usersList,context,) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChateDetailsScreen(usersList),));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  usersList.image,//?? 'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360'
              ),
            ),
            const SizedBox(
              width: 15,
            ),

            Text(
                usersList.name
            ),

          ],
        ),
      ),
    );
  }
}
