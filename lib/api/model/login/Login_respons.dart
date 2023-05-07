class LoginRespons {
  LoginRespons({
  this.token,this.message});

  LoginRespons.fromJson(dynamic json){
    token: json['token'];
    message: json['message'];

  }

  String? token;
  String?message;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['message'] = message;

    return map;
  }

}