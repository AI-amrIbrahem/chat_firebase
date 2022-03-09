import 'package:chat_firebase/data/models/post_model.dart';
import 'package:chat_firebase/data/models/user_model.dart';
import 'package:chat_firebase/layout/home_cubit/home_cubit.dart';
import 'package:chat_firebase/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/app_strings.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 10,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                      width: double.infinity,
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-pink_23-2149012668.jpg?w=1380'),
                      fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppStrings.connectWith,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => postCard(HomeCubit.get(context).postsList[index],HomeCubit.get(context)!.userModel!,context,index),
              itemCount: HomeCubit.get(context).postsList.length,
            )
          ],
        ),
      ),
    );
  },
);
  }

  Widget postCard(PostModel model,UserModel userModel,BuildContext context,int index) {
    return Card(
        elevation: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                   CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      model.image.toString(), //?? 'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360'
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:  [
                          Text(
                            model.name,
                            style: TextStyle(height: 1.3, color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle_sharp,
                            color: Colors.blue,
                            size: 16,
                          )
                        ],
                      ),
                      Text(
                        model.dateTime,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.3),
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 16,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                model.text,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              if(model.postImage!=null&&model.postImage.isNotEmpty)
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image:  DecorationImage(
                      image: NetworkImage(
                        model.postImage),//'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-pink_23-2149012668.jpg?w=1380'),
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              HomeCubit.get(context).likes[index].toString(),
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment,
                              color: AppColors.primary,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "120",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "  comments",
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                         CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                             userModel.image,),// 'https://img.freepik.com/free-photo/portrait-stylish-senior-woman-model_23-2149012660.jpg?w=360'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "write a comment ... ",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      HomeCubit.get(context).likePost(HomeCubit.get(context).postsListId[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Love",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
