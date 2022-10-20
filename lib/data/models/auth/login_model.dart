class LoginModel{
   String? code;
   String? message;
   String? token;

  LoginModel.fromJson(Map<String,dynamic> json,){
  code = json['code'];
  message = json['message'];
  token = json['data']['accessToken'];
  }
}