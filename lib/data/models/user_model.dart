class UserModel{
  late String name;
  late String email;
  late String phone;
  late String uId;
  bool isEmailVerfied =false;
  UserModel({required this.name, required this.email, required this.phone, required this.uId,isEmailVerfied = false});

  UserModel.fromJson(Map<String,dynamic>? json){
    name = json?["name"] ?? "";
    email = json?["email"] ?? "";
    phone = json?["phone"]??"";
    uId = json?["uId"]??"";
    isEmailVerfied = json?["isEmailVerfied"]??"";
  }

  Map<String,dynamic> toMap(){
    return {
    'name' : name ,
    'email' : email,
    'phone' : phone,
    'isEmailVerfied' : isEmailVerfied ,
    };
  }

}