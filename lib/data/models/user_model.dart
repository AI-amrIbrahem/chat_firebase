class UserModel{
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String image;
  late String cover;

  bool isEmailVerfied =false;
  UserModel({required this.name, required this.email,required this.image,required this.cover, required this.phone, required this.uId,isEmailVerfied = false});

  UserModel.fromJson(Map<String,dynamic>? json){
    name = json?["name"] ?? "";
    email = json?["email"] ?? "";
    phone = json?["phone"]??"";
    uId = json?["uId"]??"";
    image = json?["image"]??"";
    cover = json?["cover"]??"";
    isEmailVerfied = json?["isEmailVerfied"]??"";
  }

  Map<String,dynamic> toMap(){
    return {
    'name' : name ,
    'email' : email,
    'phone' : phone,
      'uId' : uId,
      'cover' : cover,
      'image' : image,

      'isEmailVerfied' : isEmailVerfied ,
    };
  }

}