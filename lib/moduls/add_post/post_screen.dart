import 'package:chat_firebase/layout/home_cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/app_strings.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("New Post"),
            titleSpacing: 0,
            actions: [
              TextButton(onPressed: () {

                var now = DateTime.now();

                if(HomeCubit.get(context).imagePost!=null){
                  HomeCubit.get(context).uploadPostImage(dateTime: now.toString(), text: textController.text.toString());
                }else{
                  HomeCubit.get(context).createPost(dateTime: now.toString(), text: textController.text.toString());
                }

              }, child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(AppStrings.post,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ))
            ],
          ),
          body: Column(
            children: [
              if(state is creatPostLoadingState || state is UploadingImageLoadingState)
              LinearProgressIndicator(),
              Row(
                children: [
                   CircleAvatar(
                    radius: 25,
                    backgroundImage:
                    NetworkImage(
                       HomeCubit.get(context).userModel?.image ?? 'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360'
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        HomeCubit.get(context).userModel?.name
                        ??"Jesy Apple",
                        style: TextStyle(height: 1.3, color: Colors.black),),

                    ],
                  )),



                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'what is your post ...',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              if(HomeCubit.get(context).imagePost != null)
                Stack(
                  children: [ Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(HomeCubit.get(context).imagePost!) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                    Positioned(top: 5,
                        right: 5,
                        child: IconButton(onPressed: () {
                          HomeCubit.get(context).removeImagePost();
                        },
                            icon: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.close))))
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(onPressed: (){
                      HomeCubit.get(context).getimagePost();
                    }, child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 5,),
                        Text("add photo")
                      ],
                    )),
                  ),
                  Expanded(
                    child: TextButton(onPressed: (){}, child:Text("# Tags")),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
