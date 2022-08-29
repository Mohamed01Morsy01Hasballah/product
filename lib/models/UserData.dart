class UserData{
  dynamic id;
  String? email;
  String? userName;
  String? password;
  String? phone;
  UserData({
    required this.id,
    required this.phone,
    required this.userName,
    required this.email,
    required this.password,

  });
  UserData.fromJson(Map<String,dynamic>json){
    id=json['id'];
    email=json['email'];
    userName=json['userName'];
    password=json['password'];
    phone=json['phone'];
  }
}