class requst_login {
  requst_login({
      this.phone, 
      this.password,});

  requst_login.fromJson(dynamic json) {
    phone = json['phone'];
    password = json['password'];
  }
  String? phone;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }

}