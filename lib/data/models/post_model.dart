class PostModel{
  late String name;
  late String uId;
  late String image;
  late String dateTime;
  late String text;
  late String postImage;

  bool isEmailVerfied =false;
  PostModel(
      {required this.name,
      required this.uId,
      required this.image,
      required this.dateTime,
      required this.text,
      required this.postImage});

  PostModel.fromJson(Map<String,dynamic>? json){
    name = json?["name"] ?? "";
    dateTime = json?["dateTime"]??"";
    uId = json?["uId"]??"";
    image = json?["image"]??"";
    text = json?["text"]??"";
    postImage = json?["postImage"]??"";
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name ,
      'dateTime' : dateTime,
      'text' : text,
      'uId' : uId,
      'postImage' : postImage,
      'image' : image,

      'isEmailVerfied' : isEmailVerfied ,
    };
  }

}